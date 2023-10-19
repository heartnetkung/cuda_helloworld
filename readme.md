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

# test

# argument parsing