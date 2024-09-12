#include <stdio.h>
#include <cufft.h>

// 定义一些常量
#define NX 256 // 定义变换的x维度大小
#define NY 256 // 定义变换的y维度大小
#define BATCH 1 // 批处理大小

// CUDA错误检查宏
#define CUDA_CHECK_ERROR(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true) {
   if (code != cudaSuccess) {
      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}

// cuFFT错误检查宏
#define CUFFT_CHECK_ERROR(ans) { cufftAssert((ans), __FILE__, __LINE__); }
inline void cufftAssert(cufftResult code, const char *file, int line, bool abort=true) {
   if (code != CUFFT_SUCCESS) {
      fprintf(stderr,"CUFFTassert: %d %s %d\n", code, file, line);
      if (abort) exit(code);
   }
}

int main() {
    cufftHandle plan;
    cufftComplex *data;
    cufftComplex *data_out;
    cufftComplex *data_inverted;

    // 分配内存
    CUDA_CHECK_ERROR(cudaMalloc((void**)&data, sizeof(cufftComplex) * NX * NY));
    CUDA_CHECK_ERROR(cudaMalloc((void**)&data_out, sizeof(cufftComplex) * NX * NY));
    CUDA_CHECK_ERROR(cudaMalloc((void**)&data_inverted, sizeof(cufftComplex) * NX * NY));

    // 创建一个2D FFT计划
    CUFFT_CHECK_ERROR(cufftPlan2d(&plan, NX, NY, CUFFT_C2C));

    // 初始化输入数据（这里仅作为示例，实际应用中应填充有意义的数据）
    cufftComplex init_data[NX * NY];
    for (int i = 0; i < NX * NY; i++) {
        init_data[i].x = i; // 实部
        init_data[i].y = 0; // 虚部
    }

    // 将数据复制到GPU
    CUDA_CHECK_ERROR(cudaMemcpy(data, init_data, sizeof(cufftComplex) * NX * NY, cudaMemcpyHostToDevice));

    // 执行正向FFT
    CUFFT_CHECK_ERROR(cufftExecC2C(plan, data, data_out, CUFFT_FORWARD));

    // 执行逆向FFT
    CUFFT_CHECK_ERROR(cufftExecC2C(plan, data_out, data_inverted, CUFFT_INVERSE));

    // 将逆变换结果复制回主机
    CUDA_CHECK_ERROR(cudaMemcpy(init_data, data_inverted, sizeof(cufftComplex) * NX * NY, cudaMemcpyDeviceToHost));

    // 归一化逆变换结果
    for (int i = 0; i < NX * NY; i++) {
        init_data[i].x /= (NX * NY);
        init_data[i].y /= (NX * NY);
    }

    // 打印逆变换结果的前几个元素
    for (int i = 0; i < 10; i++) {
        printf("Element %d: %f + %fi\n", i, init_data[i].x, init_data[i].y);
    }

    // 释放内存和计划
    CUDA_CHECK_ERROR(cudaFree(data));
    CUDA_CHECK_ERROR(cudaFree(data_out));
    CUDA_CHECK_ERROR(cudaFree(data_inverted));
    CUFFT_CHECK_ERROR(cufftDestroy(plan));

    return 0;
}
