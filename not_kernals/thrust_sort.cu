#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/generate.h>
#include <thrust/sort.h>
#include <thrust/copy.h>
#include <thrust/random.h>

#include <iostream>
#include <fstream>
#include <chrono>

int main() {
  // Start timing for GPU
  auto start_gpu = std::chrono::high_resolution_clock::now();

  // Generate 32M random numbers serially.
  thrust::default_random_engine rng(1337);
  thrust::uniform_int_distribution<int> dist;
  thrust::host_vector<int> h_vec(32 << 20);
  thrust::generate(h_vec.begin(), h_vec.end(), [&] { return dist(rng); });

  // Transfer data to the device.
  thrust::device_vector<int> d_vec = h_vec;
  
  // Sort data on the device.
  thrust::sort(d_vec.begin(), d_vec.end());

  // Transfer data back to host.
  thrust::copy(d_vec.begin(), d_vec.end(), h_vec.begin());

  // Stop timing for GPU
  auto end_gpu = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed_gpu = end_gpu - start_gpu;

  // Start timing for CPU
  auto start_cpu = std::chrono::high_resolution_clock::now();

  // Generate 32M random numbers serially.
  thrust::generate(h_vec.begin(), h_vec.end(), [&] { return dist(rng); });

  // Sort data on the host.
  thrust::sort(h_vec.begin(), h_vec.end());

  // Stop timing for CPU
  auto end_cpu = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed_cpu = end_cpu - start_cpu;

  // Save output to file
  std::ofstream outfile("/home/nova/workspace/cuda-samples/parawhat/output.txt");
  outfile << "Elapsed time (GPU): " << elapsed_gpu.count() << " seconds" << std::endl;
  outfile << "Elapsed time (CPU): " << elapsed_cpu.count() << " seconds" << std::endl;
  outfile.close();

  return 0;
}
