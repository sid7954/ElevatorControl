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
static const char *ng0 = "/home/aviral/CS 254 Proj/ElevatorControl/Memory.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_3620187407_sub_1366267000076357978_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3392787015_3212880686_p_0(char *t0)
{
    char t18[16];
    char t19[16];
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
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4104);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(80, ng0);
    t4 = (t0 + 1512U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)2);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 4184);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 6913);
    t5 = (t0 + 4312);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 10U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 6923);
    t5 = (t0 + 4248);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 10U);
    xsi_driver_first_trans_fast_port(t5);

LAB9:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 4440);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t4, 3U);
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(82, ng0);
    t4 = (t0 + 1832U);
    t11 = *((char **)t4);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 != 0)
        goto LAB11;

LAB13:
LAB12:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t2 = (t0 + 6768U);
    t5 = (t0 + 1192U);
    t8 = *((char **)t5);
    t5 = (t0 + 6720U);
    t1 = ieee_p_3620187407_sub_1366267000076357978_3965413181(IEEE_P_3620187407, t4, t2, t8, t5);
    if (t1 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 6784U);
    t5 = (t0 + 6903);
    t11 = (t19 + 0U);
    t14 = (t11 + 0U);
    *((int *)t14) = 0;
    t14 = (t11 + 4U);
    *((int *)t14) = 9;
    t14 = (t11 + 8U);
    *((int *)t14) = 1;
    t21 = (9 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t14 = (t11 + 12U);
    *((unsigned int *)t14) = t22;
    t14 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t18, t4, t2, t5, t19);
    t15 = (t18 + 12U);
    t22 = *((unsigned int *)t15);
    t24 = (1U * t22);
    t1 = (10U != t24);
    if (t1 == 1)
        goto LAB19;

LAB20:    t16 = (t0 + 4312);
    t17 = (t16 + 56U);
    t20 = *((char **)t17);
    t23 = (t20 + 56U);
    t25 = *((char **)t23);
    memcpy(t25, t14, 10U);
    xsi_driver_first_trans_fast(t16);

LAB15:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 4184);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t8 = ((IEEE_P_2592010699) + 4000);
    t11 = (t0 + 6720U);
    t14 = (t0 + 6736U);
    t2 = xsi_base_array_concat(t2, t18, t8, (char)97, t4, t11, (char)97, t5, t14, (char)101);
    t22 = (3U + 9U);
    t1 = (12U != t22);
    if (t1 == 1)
        goto LAB21;

LAB22:    t15 = (t0 + 4376);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t20 = (t17 + 56U);
    t23 = *((char **)t20);
    memcpy(t23, t2, 12U);
    xsi_driver_first_trans_fast(t15);
    goto LAB9;

LAB11:    xsi_set_current_line(83, ng0);
    t4 = (t0 + 4184);
    t14 = (t4 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 4248);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t4, 10U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB12;

LAB14:    xsi_set_current_line(89, ng0);
    t11 = (t0 + 2152U);
    t14 = *((char **)t11);
    t11 = (t0 + 6784U);
    t15 = (t0 + 6893);
    t17 = (t19 + 0U);
    t20 = (t17 + 0U);
    *((int *)t20) = 0;
    t20 = (t17 + 4U);
    *((int *)t20) = 9;
    t20 = (t17 + 8U);
    *((int *)t20) = 1;
    t21 = (9 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t20 = (t17 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t18, t14, t11, t15, t19);
    t23 = (t18 + 12U);
    t22 = *((unsigned int *)t23);
    t24 = (1U * t22);
    t3 = (10U != t24);
    if (t3 == 1)
        goto LAB17;

LAB18:    t25 = (t0 + 4312);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t20, 10U);
    xsi_driver_first_trans_fast(t25);
    goto LAB15;

LAB17:    xsi_size_not_matching(10U, t24, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(10U, t24, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(12U, t22, 0);
    goto LAB22;

}


extern void work_a_3392787015_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3392787015_3212880686_p_0};
	xsi_register_didat("work_a_3392787015_3212880686", "isim/bench2_isim_beh.exe.sim/work/a_3392787015_3212880686.didat");
	xsi_register_executes(pe);
}
