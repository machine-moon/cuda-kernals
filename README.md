# CUDA Kernels

This repository contains example CUDA kernels and documentation to help you get started with CUDA programming.

## Repository Structure

```
cuda-kernals/
├── not_kernels/
│   ├── add1.cu
│   ├── add2.cu
│   └── helloworld.cu
├── README.md
└── .gitignore
```

## Getting Started

### Prerequisites

- NVIDIA GPU
- CUDA Toolkit installed
- NVIDIA Driver installed

### Running the Kernels

To compile and run the CUDA kernels, use the following commands:

```sh
nvcc not_kernels/helloworld.cu -o kernel1
./kernel1

nvcc not_kernels/add1.cu -o kernel2
./kernel2
```

## CUDA Installation

CUDA is essential for leveraging the GPU for machine learning tasks. Below are the steps to install CUDA on your system.

### Step 1: Download and Install CUDA Toolkit (Base & Driver Installer)

Visit the [CUDA Downloads page](https://developer.nvidia.com/cuda-downloads) and select your operating system, architecture, distribution, and version. Follow the instructions provided for your specific setup.

**Note:** This guide assumes you are working in WSL. The setup process involves installing the base components within WSL, while the GPU driver is installed on the Windows host system.

### Step 2: Install the NVIDIA Driver

For WSL, you need the driver from: [NVIDIA Driver Downloads](https://www.nvidia.com/Download/index.aspx)

### Step 3: Install CUDA Toolkit in WSL

Run the following commands in your WSL terminal:

```sh
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-5
```

### Post-installation Actions

These actions must be manually performed after installation before the CUDA Toolkit and Driver can be used.

#### Environment Setup

Add the CUDA path to the PATH variable:

```sh
export PATH=/usr/local/cuda-12.5/bin${PATH:+:${PATH}}
```

#### Verify the Installation

Verify that the CUDA toolkit can find and communicate correctly with the CUDA-capable hardware by compiling and running some of the sample programs, located in [NVIDIA CUDA Samples](https://github.com/nvidia/cuda-samples).

##### Verify the Driver Version

If you installed the driver, verify that the correct version of it is loaded:

```sh
nvidia-smi
nvcc --version
```

### Additional Resources

- [CUDA Documentation](https://docs.nvidia.com/cuda/)
- [GPU-Accelerated Libraries](https://developer.nvidia.com/gpu-accelerated-libraries)
- [WSL User Guide](https://docs.nvidia.com/cuda/wsl-user-guide/index.html)
- [NVIDIA Open Source](https://developer.nvidia.com/open-source)
- [CUDA Zone](https://developer.nvidia.com/cuda-zone)
- [NVIDIA NGX](https://docs.nvidia.com/ngx/index.html)

For WSL users, get the Windows driver from [NVIDIA Compute Software Support on WSL 2](https://docs.nvidia.com/cuda/wsl-user-guide/index.html#nvidia-compute-software-support-on-wsl-2), then get the toolkit and select WSL2 Ubuntu.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
