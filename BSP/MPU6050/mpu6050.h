#ifndef __MPU6050_H
#define __MPU6050_H
#include "empty.h"    // 空头文件，用于平台兼容性

/********************** 传感器初始化与数据读取 **********************/
/**
  * @brief  初始化MPU6050传感器
  * @note   必须在使用前调用，配置传感器工作模式
  */
void mpu6050_init(void);

/**
  * @brief  读取MPU6050原始数据
  * @param  gyro 陀螺仪原始数据输出数组[x,y,z]
  * @param  accel 加速度计原始数据输出数组[x,y,z]
  * @param  temperature 温度值输出指针(单位:℃)
  */
void mpu6050_read(int16_t *gyro, int16_t *accel, float *temperature);

/********************** 传感器数据结构定义 **********************/
typedef struct 
{
    // 姿态欧拉角(单位:度)
    float Pitch;  // X轴俯仰角(-90°~+90°)
    float Roll;   // Y轴横滚角(-180°~+180°)
    float Yaw;    // Z轴偏航角(0°~360°，随时间累积)
    
    // 传感器数据
    float temperature;  // 芯片温度(℃)
    
    // 原始传感器读数(未处理)
    int16_t Accel_Original[3];  // 原始加速度计数据(LSB)
    int16_t Gyro_Original[3];   // 原始陀螺仪数据(LSB)
    
    // 校准偏移量(自动计算)
    float Accel_Offset[3];  // 加速度计零偏校准值
    float Gyro_Offset[3];   // 陀螺仪零偏校准值
    
    // 校准后数据(原始值-偏移量)
    float Accel_Calulate[3];  // 校准后加速度值
    float Gyro_Calulate[3];   // 校准后陀螺仪值
    
    // 滤波后数据
    float Accel_Average[3];  // 滤波后加速度值(使用卡尔曼滤波)
    float Gyro_Average[3];   // 滤波后陀螺仪值(使用一阶低通滤波)
    
} MPU6050_DEF;

/********************** 全局变量声明 **********************/
extern MPU6050_DEF mpu6050;  // MPU6050全局数据结构体

// Z轴角速度测量值(单位:度/秒)
extern float Gyro_Z_Measeure;  

/********************** 数据处理函数 **********************/
/**
  * @brief  传感器数据处理
  * @note   包含校准和滤波处理，需定期调用(建议10ms)
  */
void MPU6050_ReadDatas_Proc(void);

/**
  * @brief  获取欧拉角姿态
  * @note   融合加速度计和陀螺仪数据，需定期调用(建议10ms)
  *         结果存储在mpu6050.Pitch/Roll/Yaw中
  */
void AHRS_Geteuler(void);

/********************** 卡尔曼滤波器结构体 **********************/
struct KalmanFilter{
    float LastP;  // 上次估计误差协方差
    float NewP;   // 当前估计误差协方差
    float Out;    // 卡尔曼滤波器输出
    float Kg;     // 卡尔曼增益
    float Q;      // 过程噪声协方差(系统噪声)
    float R;      // 观测噪声协方差(测量噪声)
};

/********************** 数学工具宏定义 **********************/
#define M_PI           (float)3.1415926535f       // 圆周率π
#define squa(Sq)       (((float)Sq)*((float)Sq))  // 平方计算
#define toRad(Math_D)  ((float)(Math_D)*0.0174532925f) // 角度转弧度
#define toDeg(Math_R)  ((float)(Math_R)*57.2957795f)   // 弧度转角度
#define absu16(Math_X) (Math_X<0? -Math_X:Math_X) // 16位无符号数取绝对值
#define absFloat(Math_X) (Math_X<0? -Math_X:Math_X) // 浮点数取绝对值

/********************** 数字滤波函数 **********************/
/**
  * @brief  IIR直接I型滤波器
  * @param  InData 输入数据
  * @param  x 输入数据缓存数组
  * @param  y 输出数据缓存数组
  * @param  b 分子系数数组
  * @param  nb 分子系数个数
  * @param  a 分母系数数组
  * @param  na 分母系数个数
  * @return 滤波后输出数据
  */
double IIR_I_Filter(double InData, double *x, double *y, 
                   double *b, short nb, double *a, short na);

/**
  * @brief  一阶低通滤波器
  * @param  oldData 上次滤波值
  * @param  newData 新采样值
  * @param  lpf_factor 滤波系数(0~1)
  * @return 滤波后输出数据
  */
float LPF_1st(float oldData, float newData, float lpf_factor);

/**
  * @brief  一维卡尔曼滤波器
  * @param  EKF 卡尔曼滤波器结构体指针
  * @param  input 输入数据
  */
void kalmanfiter(struct KalmanFilter *EKF, float input);

#endif