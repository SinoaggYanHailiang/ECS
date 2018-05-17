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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/2_FPGA_program/Proj_ECS_sinoagg_v2_fft256_dac8551_fir/Proj_ECS/src/GenWave.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {32767U, 0U};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {16383, 0};
static int ng5[] = {1, 0};



static void Always_58_0(char *t0)
{
    char t17[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 5032);
    *((int *)t2) = 1;
    t3 = (t0 + 4000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);

LAB5:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1688U);
    t11 = *((char **)t5);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 15, t4, 15, t11, 12);
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t17, 0, 0, 15, 0LL);

LAB14:
LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(61, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 15, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(63, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 15, 0LL);
    goto LAB11;

LAB12:    xsi_set_current_line(65, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3048);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t0 + 1688U);
    t16 = *((char **)t15);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 15, t14, 15, t16, 12);
    memset(t18, 0, 8);
    t15 = (t11 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB16;

LAB15:    t19 = (t17 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB16;

LAB19:    if (*((unsigned int *)t11) > *((unsigned int *)t17))
        goto LAB17;

LAB18:    t21 = (t18 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t18);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1688U);
    t11 = *((char **)t5);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 15, t4, 15, t11, 12);
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t17, 0, 0, 15, 0LL);

LAB22:    goto LAB14;

LAB16:    t20 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB18;

LAB17:    *((unsigned int *)t18) = 1;
    goto LAB18;

LAB20:    xsi_set_current_line(66, ng0);
    t27 = ((char*)((ng2)));
    t28 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t28, t27, 0, 0, 15, 0LL);
    goto LAB22;

}

static void Always_73_1(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 5048);
    *((int *)t2) = 1;
    t3 = (t0 + 4248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(74, ng0);

LAB5:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 1);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 16383U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 16383U);
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 14, 0LL);

LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(76, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 14, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(78, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB15;

LAB12:    if (t25 != 0)
        goto LAB14;

LAB13:    *((unsigned int *)t13) = 1;

LAB15:    t29 = (t13 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t13);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB16;

LAB17:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 1);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 16383U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 16383U);
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 14, 0LL);

LAB18:    goto LAB11;

LAB14:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB15;

LAB16:    xsi_set_current_line(79, ng0);
    t35 = ((char*)((ng3)));
    t36 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t36, t35, 0, 0, 14, 0LL);
    goto LAB18;

}

static void Always_86_2(char *t0)
{
    char t13[8];
    char t14[8];
    char t22[8];
    char t24[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t25;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 5064);
    *((int *)t2) = 1;
    t3 = (t0 + 4496);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);

LAB5:    xsi_set_current_line(88, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    t11 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_rshift(t13, 32, t5, 32, t11, 32);
    memset(t14, 0, 8);
    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB10:    t15 = (t13 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t4) > *((unsigned int *)t13))
        goto LAB13;

LAB12:    *((unsigned int *)t14) = 1;

LAB13:    t17 = (t14 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    t11 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_rshift(t13, 32, t5, 32, t11, 32);
    memset(t14, 0, 8);
    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB20;

LAB19:    t15 = (t13 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB20;

LAB23:    if (*((unsigned int *)t4) > *((unsigned int *)t13))
        goto LAB21;

LAB22:    t17 = (t14 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(101, ng0);

LAB28:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng4)));
    t3 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_signed_rshift(t13, 32, t2, 32, t3, 32);
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t13, 0, 0, 14, 0LL);

LAB26:
LAB17:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(89, ng0);

LAB9:    xsi_set_current_line(90, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 14, 0LL);
    goto LAB8;

LAB11:    t16 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB13;

LAB15:    xsi_set_current_line(93, ng0);

LAB18:    xsi_set_current_line(94, ng0);
    t18 = (t0 + 2568);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng5)));
    memset(t22, 0, 8);
    xsi_vlog_unsigned_lshift(t22, 14, t20, 14, t21, 32);
    t23 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 14, 0LL);
    goto LAB17;

LAB20:    t16 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB22;

LAB21:    *((unsigned int *)t14) = 1;
    goto LAB22;

LAB24:    xsi_set_current_line(97, ng0);

LAB27:    xsi_set_current_line(98, ng0);
    t18 = ((char*)((ng4)));
    t19 = (t0 + 2568);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memset(t22, 0, 8);
    xsi_vlog_unsigned_minus(t22, 32, t18, 32, t21, 14);
    t23 = ((char*)((ng5)));
    memset(t24, 0, 8);
    xsi_vlog_unsigned_lshift(t24, 32, t22, 32, t23, 32);
    t25 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t25, t24, 0, 0, 14, 0LL);
    goto LAB26;

}

static void Always_106_3(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 5080);
    *((int *)t2) = 1;
    t3 = (t0 + 4744);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(107, ng0);

LAB5:    xsi_set_current_line(108, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1848U);
    t11 = *((char **)t5);
    memset(t13, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB11;

LAB10:    t12 = (t11 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t4) > *((unsigned int *)t11))
        goto LAB13;

LAB12:    *((unsigned int *)t13) = 1;

LAB13:    t15 = (t13 + 4);
    t6 = *((unsigned int *)t15);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1848U);
    t11 = *((char **)t5);
    memset(t13, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB20;

LAB19:    t12 = (t11 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB20;

LAB23:    if (*((unsigned int *)t4) > *((unsigned int *)t11))
        goto LAB21;

LAB22:    t15 = (t13 + 4);
    t6 = *((unsigned int *)t15);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(121, ng0);

LAB28:    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng4)));
    t3 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_signed_rshift(t13, 32, t2, 32, t3, 32);
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t13, 0, 0, 14, 0LL);

LAB26:
LAB17:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(109, ng0);

LAB9:    xsi_set_current_line(110, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 14, 0LL);
    goto LAB8;

LAB11:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB13;

LAB15:    xsi_set_current_line(113, ng0);

LAB18:    xsi_set_current_line(114, ng0);
    t16 = ((char*)((ng3)));
    t17 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 14, 0LL);
    goto LAB17;

LAB20:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB22;

LAB21:    *((unsigned int *)t13) = 1;
    goto LAB22;

LAB24:    xsi_set_current_line(117, ng0);

LAB27:    xsi_set_current_line(118, ng0);
    t16 = ((char*)((ng4)));
    t17 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 14, 0LL);
    goto LAB26;

}


extern void work_m_00000000002566442600_1631780631_init()
{
	static char *pe[] = {(void *)Always_58_0,(void *)Always_73_1,(void *)Always_86_2,(void *)Always_106_3};
	xsi_register_didat("work_m_00000000002566442600_1631780631", "isim/tb_ecs_isim_beh.exe.sim/work/m_00000000002566442600_1631780631.didat");
	xsi_register_executes(pe);
}
