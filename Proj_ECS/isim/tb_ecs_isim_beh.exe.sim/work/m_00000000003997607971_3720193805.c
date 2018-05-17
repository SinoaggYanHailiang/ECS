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
static const char *ng0 = "D:/2_FPGA_program/Proj_ECS_sinoagg_v2_fft256_dac8551_fir/Proj_ECS/src/my_uart_rx.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {9U, 0U};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {1, 0};
static unsigned int ng7[] = {3U, 0U};
static int ng8[] = {2, 0};
static unsigned int ng9[] = {4U, 0U};
static int ng10[] = {3, 0};
static unsigned int ng11[] = {5U, 0U};
static int ng12[] = {4, 0};
static unsigned int ng13[] = {6U, 0U};
static int ng14[] = {5, 0};
static unsigned int ng15[] = {7U, 0U};
static int ng16[] = {6, 0};
static unsigned int ng17[] = {8U, 0U};
static int ng18[] = {7, 0};



static void Always_28_0(char *t0)
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 4448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 5512);
    *((int *)t2) = 1;
    t3 = (t0 + 4480);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);
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
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(35, ng0);

LAB13:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 1, 0LL);

LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(29, ng0);

LAB12:    xsi_set_current_line(30, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(31, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB11;

}

static void Cont_43_1(char *t0)
{
    char t8[8];
    char t40[8];
    char t61[8];
    char t93[8];
    char t114[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
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
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    int t85;
    int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    char *t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    int t138;
    int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    char *t146;
    char *t147;
    char *t148;
    char *t149;
    char *t150;
    unsigned int t151;
    unsigned int t152;
    char *t153;
    unsigned int t154;
    unsigned int t155;
    char *t156;
    unsigned int t157;
    unsigned int t158;
    char *t159;

LAB0:    t1 = (t0 + 4696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t7);
    t11 = (t9 & t10);
    *((unsigned int *)t8) = t11;
    t12 = (t4 + 4);
    t13 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t12);
    t16 = *((unsigned int *)t13);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB4;

LAB5:
LAB6:    t41 = (t0 + 2728);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memset(t40, 0, 8);
    t44 = (t43 + 4);
    t45 = *((unsigned int *)t44);
    t46 = (~(t45));
    t47 = *((unsigned int *)t43);
    t48 = (t47 & t46);
    t49 = (t48 & 1U);
    if (t49 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t44) == 0)
        goto LAB7;

LAB9:    t50 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t50) = 1;

LAB10:    t51 = (t40 + 4);
    t52 = (t43 + 4);
    t53 = *((unsigned int *)t43);
    t54 = (~(t53));
    *((unsigned int *)t40) = t54;
    *((unsigned int *)t51) = 0;
    if (*((unsigned int *)t52) != 0)
        goto LAB12;

LAB11:    t59 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t59 & 1U);
    t60 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t60 & 1U);
    t62 = *((unsigned int *)t8);
    t63 = *((unsigned int *)t40);
    t64 = (t62 & t63);
    *((unsigned int *)t61) = t64;
    t65 = (t8 + 4);
    t66 = (t40 + 4);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t65);
    t69 = *((unsigned int *)t66);
    t70 = (t68 | t69);
    *((unsigned int *)t67) = t70;
    t71 = *((unsigned int *)t67);
    t72 = (t71 != 0);
    if (t72 == 1)
        goto LAB13;

LAB14:
LAB15:    t94 = (t0 + 2568);
    t95 = (t94 + 56U);
    t96 = *((char **)t95);
    memset(t93, 0, 8);
    t97 = (t96 + 4);
    t98 = *((unsigned int *)t97);
    t99 = (~(t98));
    t100 = *((unsigned int *)t96);
    t101 = (t100 & t99);
    t102 = (t101 & 1U);
    if (t102 != 0)
        goto LAB19;

LAB17:    if (*((unsigned int *)t97) == 0)
        goto LAB16;

LAB18:    t103 = (t93 + 4);
    *((unsigned int *)t93) = 1;
    *((unsigned int *)t103) = 1;

LAB19:    t104 = (t93 + 4);
    t105 = (t96 + 4);
    t106 = *((unsigned int *)t96);
    t107 = (~(t106));
    *((unsigned int *)t93) = t107;
    *((unsigned int *)t104) = 0;
    if (*((unsigned int *)t105) != 0)
        goto LAB21;

LAB20:    t112 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t112 & 1U);
    t113 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t113 & 1U);
    t115 = *((unsigned int *)t61);
    t116 = *((unsigned int *)t93);
    t117 = (t115 & t116);
    *((unsigned int *)t114) = t117;
    t118 = (t61 + 4);
    t119 = (t93 + 4);
    t120 = (t114 + 4);
    t121 = *((unsigned int *)t118);
    t122 = *((unsigned int *)t119);
    t123 = (t121 | t122);
    *((unsigned int *)t120) = t123;
    t124 = *((unsigned int *)t120);
    t125 = (t124 != 0);
    if (t125 == 1)
        goto LAB22;

LAB23:
LAB24:    t146 = (t0 + 5640);
    t147 = (t146 + 56U);
    t148 = *((char **)t147);
    t149 = (t148 + 56U);
    t150 = *((char **)t149);
    memset(t150, 0, 8);
    t151 = 1U;
    t152 = t151;
    t153 = (t114 + 4);
    t154 = *((unsigned int *)t114);
    t151 = (t151 & t154);
    t155 = *((unsigned int *)t153);
    t152 = (t152 & t155);
    t156 = (t150 + 4);
    t157 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t157 | t151);
    t158 = *((unsigned int *)t156);
    *((unsigned int *)t156) = (t158 | t152);
    xsi_driver_vfirst_trans(t146, 0, 0);
    t159 = (t0 + 5528);
    *((int *)t159) = 1;

LAB1:    return;
LAB4:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    t22 = (t4 + 4);
    t23 = (t7 + 4);
    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t22);
    t27 = (~(t26));
    t28 = *((unsigned int *)t7);
    t29 = (~(t28));
    t30 = *((unsigned int *)t23);
    t31 = (~(t30));
    t32 = (t25 & t27);
    t33 = (t29 & t31);
    t34 = (~(t32));
    t35 = (~(t33));
    t36 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t36 & t34);
    t37 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t37 & t35);
    t38 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t38 & t34);
    t39 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t39 & t35);
    goto LAB6;

LAB7:    *((unsigned int *)t40) = 1;
    goto LAB10;

LAB12:    t55 = *((unsigned int *)t40);
    t56 = *((unsigned int *)t52);
    *((unsigned int *)t40) = (t55 | t56);
    t57 = *((unsigned int *)t51);
    t58 = *((unsigned int *)t52);
    *((unsigned int *)t51) = (t57 | t58);
    goto LAB11;

LAB13:    t73 = *((unsigned int *)t61);
    t74 = *((unsigned int *)t67);
    *((unsigned int *)t61) = (t73 | t74);
    t75 = (t8 + 4);
    t76 = (t40 + 4);
    t77 = *((unsigned int *)t8);
    t78 = (~(t77));
    t79 = *((unsigned int *)t75);
    t80 = (~(t79));
    t81 = *((unsigned int *)t40);
    t82 = (~(t81));
    t83 = *((unsigned int *)t76);
    t84 = (~(t83));
    t85 = (t78 & t80);
    t86 = (t82 & t84);
    t87 = (~(t85));
    t88 = (~(t86));
    t89 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t89 & t87);
    t90 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t90 & t88);
    t91 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t91 & t87);
    t92 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t92 & t88);
    goto LAB15;

LAB16:    *((unsigned int *)t93) = 1;
    goto LAB19;

LAB21:    t108 = *((unsigned int *)t93);
    t109 = *((unsigned int *)t105);
    *((unsigned int *)t93) = (t108 | t109);
    t110 = *((unsigned int *)t104);
    t111 = *((unsigned int *)t105);
    *((unsigned int *)t104) = (t110 | t111);
    goto LAB20;

LAB22:    t126 = *((unsigned int *)t114);
    t127 = *((unsigned int *)t120);
    *((unsigned int *)t114) = (t126 | t127);
    t128 = (t61 + 4);
    t129 = (t93 + 4);
    t130 = *((unsigned int *)t61);
    t131 = (~(t130));
    t132 = *((unsigned int *)t128);
    t133 = (~(t132));
    t134 = *((unsigned int *)t93);
    t135 = (~(t134));
    t136 = *((unsigned int *)t129);
    t137 = (~(t136));
    t138 = (t131 & t133);
    t139 = (t135 & t137);
    t140 = (~(t138));
    t141 = (~(t139));
    t142 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t142 & t140);
    t143 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t143 & t141);
    t144 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t144 & t140);
    t145 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t145 & t141);
    goto LAB24;

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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 4944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 5544);
    *((int *)t2) = 1;
    t3 = (t0 + 4976);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(51, ng0);
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
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB21;

LAB18:    if (t18 != 0)
        goto LAB20;

LAB19:    *((unsigned int *)t4) = 1;

LAB21:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB24:
LAB16:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(51, ng0);

LAB13:    xsi_set_current_line(52, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB14:    xsi_set_current_line(56, ng0);

LAB17:    xsi_set_current_line(57, ng0);
    t5 = ((char*)((ng2)));
    t6 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB16;

LAB20:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB21;

LAB22:    xsi_set_current_line(60, ng0);

LAB25:    xsi_set_current_line(61, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB24;

}

static void Always_70_3(char *t0)
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;

LAB0:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 5560);
    *((int *)t2) = 1;
    t3 = (t0 + 5224);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(71, ng0);

LAB5:    xsi_set_current_line(72, ng0);
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
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB14;

LAB15:
LAB16:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(72, ng0);

LAB13:    xsi_set_current_line(73, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 8, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB12;

LAB14:    xsi_set_current_line(77, ng0);

LAB17:    xsi_set_current_line(78, ng0);
    t12 = (t0 + 1528U);
    t13 = *((char **)t12);
    t12 = (t13 + 4);
    t14 = *((unsigned int *)t12);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng3)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    t19 = (t12 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t12);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t13);
    t11 = *((unsigned int *)t19);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t19);
    t18 = (t16 | t17);
    t26 = (~(t18));
    t27 = (t15 & t26);
    if (t27 != 0)
        goto LAB61;

LAB58:    if (t18 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t4) = 1;

LAB61:    t21 = (t4 + 4);
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = *((unsigned int *)t4);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB62;

LAB63:
LAB64:
LAB20:    goto LAB16;

LAB18:    xsi_set_current_line(78, ng0);

LAB21:    xsi_set_current_line(79, ng0);
    t19 = (t0 + 3208);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 4, t21, 4, t22, 4);
    t23 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t23, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB22:    t6 = ((char*)((ng2)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t6, 4);
    if (t24 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng5)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng7)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng9)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng11)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng13)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng15)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng17)));
    t24 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t24 == 1)
        goto LAB37;

LAB38:
LAB40:
LAB39:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);

LAB41:    goto LAB20;

LAB23:    xsi_set_current_line(81, ng0);
    t12 = (t0 + 1368U);
    t13 = *((char **)t12);
    t12 = (t0 + 3528);
    t19 = (t0 + 3528);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t4, t21, 2, t22, 32, 1);
    t23 = (t4 + 4);
    t7 = *((unsigned int *)t23);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB42;

LAB43:    goto LAB41;

LAB25:    xsi_set_current_line(82, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB44;

LAB45:    goto LAB41;

LAB27:    xsi_set_current_line(83, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB46;

LAB47:    goto LAB41;

LAB29:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng10)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB48;

LAB49:    goto LAB41;

LAB31:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng12)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB50;

LAB51:    goto LAB41;

LAB33:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng14)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB52;

LAB53:    goto LAB41;

LAB35:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng16)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB54;

LAB55:    goto LAB41;

LAB37:    xsi_set_current_line(88, ng0);
    t3 = (t0 + 1368U);
    t6 = *((char **)t3);
    t3 = (t0 + 3528);
    t12 = (t0 + 3528);
    t13 = (t12 + 72U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng18)));
    xsi_vlog_generic_convert_bit_index(t4, t19, 2, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t25 = (!(t7));
    if (t25 == 1)
        goto LAB56;

LAB57:    goto LAB41;

LAB42:    xsi_vlogvar_wait_assign_value(t12, t13, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB43;

LAB44:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB45;

LAB46:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB47;

LAB48:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB49;

LAB50:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB51;

LAB52:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB53;

LAB54:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB55;

LAB56:    xsi_vlogvar_wait_assign_value(t3, t6, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB57;

LAB60:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(92, ng0);

LAB65:    xsi_set_current_line(93, ng0);
    t22 = ((char*)((ng1)));
    t23 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 4, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    goto LAB64;

}


extern void work_m_00000000003997607971_3720193805_init()
{
	static char *pe[] = {(void *)Always_28_0,(void *)Cont_43_1,(void *)Always_49_2,(void *)Always_70_3};
	xsi_register_didat("work_m_00000000003997607971_3720193805", "isim/tb_ecs_isim_beh.exe.sim/work/m_00000000003997607971_3720193805.didat");
	xsi_register_executes(pe);
}
