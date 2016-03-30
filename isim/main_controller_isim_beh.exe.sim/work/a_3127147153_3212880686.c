/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/aviral/CS 254 Proj/ElevatorControl/Door_controller.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_1306455576397931277_3965413181(char *, char *, char *, char *, char *);
unsigned char ieee_p_3620187407_sub_1366267000076357978_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3127147153_3212880686_p_0(char *t0)
{
    char t15[16];
    char t18[16];
    char t21[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    int t24;
    char *t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1472U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3464);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 1672U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB14;

LAB15:    t1 = (unsigned char)0;

LAB16:    if (t1 != 0)
        goto LAB11;

LAB13:    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB21;

LAB22:    t1 = (unsigned char)0;

LAB23:    if (t1 != 0)
        goto LAB19;

LAB20:    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB24;

LAB25:
LAB12:    goto LAB3;

LAB5:    t4 = (t0 + 1512U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 3544);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 5702);
    t5 = (t0 + 3608);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 9U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3672);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(55, ng0);
    t13 = (t0 + 1992U);
    t14 = *((char **)t13);
    t13 = (t0 + 5656U);
    t19 = (t0 + 5720);
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 0;
    t23 = (t22 + 4U);
    *((int *)t23) = 8;
    t23 = (t22 + 8U);
    *((int *)t23) = 1;
    t24 = (8 - 0);
    t17 = (t24 * 1);
    t17 = (t17 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t17;
    t23 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t18, t14, t13, t19, t21);
    t25 = (t18 + 12U);
    t17 = *((unsigned int *)t25);
    t26 = (1U * t17);
    t9 = (9U != t26);
    if (t9 == 1)
        goto LAB17;

LAB18:    t27 = (t0 + 3608);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t23, 9U);
    xsi_driver_first_trans_fast(t27);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3672);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3544);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB12;

LAB14:    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t2 = (t0 + 5656U);
    t8 = (t0 + 5711);
    t12 = (t15 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 8;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t16 = (8 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t17;
    t7 = ieee_p_3620187407_sub_1366267000076357978_3965413181(IEEE_P_3620187407, t5, t2, t8, t15);
    t1 = t7;
    goto LAB16;

LAB17:    xsi_size_not_matching(9U, t26, 0);
    goto LAB18;

LAB19:    xsi_set_current_line(59, ng0);
    t13 = (t0 + 3544);
    t14 = (t13 + 56U);
    t19 = *((char **)t14);
    t20 = (t19 + 56U);
    t22 = *((char **)t20);
    *((unsigned char *)t22) = (unsigned char)2;
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3672);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB12;

LAB21:    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t2 = (t0 + 5656U);
    t8 = (t0 + 5729);
    t12 = (t15 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 8;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t16 = (8 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t17;
    t7 = ieee_p_3620187407_sub_1306455576397931277_3965413181(IEEE_P_3620187407, t5, t2, t8, t15);
    t1 = t7;
    goto LAB23;

LAB24:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3672);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB12;

}


extern void work_a_3127147153_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3127147153_3212880686_p_0};
	xsi_register_didat("work_a_3127147153_3212880686", "isim/main_controller_isim_beh.exe.sim/work/a_3127147153_3212880686.didat");
	xsi_register_executes(pe);
}
