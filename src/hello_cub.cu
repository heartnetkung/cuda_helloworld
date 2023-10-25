// #include <cub/device/device_reduce.cuh>
#include <cub/device/device_reduce.cuh>

// CustomMin functor
struct CustomMin
{
	template <typename T>
	CUB_RUNTIME_FUNCTION __forceinline__
	T operator()(const T &a, const T &b) const {
		return (b < a) ? b : a;
	}
};

using namespace cub;


int main() {
	// Declare, allocate, and initialize device-accessible pointers for input and output
	int          num_items = 8;        // e.g., 8
	int          *d_keys_in;         // e.g., [0, 2, 2, 9, 5, 5, 5, 8]
	int          *d_values_in;       // e.g., [0, 7, 1, 6, 2, 5, 3, 4]
	int          *d_unique_out;      // e.g., [-, -, -, -, -, -, -, -]
	int          *d_aggregates_out;  // e.g., [-, -, -, -, -, -, -, -]
	int          *d_num_runs_out;    // e.g., [-]
	CustomMin    reduction_op;

	cudaMallocManaged((void**)&d_keys_in, sizeof(int) * num_items);
	cudaMallocManaged((void**)&d_values_in, sizeof(int) * num_items);

	int i = 0;
	d_keys_in[i++] = 0; d_keys_in[i++] = 2; d_keys_in[i++] = 2; d_keys_in[i++] = 9;
	d_keys_in[i++] = 5; d_keys_in[i++] = 5; d_keys_in[i++] = 5; d_keys_in[i++] = 8;

	i = 0;
	d_values_in[i++] = 0; d_values_in[i++] = 7; d_values_in[i++] = 1; d_values_in[i++] = 6;
	d_values_in[i++] = 2; d_values_in[i++] = 5; d_values_in[i++] = 3; d_values_in[i++] = 4;

	// Determine temporary device storage requirements
	void     *d_temp_storage = NULL;
	size_t   temp_storage_bytes = 0;
	cub::DeviceReduce::ReduceByKey(d_temp_storage, temp_storage_bytes, d_keys_in, d_unique_out, d_values_in, d_aggregates_out, d_num_runs_out, reduction_op, num_items);
	// Allocate temporary storage
	cudaMalloc(&d_temp_storage, temp_storage_bytes);
	// Run reduce-by-key
	cub::DeviceReduce::ReduceByKey(d_temp_storage, temp_storage_bytes, d_keys_in, d_unique_out, d_values_in, d_aggregates_out, d_num_runs_out, reduction_op, num_items);
	// d_unique_out      <-- [0, 2, 9, 5, 8]
	// d_aggregates_out  <-- [0, 1, 6, 2, 4]
	// d_num_runs_out    <-- [5]
	return 0;
}