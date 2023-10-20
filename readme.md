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

## Installation on Ubuntu 18 (my machine)

### CUDA
Since the latest cuda doesn't support Ubuntu 18, we have to manually install version 11.8 as described in this [link](https://docs.nvidia.com/cuda/archive/11.8.0/cuda-installation-guide-linux/index.html)

```bash
#Remove Outdated Signing Key
sudo apt-key del 7fa2af80

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get install cuda-toolkit-11-8
sudo reboot

#copy this line to ~/.bashrc
#export PATH=$PATH:/usr/local/cuda-11.8/bin
```

### Cmake
```bash
mkdir -p cmake
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake
```

# test

# argument parsing