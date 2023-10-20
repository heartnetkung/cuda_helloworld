## Useful Commands
```bash
# testing installation
nvcc --version

# compile and run
nvcc -o runnable.o src/addv1.cu
./runnable.o

# profile code
nvprof --unified-memory-profiling off --print-gpu-summary ./runnable.o
```

## Cmake
```bash
mkdir build;cd build;cmake ..;make;./tests
```

## Installation
```bash
sudo apt install nvidia-cuda-toolkit
mkdir -p cmake
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake
```

# test

# argument parsing