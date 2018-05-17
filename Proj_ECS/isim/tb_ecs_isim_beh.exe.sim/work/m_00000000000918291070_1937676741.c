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
static const char *ng0 = "D:/2_FPGA_program/Proj_ECS_sinoagg_v2_fft256_dac8551_fir/Proj_ECS/src/tx_bridge.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {50000U, 0U};
static unsigned int ng4[] = {170U, 0U};
static unsigned int ng5[] = {100000U, 0U};
static unsigned int ng6[] = {150000U, 0U};
static unsigned int ng7[] = {200000U, 0U};
static unsigned int ng8[] = {250000U, 0U};
static unsigned int ng9[] = {300000U, 0U};



static void Always_30_0(char *t0)
{
    char t4[8];
    char t20[8];
    char t35[8];
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
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 4784);
    *((int *)t2) = 1;
    t3 = (t0 + 4000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(32, ng0);
    t5 = (t0 + 2008U);
    t6 = *((char **)t5);
    t5 = (t0 + 1848U);
    t7 = *((char **)t5);
    t5 = (t0 + 1688U);
    t8 = *((char **)t5);
    t5 = (t0 + 1528U);
    t9 = *((char **)t5);
    xsi_vlogtype_concat(t4, 32, 32, 4U, t9, 8, t8, 8, t7, 8, t6, 8);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 28, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t5 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    *((unsigned int *)t4) = t12;
    t2 = (t3 + 4);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t13 = *((unsigned int *)t2);
    t14 = *((unsigned int *)t6);
    t15 = (t13 | t14);
    *((unsigned int *)t7) = t15;
    t16 = *((unsigned int *)t7);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB6;

LAB7:
LAB8:    t8 = (t0 + 1848U);
    t9 = *((char **)t8);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t9);
    t23 = (t21 ^ t22);
    *((unsigned int *)t20) = t23;
    t8 = (t4 + 4);
    t24 = (t9 + 4);
    t25 = (t20 + 4);
    t26 = *((unsigned int *)t8);
    t27 = *((unsigned int *)t24);
    t28 = (t26 | t27);
    *((unsigned int *)t25) = t28;
    t29 = *((unsigned int *)t25);
    t30 = (t29 != 0);
    if (t30 == 1)
        goto LAB9;

LAB10:
LAB11:    t33 = (t0 + 2008U);
    t34 = *((char **)t33);
    t36 = *((unsigned int *)t20);
    t37 = *((unsigned int *)t34);
    t38 = (t36 ^ t37);
    *((unsigned int *)t35) = t38;
    t33 = (t20 + 4);
    t39 = (t34 + 4);
    t40 = (t35 + 4);
    t41 = *((unsigned int *)t33);
    t42 = *((unsigned int *)t39);
    t43 = (t41 | t42);
    *((unsigned int *)t40) = t43;
    t44 = *((unsigned int *)t40);
    t45 = (t44 != 0);
    if (t45 == 1)
        goto LAB12;

LAB13:
LAB14:    t48 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t48, t35, 0, 0, 8, 0LL);
    goto LAB2;

LAB6:    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t7);
    *((unsigned int *)t4) = (t18 | t19);
    goto LAB8;

LAB9:    t31 = *((unsigned int *)t20);
    t32 = *((unsigned int *)t25);
    *((unsigned int *)t20) = (t31 | t32);
    goto LAB11;

LAB12:    t46 = *((unsigned int *)t35);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t35) = (t46 | t47);
    goto LAB14;

}

static void Always_41_1(char *t0)
{
    char t4[8];
    char t39[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t40;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 4800);
    *((int *)t2) = 1;
    t3 = (t0 + 4248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB10;

LAB9:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t4 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng1)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t15 = (t10 ^ t11);
    t16 = (t9 | t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB17;

LAB14:    if (t19 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t4) = 1;

LAB17:    t23 = (t4 + 4);
    t22 = *((unsigned int *)t23);
    t24 = (~(t22));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 20, t5, 20, t6, 20);
    t12 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 20, 0LL);

LAB20:
LAB13:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB10:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB9;

LAB11:    xsi_set_current_line(42, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 20, 0LL);
    goto LAB13;

LAB16:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(44, ng0);
    t29 = (t0 + 1368U);
    t30 = *((char **)t29);
    t29 = (t30 + 4);
    t28 = *((unsigned int *)t29);
    t31 = (~(t28));
    t32 = *((unsigned int *)t30);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 20, 0LL);

LAB23:    goto LAB20;

LAB21:    xsi_set_current_line(44, ng0);
    t35 = (t0 + 3048);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = ((char*)((ng2)));
    memset(t39, 0, 8);
    xsi_vlog_unsigned_add(t39, 20, t37, 20, t38, 20);
    t40 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t40, t39, 0, 0, 20, 0LL);
    goto LAB23;

}

static void Always_49_2(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    int t31;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 4816);
    *((int *)t2) = 1;
    t3 = (t0 + 4496);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t5) == 0)
        goto LAB5;

LAB7:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB8:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB10;

LAB9:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t4 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(54, ng0);

LAB15:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB16:    t6 = ((char*)((ng3)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 20, t6, 20);
    if (t31 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 20, t2, 20);
    if (t31 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng6)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 20, t2, 20);
    if (t31 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng7)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 20, t2, 20);
    if (t31 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng8)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 20, t2, 20);
    if (t31 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng9)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 20, t2, 20);
    if (t31 == 1)
        goto LAB27;

LAB28:
LAB30:
LAB29:    xsi_set_current_line(80, ng0);

LAB38:    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB31:
LAB13:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB10:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB9;

LAB11:    xsi_set_current_line(50, ng0);

LAB14:    xsi_set_current_line(51, ng0);
    t29 = ((char*)((ng1)));
    t30 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t30, t29, 0, 0, 1, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB13;

LAB17:    xsi_set_current_line(56, ng0);

LAB32:    xsi_set_current_line(57, ng0);
    t12 = ((char*)((ng2)));
    t13 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB31;

LAB19:    xsi_set_current_line(60, ng0);

LAB33:    xsi_set_current_line(61, ng0);
    t3 = ((char*)((ng2)));
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    goto LAB31;

LAB21:    xsi_set_current_line(64, ng0);

LAB34:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng2)));
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    goto LAB31;

LAB23:    xsi_set_current_line(68, ng0);

LAB35:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng2)));
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    goto LAB31;

LAB25:    xsi_set_current_line(72, ng0);

LAB36:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng2)));
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    goto LAB31;

LAB27:    xsi_set_current_line(76, ng0);

LAB37:    xsi_set_current_line(77, ng0);
    t3 = ((char*)((ng2)));
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    goto LAB31;

}


extern void work_m_00000000000918291070_1937676741_init()
{
	static char *pe[] = {(void *)Always_30_0,(void *)Always_41_1,(void *)Always_49_2};
	xsi_register_didat("work_m_00000000000918291070_1937676741", "isim/tb_ecs_isim_beh.exe.sim/work/m_00000000000918291070_1937676741.didat");
	xsi_register_executes(pe);
}
