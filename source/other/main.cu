#include <stdio.h>
#include <cuda_runtime.h>
#include <cufft.h>

#define NX 64 // 矩阵的宽度
#define BATCH 1 // 批处理大小

// CUDA 错误检查宏
#define CUDA_CHECK_ERROR(err) \
    if (err != cudaSuccess) { \
        fprintf(stderr, "CUDA Error: %s\n", cudaGetErrorString(err)); \
        exit(-1); \
    }

// CUFFT 错误检查宏
#define CUFFT_CHECK_ERROR(err) \
    if (err != CUFFT_SUCCESS) { \
        fprintf(stderr, "CUFFT Error: %d\n", err); \
        exit(-1); \
    }

int main() {
    cufftHandle plan;
    cufftReal *data;
    cufftComplex *data_freq;
    cufftReal *data_ifft;
    size_t alloc_size, work_size;
    cufftResult cufft_status;
    cudaError_t cuda_status;

    // 分配内存
    alloc_size = sizeof(cufftReal) * NX * NX;
    cuda_status = cudaMalloc((void **)&data, alloc_size);
    CUDA_CHECK_ERROR(cuda_status);

    alloc_size = sizeof(cufftComplex) * (NX / 2 + 1) * NX;
    cuda_status = cudaMalloc((void **)&data_freq, alloc_size);
    CUDA_CHECK_ERROR(cuda_status);

    alloc_size = sizeof(cufftReal) * NX * NX;
    cuda_status = cudaMalloc((void **)&data_ifft, alloc_size);
    CUDA_CHECK_ERROR(cuda_status);

    // 创建CUFFT计划
    cufft_status = cufftPlan2d(&plan, NX, NX, CUFFT_R2C);
    CUFFT_CHECK_ERROR(cufft_status);

    // 初始化矩阵并复制到设备内存
    cufftReal h_data[NX * NX];
    for (int i = 0; i < NX * NX; ++i) {
        h_data[i] = (cufftReal)i;
    }
    cuda_status = cudaMemcpy(data, h_data, alloc_size, cudaMemcpyHostToDevice);
    CUDA_CHECK_ERROR(cuda_status);

    // 执行前10个数字的输出
    cufftReal h_data_output[NX * NX];
    cudaMemcpy(h_data_output, data, 10 * sizeof(cufftReal), cudaMemcpyDeviceToHost);
    for (int i = 0; i < 10; ++i) {
        printf("%f ", h_data_output[i]);
    }
    printf("\n");

    // 执行傅立叶变换
    cufft_status = cufftExecR2C(plan, data, data_freq);
    CUFFT_CHECK_ERROR(cufft_status);

    // 归一化
    float norm_factor = 1.0 / (NX * NX);
    cuda_status = cudaMemset(data_ifft, 0, alloc_size);
    CUDA_CHECK_ERROR(cuda_status);
    cufft_status = cufftExecC2R(plan, data_freq, data_ifft);
    CUFFT_CHECK_ERROR(cufft_status);

    // 逆变换后输出前10个数字
    cudaMemcpy(h_data_output, data_ifft, 10 * sizeof(cufftReal), cudaMemcpyDeviceToHost);
    for (int i = 0; i < 10; ++i) {
        printf("%f ", h_data_output[i] * norm_factor);
    }
    printf("\n");

    // 释放资源
    cufftDestroy(plan);
    cudaFree(data);
    cudaFree(data_freq);
    cudaFree(data_ifft);

    return 0;
}
