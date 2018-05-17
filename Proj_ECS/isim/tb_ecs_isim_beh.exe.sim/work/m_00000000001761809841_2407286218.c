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
static const char *ng0 = "D:/2_FPGA_program/Proj_ECS_sinoagg_v2_fft256_dac8551_fir/Proj_ECS/src/AD9244.v";
static unsigned int ng1[] = {8191U, 0U};
static unsigned int ng2[] = {0U, 0U, 0U, 0U};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {1U, 0U};
static unsigned int ng6[] = {255U, 0U};
static unsigned int ng7[] = {2U, 0U};



static void Cont_91_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 8008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 3168U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 15, t3, 14, t2, 15);
    t5 = (t0 + 10784);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 32767U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 14);
    t18 = (t0 + 10560);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_107_1(char *t0)
{
    char t13[16];
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

LAB0:    t1 = (t0 + 8256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 10576);
    *((int *)t2) = 1;
    t3 = (t0 + 8288);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(108, ng0);

LAB5:    xsi_set_current_line(109, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4448U);
    t3 = *((char **)t2);
    t2 = (t0 + 4408U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t11 = (t0 + 4408U);
    t12 = (t11 + 48U);
    t14 = *((char **)t12);
    t15 = ((char*)((ng3)));
    xsi_vlog_generic_get_array_select_value(t13, 38, t3, t5, t14, 2, 1, t15, 32, 1);
    t16 = (t0 + 7088);
    xsi_vlogvar_wait_assign_value(t16, t13, 0, 0, 38, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(109, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 7088);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 38, 0LL);
    goto LAB8;

}

static void Always_174_2(char *t0)
{
    char t14[8];
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
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t1 = (t0 + 8504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 10592);
    *((int *)t2) = 1;
    t3 = (t0 + 8536);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(175, ng0);

LAB5:    xsi_set_current_line(176, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(181, ng0);
    t2 = (t0 + 2688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(192, ng0);
    t2 = (t0 + 3648U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(198, ng0);

LAB27:    xsi_set_current_line(199, ng0);
    t2 = (t0 + 5168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5168);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 5488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5488);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB25:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(177, ng0);

LAB9:    xsi_set_current_line(178, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 5168);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(182, ng0);
    t4 = (t0 + 5168);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3328U);
    t13 = *((char **)t12);
    memset(t14, 0, 8);
    t12 = (t11 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB14;

LAB13:    t15 = (t13 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB14;

LAB17:    if (*((unsigned int *)t11) < *((unsigned int *)t13))
        goto LAB16;

LAB15:    *((unsigned int *)t14) = 1;

LAB16:    t17 = (t14 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (~(t18));
    t20 = *((unsigned int *)t14);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(188, ng0);

LAB22:    xsi_set_current_line(189, ng0);
    t2 = (t0 + 5168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 8, t4, 8, t5, 8);
    t11 = (t0 + 5168);
    xsi_vlogvar_wait_assign_value(t11, t14, 0, 0, 8, 0LL);
    xsi_set_current_line(190, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB20:    goto LAB12;

LAB14:    t16 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB16;

LAB18:    xsi_set_current_line(183, ng0);

LAB21:    xsi_set_current_line(184, ng0);
    t23 = (t0 + 5168);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t0 + 5168);
    xsi_vlogvar_wait_assign_value(t26, t25, 0, 0, 8, 0LL);
    xsi_set_current_line(185, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB20;

LAB23:    xsi_set_current_line(193, ng0);

LAB26:    xsi_set_current_line(194, ng0);
    t4 = ((char*)((ng4)));
    t5 = (t0 + 5168);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(195, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB25;

}

static void Always_205_3(char *t0)
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
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 8752U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(205, ng0);
    t2 = (t0 + 10608);
    *((int *)t2) = 1;
    t3 = (t0 + 8784);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(206, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(223, ng0);

LAB22:    xsi_set_current_line(224, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB11:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(207, ng0);

LAB8:    xsi_set_current_line(208, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 5008);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB7;

LAB9:    xsi_set_current_line(212, ng0);
    t4 = (t0 + 5008);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng6)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB13;

LAB12:    t15 = (t12 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB13;

LAB16:    if (*((unsigned int *)t11) < *((unsigned int *)t12))
        goto LAB15;

LAB14:    *((unsigned int *)t13) = 1;

LAB15:    t17 = (t13 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(218, ng0);

LAB21:    xsi_set_current_line(219, ng0);
    t2 = (t0 + 5008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 8, t4, 8, t5, 8);
    t11 = (t0 + 5008);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(220, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB19:    goto LAB11;

LAB13:    t16 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB15;

LAB17:    xsi_set_current_line(213, ng0);

LAB20:    xsi_set_current_line(214, ng0);
    t23 = ((char*)((ng6)));
    t24 = (t0 + 5008);
    xsi_vlogvar_wait_assign_value(t24, t23, 0, 0, 8, 0LL);
    xsi_set_current_line(215, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB19;

}

static void Always_230_4(char *t0)
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
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 9000U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(230, ng0);
    t2 = (t0 + 10624);
    *((int *)t2) = 1;
    t3 = (t0 + 9032);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(231, ng0);

LAB5:    xsi_set_current_line(232, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(237, ng0);
    t2 = (t0 + 3008U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(251, ng0);

LAB24:    xsi_set_current_line(252, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(253, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(233, ng0);

LAB9:    xsi_set_current_line(234, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 6288);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(235, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(238, ng0);

LAB13:    xsi_set_current_line(239, ng0);
    t4 = (t0 + 6448);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng6)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB15;

LAB14:    t15 = (t12 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB15;

LAB18:    if (*((unsigned int *)t11) < *((unsigned int *)t12))
        goto LAB17;

LAB16:    *((unsigned int *)t13) = 1;

LAB17:    t17 = (t13 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (~(t18));
    t20 = *((unsigned int *)t13);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(245, ng0);

LAB23:    xsi_set_current_line(246, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 6288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(247, ng0);
    t2 = (t0 + 6448);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 8, t4, 8, t5, 8);
    t11 = (t0 + 6448);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);

LAB21:    goto LAB12;

LAB15:    t16 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB17;

LAB19:    xsi_set_current_line(240, ng0);

LAB22:    xsi_set_current_line(241, ng0);
    t23 = ((char*)((ng4)));
    t24 = (t0 + 6288);
    xsi_vlogvar_wait_assign_value(t24, t23, 0, 0, 1, 0LL);
    xsi_set_current_line(242, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 6448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB21;

}

static void Always_259_5(char *t0)
{
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

LAB0:    t1 = (t0 + 9248U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(259, ng0);
    t2 = (t0 + 10640);
    *((int *)t2) = 1;
    t3 = (t0 + 9280);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(260, ng0);

LAB5:    xsi_set_current_line(261, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(264, ng0);
    t2 = (t0 + 6128);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5968);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(262, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 5968);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB8;

}

static void Always_267_6(char *t0)
{
    char t16[8];
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
    int t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 9496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(267, ng0);
    t2 = (t0 + 10656);
    *((int *)t2) = 1;
    t3 = (t0 + 9528);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(268, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(271, ng0);
    t2 = (t0 + 5968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB8:    t5 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t13 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(292, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB17:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(269, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 6128);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 2);
    goto LAB7;

LAB9:    xsi_set_current_line(273, ng0);
    t11 = (t0 + 3008U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t12);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(278, ng0);

LAB22:    xsi_set_current_line(279, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB20:    goto LAB17;

LAB11:    xsi_set_current_line(282, ng0);
    t3 = (t0 + 6608);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3488U);
    t14 = *((char **)t12);
    memset(t16, 0, 8);
    t12 = (t11 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB24;

LAB23:    t15 = (t14 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB24;

LAB27:    if (*((unsigned int *)t11) < *((unsigned int *)t14))
        goto LAB26;

LAB25:    *((unsigned int *)t16) = 1;

LAB26:    t18 = (t16 + 4);
    t6 = *((unsigned int *)t18);
    t7 = (~(t6));
    t8 = *((unsigned int *)t16);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(285, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 6128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB30:    goto LAB17;

LAB13:    xsi_set_current_line(287, ng0);
    t3 = (t0 + 3008U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB31;

LAB32:    xsi_set_current_line(290, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB33:    goto LAB17;

LAB18:    xsi_set_current_line(274, ng0);

LAB21:    xsi_set_current_line(275, ng0);
    t14 = ((char*)((ng5)));
    t15 = (t0 + 6128);
    xsi_vlogvar_assign_value(t15, t14, 0, 0, 2);
    goto LAB20;

LAB24:    t17 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB26;

LAB28:    xsi_set_current_line(283, ng0);
    t19 = ((char*)((ng7)));
    t20 = (t0 + 6128);
    xsi_vlogvar_assign_value(t20, t19, 0, 0, 2);
    goto LAB30;

LAB31:    xsi_set_current_line(288, ng0);
    t11 = ((char*)((ng7)));
    t12 = (t0 + 6128);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 2);
    goto LAB33;

}

static void Always_295_7(char *t0)
{
    char t16[8];
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
    int t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 9744U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(295, ng0);
    t2 = (t0 + 10672);
    *((int *)t2) = 1;
    t3 = (t0 + 9776);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(296, ng0);
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(304, ng0);
    t2 = (t0 + 5968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB9:    t5 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t13 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB14;

LAB15:
LAB17:
LAB16:    xsi_set_current_line(346, ng0);

LAB43:    xsi_set_current_line(347, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(348, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 22, 0LL);
    xsi_set_current_line(349, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(350, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 14, 0LL);

LAB18:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(297, ng0);

LAB8:    xsi_set_current_line(298, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(299, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 22, 0LL);
    xsi_set_current_line(300, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(301, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    goto LAB7;

LAB10:    xsi_set_current_line(306, ng0);
    t11 = (t0 + 3008U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t12);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(314, ng0);

LAB23:    xsi_set_current_line(315, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(316, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 22, 0LL);
    xsi_set_current_line(317, ng0);
    t2 = (t0 + 5648);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 14, 0LL);
    xsi_set_current_line(318, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);

LAB21:    goto LAB18;

LAB12:    xsi_set_current_line(321, ng0);
    t3 = (t0 + 6608);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3488U);
    t14 = *((char **)t12);
    memset(t16, 0, 8);
    t12 = (t11 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB25;

LAB24:    t15 = (t14 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB25;

LAB28:    if (*((unsigned int *)t11) < *((unsigned int *)t14))
        goto LAB27;

LAB26:    *((unsigned int *)t16) = 1;

LAB27:    t18 = (t16 + 4);
    t6 = *((unsigned int *)t18);
    t7 = (~(t6));
    t8 = *((unsigned int *)t16);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(329, ng0);

LAB33:    xsi_set_current_line(330, ng0);
    t2 = (t0 + 6608);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng5)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_add(t16, 8, t5, 8, t11, 8);
    t12 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t12, t16, 0, 0, 8, 0LL);
    xsi_set_current_line(331, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 4128U);
    t12 = *((char **)t11);
    memset(t16, 0, 8);
    xsi_vlog_unsigned_add(t16, 22, t5, 22, t12, 14);
    t11 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t11, t16, 0, 0, 22, 0LL);
    xsi_set_current_line(332, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(333, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 4128U);
    t12 = *((char **)t11);
    memset(t16, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB35;

LAB34:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB35;

LAB38:    if (*((unsigned int *)t5) < *((unsigned int *)t12))
        goto LAB36;

LAB37:    t17 = (t16 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t16);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(336, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 14, 0LL);

LAB41:
LAB31:    goto LAB18;

LAB14:    xsi_set_current_line(339, ng0);

LAB42:    xsi_set_current_line(340, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(341, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 22, 0LL);
    xsi_set_current_line(342, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 3488U);
    t12 = *((char **)t11);
    memset(t16, 0, 8);
    xsi_vlog_unsigned_divide(t16, 22, t5, 22, t12, 8);
    t11 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t11, t16, 0, 0, 14, 0LL);
    xsi_set_current_line(343, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 14, 0LL);
    goto LAB18;

LAB19:    xsi_set_current_line(307, ng0);

LAB22:    xsi_set_current_line(308, ng0);
    t14 = ((char*)((ng4)));
    t15 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 8, 0LL);
    xsi_set_current_line(309, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 22, 0LL);
    xsi_set_current_line(310, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(311, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    goto LAB21;

LAB25:    t17 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB27;

LAB29:    xsi_set_current_line(322, ng0);

LAB32:    xsi_set_current_line(323, ng0);
    t19 = ((char*)((ng4)));
    t20 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 8, 0LL);
    xsi_set_current_line(324, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 22, 0LL);
    xsi_set_current_line(325, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 14, 0LL);
    xsi_set_current_line(326, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 14, 0LL);
    goto LAB31;

LAB35:    t15 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB37;

LAB36:    *((unsigned int *)t16) = 1;
    goto LAB37;

LAB39:    xsi_set_current_line(334, ng0);
    t18 = (t0 + 4128U);
    t19 = *((char **)t18);
    t18 = (t0 + 6928);
    xsi_vlogvar_wait_assign_value(t18, t19, 0, 0, 14, 0LL);
    goto LAB41;

}

static void Always_357_8(char *t0)
{
    char t8[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;

LAB0:    t1 = (t0 + 9992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(357, ng0);
    t2 = (t0 + 10688);
    *((int *)t2) = 1;
    t3 = (t0 + 10024);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(358, ng0);

LAB5:    xsi_set_current_line(359, ng0);
    t4 = (t0 + 5968);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng7)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(367, ng0);
    t2 = (t0 + 5808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5808);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB12:    goto LAB2;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(360, ng0);
    t30 = (t0 + 6928);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t0 + 880);
    t34 = *((char **)t33);
    memset(t35, 0, 8);
    xsi_vlog_signed_greater(t35, 32, t32, 14, t34, 32);
    t33 = (t35 + 4);
    t36 = *((unsigned int *)t33);
    t37 = (~(t36));
    t38 = *((unsigned int *)t35);
    t39 = (t38 & t37);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(362, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1016);
    t6 = *((char **)t5);
    memset(t8, 0, 8);
    xsi_vlog_signed_less(t8, 32, t4, 14, t6, 32);
    t5 = (t8 + 4);
    t11 = *((unsigned int *)t5);
    t12 = (~(t11));
    t13 = *((unsigned int *)t8);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB16;

LAB17:    xsi_set_current_line(365, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5808);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB18:
LAB15:    goto LAB12;

LAB13:    xsi_set_current_line(361, ng0);
    t41 = ((char*)((ng5)));
    t42 = (t0 + 5808);
    xsi_vlogvar_wait_assign_value(t42, t41, 0, 0, 2, 0LL);
    goto LAB15;

LAB16:    xsi_set_current_line(363, ng0);
    t7 = ((char*)((ng7)));
    t9 = (t0 + 5808);
    xsi_vlogvar_wait_assign_value(t9, t7, 0, 0, 2, 0LL);
    goto LAB18;

}

static void implSig1_execute(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 10240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2208U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    t11 = (t0 + 10848);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t15, 0, 8);
    t16 = 1U;
    t17 = t16;
    t18 = (t3 + 4);
    t19 = *((unsigned int *)t3);
    t16 = (t16 & t19);
    t20 = *((unsigned int *)t18);
    t17 = (t17 & t20);
    t21 = (t15 + 4);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 | t16);
    t23 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t23 | t17);
    xsi_driver_vfirst_trans(t11, 0, 0);
    t24 = (t0 + 10704);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

}


extern void work_m_00000000001761809841_2407286218_init()
{
	static char *pe[] = {(void *)Cont_91_0,(void *)Always_107_1,(void *)Always_174_2,(void *)Always_205_3,(void *)Always_230_4,(void *)Always_259_5,(void *)Always_267_6,(void *)Always_295_7,(void *)Always_357_8,(void *)implSig1_execute};
	xsi_register_didat("work_m_00000000001761809841_2407286218", "isim/tb_ecs_isim_beh.exe.sim/work/m_00000000001761809841_2407286218.didat");
	xsi_register_executes(pe);
}
