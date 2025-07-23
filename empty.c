#include "ti_msp_dl_config.h"
#include "board.h"
#include "lcd_init.h"
#include "lcd.h"
#include "pic.h"
#include "mpu6050.h"

int main(void)
{
    SYSCFG_DL_init();
    LCD_Init();
    mpu6050_init();
    // 串口输出测试
    //lc_printf("Hello %s\r\n","World");
	while(1)
	{
        AHRS_Geteuler();
        LCD_Fill(0, 0, 128, 128, WHITE);
        LCD_ShowString(0,0,"LCD_B:",RED,WHITE,12,0);
        LCD_ShowIntNum(12, 0, mpu6050.Yaw, 4, RED, WHITE, 12);
	}
}
