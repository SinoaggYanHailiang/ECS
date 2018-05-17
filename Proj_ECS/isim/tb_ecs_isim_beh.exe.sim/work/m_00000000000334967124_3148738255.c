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
static const char *ng0 = "D:/2_FPGA_program/Proj_ECS_sinoagg_v2_fft256_dac8551_fir/Proj_ECS/src/my_FFT.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};



static void Always_90_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 8128U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 10432);
    *((int *)t2) = 1;
    t3 = (t0 + 8160);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(91, ng0);
    t4 = (t0 + 6088);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 6248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 23, 0LL);

LAB10:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(92, ng0);
    t13 = (t0 + 3288U);
    t14 = *((char **)t13);
    t13 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t13, t14, 0, 0, 23, 0LL);
    goto LAB7;

LAB8:    xsi_set_current_line(94, ng0);
    t6 = (t0 + 3448U);
    t7 = *((char **)t6);
    t6 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t6, t7, 0, 0, 23, 0LL);
    goto LAB10;

}

static void Always_121_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 8376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 10448);
    *((int *)t2) = 1;
    t3 = (t0 + 8408);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(122, ng0);
    t4 = (t0 + 6408);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 6568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 23, 0LL);

LAB10:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(123, ng0);
    t13 = (t0 + 3608U);
    t14 = *((char **)t13);
    t13 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t13, t14, 0, 0, 23, 0LL);
    goto LAB7;

LAB8:    xsi_set_current_line(125, ng0);
    t6 = (t0 + 3768U);
    t7 = *((char **)t6);
    t6 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t6, t7, 0, 0, 23, 0LL);
    goto LAB10;

}

static void Always_136_2(char *t0)
{
    char t13[8];
    char t17[8];
    char t24[8];
    char t64[8];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;

LAB0:    t1 = (t0 + 8624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 10464);
    *((int *)t2) = 1;
    t3 = (t0 + 8656);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(137, ng0);

LAB5:    xsi_set_current_line(138, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t2) != 0)
        goto LAB12;

LAB13:    t5 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t5);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB14;

LAB15:    memcpy(t24, t13, 8);

LAB16:    t56 = (t24 + 4);
    t57 = *((unsigned int *)t56);
    t58 = (~(t57));
    t59 = *((unsigned int *)t24);
    t60 = (t59 & t58);
    t61 = (t60 != 0);
    if (t61 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(152, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t2) != 0)
        goto LAB30;

LAB31:    t5 = (t13 + 4);
    t14 = *((unsigned int *)t13);
    t15 = *((unsigned int *)t5);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB32;

LAB33:    memcpy(t64, t13, 8);

LAB34:    t73 = (t64 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (~(t74));
    t76 = *((unsigned int *)t64);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(160, ng0);

LAB50:    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB48:
LAB26:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(139, ng0);

LAB9:    xsi_set_current_line(140, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5448);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t13) = 1;
    goto LAB13;

LAB12:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB13;

LAB14:    t11 = (t0 + 1688U);
    t12 = *((char **)t11);
    memset(t17, 0, 8);
    t11 = (t12 + 4);
    t18 = *((unsigned int *)t11);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t11) != 0)
        goto LAB19;

LAB20:    t25 = *((unsigned int *)t13);
    t26 = *((unsigned int *)t17);
    t27 = (t25 & t26);
    *((unsigned int *)t24) = t27;
    t28 = (t13 + 4);
    t29 = (t17 + 4);
    t30 = (t24 + 4);
    t31 = *((unsigned int *)t28);
    t32 = *((unsigned int *)t29);
    t33 = (t31 | t32);
    *((unsigned int *)t30) = t33;
    t34 = *((unsigned int *)t30);
    t35 = (t34 != 0);
    if (t35 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB16;

LAB17:    *((unsigned int *)t17) = 1;
    goto LAB20;

LAB19:    t23 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB20;

LAB21:    t36 = *((unsigned int *)t24);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t24) = (t36 | t37);
    t38 = (t13 + 4);
    t39 = (t17 + 4);
    t40 = *((unsigned int *)t13);
    t41 = (~(t40));
    t42 = *((unsigned int *)t38);
    t43 = (~(t42));
    t44 = *((unsigned int *)t17);
    t45 = (~(t44));
    t46 = *((unsigned int *)t39);
    t47 = (~(t46));
    t48 = (t41 & t43);
    t49 = (t45 & t47);
    t50 = (~(t48));
    t51 = (~(t49));
    t52 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t52 & t50);
    t53 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t53 & t51);
    t54 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t54 & t50);
    t55 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t55 & t51);
    goto LAB23;

LAB24:    xsi_set_current_line(146, ng0);

LAB27:    xsi_set_current_line(147, ng0);
    t62 = ((char*)((ng2)));
    t63 = (t0 + 5448);
    xsi_vlogvar_wait_assign_value(t63, t62, 0, 0, 1, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 5768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 8, t4, 8, t5, 8);
    t11 = (t0 + 5768);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB26;

LAB28:    *((unsigned int *)t13) = 1;
    goto LAB31;

LAB30:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB31;

LAB32:    t11 = (t0 + 1688U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng1)));
    memset(t17, 0, 8);
    t23 = (t12 + 4);
    t28 = (t11 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t11);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t23);
    t22 = *((unsigned int *)t28);
    t25 = (t21 ^ t22);
    t26 = (t20 | t25);
    t27 = *((unsigned int *)t23);
    t31 = *((unsigned int *)t28);
    t32 = (t27 | t31);
    t33 = (~(t32));
    t34 = (t26 & t33);
    if (t34 != 0)
        goto LAB38;

LAB35:    if (t32 != 0)
        goto LAB37;

LAB36:    *((unsigned int *)t17) = 1;

LAB38:    memset(t24, 0, 8);
    t30 = (t17 + 4);
    t35 = *((unsigned int *)t30);
    t36 = (~(t35));
    t37 = *((unsigned int *)t17);
    t40 = (t37 & t36);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t30) != 0)
        goto LAB41;

LAB42:    t42 = *((unsigned int *)t13);
    t43 = *((unsigned int *)t24);
    t44 = (t42 & t43);
    *((unsigned int *)t64) = t44;
    t39 = (t13 + 4);
    t56 = (t24 + 4);
    t62 = (t64 + 4);
    t45 = *((unsigned int *)t39);
    t46 = *((unsigned int *)t56);
    t47 = (t45 | t46);
    *((unsigned int *)t62) = t47;
    t50 = *((unsigned int *)t62);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB43;

LAB44:
LAB45:    goto LAB34;

LAB37:    t29 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB38;

LAB39:    *((unsigned int *)t24) = 1;
    goto LAB42;

LAB41:    t38 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB42;

LAB43:    t52 = *((unsigned int *)t64);
    t53 = *((unsigned int *)t62);
    *((unsigned int *)t64) = (t52 | t53);
    t63 = (t13 + 4);
    t65 = (t24 + 4);
    t54 = *((unsigned int *)t13);
    t55 = (~(t54));
    t57 = *((unsigned int *)t63);
    t58 = (~(t57));
    t59 = *((unsigned int *)t24);
    t60 = (~(t59));
    t61 = *((unsigned int *)t65);
    t66 = (~(t61));
    t48 = (t55 & t58);
    t49 = (t60 & t66);
    t67 = (~(t48));
    t68 = (~(t49));
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t69 & t67);
    t70 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t70 & t68);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t71 & t67);
    t72 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t72 & t68);
    goto LAB45;

LAB46:    xsi_set_current_line(153, ng0);

LAB49:    xsi_set_current_line(154, ng0);
    t79 = ((char*)((ng1)));
    t80 = (t0 + 5448);
    xsi_vlogvar_wait_assign_value(t80, t79, 0, 0, 1, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 5928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 8, t4, 8, t5, 8);
    t11 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);
    goto LAB48;

}

static void Always_171_3(char *t0)
{
    char t13[16];
    char t16[8];
    char t21[8];
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
    char *t17;
    int t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 8872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 10480);
    *((int *)t2) = 1;
    t3 = (t0 + 8904);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(172, ng0);

LAB5:    xsi_set_current_line(173, ng0);
    t4 = (t0 + 1368U);
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
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(241, ng0);

LAB48:    xsi_set_current_line(242, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(243, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(244, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(245, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(246, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(174, ng0);

LAB9:    xsi_set_current_line(175, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(182, ng0);

LAB13:    xsi_set_current_line(183, ng0);
    t4 = (t0 + 6248);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 6088);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    xsi_vlogtype_concat(t16, 2, 2, 2U, t15, 1, t11, 1);

LAB14:    t17 = ((char*)((ng1)));
    t18 = xsi_vlog_unsigned_case_compare(t16, 2, t17, 2);
    if (t18 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng2)));
    t18 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t18 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng3)));
    t18 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t18 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(231, ng0);

LAB47:    xsi_set_current_line(232, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(233, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(234, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(235, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(236, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB23:    goto LAB12;

LAB15:    xsi_set_current_line(185, ng0);

LAB24:    xsi_set_current_line(186, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(190, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(193, ng0);

LAB25:    xsi_set_current_line(194, ng0);
    t3 = (t0 + 7048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2008U);
    t12 = *((char **)t11);
    memset(t21, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB27;

LAB26:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB27;

LAB30:    if (*((unsigned int *)t5) < *((unsigned int *)t12))
        goto LAB29;

LAB28:    *((unsigned int *)t21) = 1;

LAB29:    t17 = (t21 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t21);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB31;

LAB32:    xsi_set_current_line(203, ng0);

LAB35:    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(205, ng0);
    t2 = (t0 + 7048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 8, t4, 8, t5, 8);
    t11 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t11, t21, 0, 0, 8, 0LL);
    xsi_set_current_line(206, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(207, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(208, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB33:    goto LAB23;

LAB19:    xsi_set_current_line(212, ng0);

LAB36:    xsi_set_current_line(213, ng0);
    t3 = (t0 + 7048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2008U);
    t12 = *((char **)t11);
    memset(t21, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB38;

LAB37:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB38;

LAB41:    if (*((unsigned int *)t5) < *((unsigned int *)t12))
        goto LAB40;

LAB39:    *((unsigned int *)t21) = 1;

LAB40:    t17 = (t21 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t21);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(222, ng0);

LAB46:    xsi_set_current_line(223, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(224, ng0);
    t2 = (t0 + 7048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 8, t4, 8, t5, 8);
    t11 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t11, t21, 0, 0, 8, 0LL);
    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(226, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(227, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng3)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB44:    goto LAB23;

LAB27:    t15 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB29;

LAB31:    xsi_set_current_line(195, ng0);

LAB34:    xsi_set_current_line(196, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(197, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(199, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 6728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng3)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);
    goto LAB33;

LAB38:    t15 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB40;

LAB42:    xsi_set_current_line(214, ng0);

LAB45:    xsi_set_current_line(215, ng0);
    t19 = ((char*)((ng2)));
    t20 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 7048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 6088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 6248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(219, ng0);
    t2 = (t0 + 4808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4808);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 28, 0LL);
    goto LAB44;

}

static void Always_251_4(char *t0)
{
    char t13[16];
    char t16[8];
    char t21[8];
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
    char *t17;
    int t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 9120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(251, ng0);
    t2 = (t0 + 10496);
    *((int *)t2) = 1;
    t3 = (t0 + 9152);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(252, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(260, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(318, ng0);

LAB46:    xsi_set_current_line(319, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(320, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(321, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(322, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(323, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB11:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(253, ng0);

LAB8:    xsi_set_current_line(254, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(255, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(256, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(257, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(258, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);
    goto LAB7;

LAB9:    xsi_set_current_line(261, ng0);
    t4 = (t0 + 6568);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 6408);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    xsi_vlogtype_concat(t16, 2, 2, 2U, t15, 1, t11, 1);

LAB12:    t17 = ((char*)((ng1)));
    t18 = xsi_vlog_unsigned_case_compare(t16, 2, t17, 2);
    if (t18 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng2)));
    t18 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t18 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng3)));
    t18 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t18 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(309, ng0);

LAB45:    xsi_set_current_line(310, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(311, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(312, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(313, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(314, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB21:    goto LAB11;

LAB13:    xsi_set_current_line(263, ng0);

LAB22:    xsi_set_current_line(264, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(265, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(266, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(267, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(268, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);
    goto LAB21;

LAB15:    xsi_set_current_line(271, ng0);

LAB23:    xsi_set_current_line(272, ng0);
    t3 = (t0 + 7208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2168U);
    t12 = *((char **)t11);
    memset(t21, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB25;

LAB24:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB25;

LAB28:    if (*((unsigned int *)t5) < *((unsigned int *)t12))
        goto LAB27;

LAB26:    *((unsigned int *)t21) = 1;

LAB27:    t17 = (t21 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t21);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(281, ng0);

LAB33:    xsi_set_current_line(282, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(283, ng0);
    t2 = (t0 + 7208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 8, t4, 8, t5, 8);
    t11 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t11, t21, 0, 0, 8, 0LL);
    xsi_set_current_line(284, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(285, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(286, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng2)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB31:    goto LAB21;

LAB17:    xsi_set_current_line(290, ng0);

LAB34:    xsi_set_current_line(291, ng0);
    t3 = (t0 + 7208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2168U);
    t12 = *((char **)t11);
    memset(t21, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB36;

LAB35:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB36;

LAB39:    if (*((unsigned int *)t5) < *((unsigned int *)t12))
        goto LAB38;

LAB37:    *((unsigned int *)t21) = 1;

LAB38:    t17 = (t21 + 4);
    t6 = *((unsigned int *)t17);
    t7 = (~(t6));
    t8 = *((unsigned int *)t21);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(300, ng0);

LAB44:    xsi_set_current_line(301, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(302, ng0);
    t2 = (t0 + 7208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 8, t4, 8, t5, 8);
    t11 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t11, t21, 0, 0, 8, 0LL);
    xsi_set_current_line(303, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(304, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(305, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng3)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);

LAB42:    goto LAB21;

LAB25:    t15 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB27;

LAB29:    xsi_set_current_line(273, ng0);

LAB32:    xsi_set_current_line(274, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(275, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(276, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(277, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(278, ng0);
    t2 = (t0 + 6888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng3)));
    xsi_vlogtype_concat(t13, 33, 33, 3U, t14, 2, t12, 8, t4, 23);
    t15 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t15, t13, 0, 0, 28, 0LL);
    goto LAB31;

LAB36:    t15 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB38;

LAB40:    xsi_set_current_line(292, ng0);

LAB43:    xsi_set_current_line(293, ng0);
    t19 = ((char*)((ng2)));
    t20 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(294, ng0);
    t2 = (t0 + 7208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(295, ng0);
    t2 = (t0 + 6408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(296, ng0);
    t2 = (t0 + 6568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(297, ng0);
    t2 = (t0 + 4968);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 28, 0LL);
    goto LAB42;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng2)));
    t3 = (t0 + 10576);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng2)));
    t3 = (t0 + 10640);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig3_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 9864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng2)));
    t3 = (t0 + 10704);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig4_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng1)));
    t3 = (t0 + 10768);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 16383U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 13);

LAB1:    return;
}


extern void work_m_00000000000334967124_3148738255_init()
{
	static char *pe[] = {(void *)Always_90_0,(void *)Always_121_1,(void *)Always_136_2,(void *)Always_171_3,(void *)Always_251_4,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute,(void *)implSig4_execute};
	xsi_register_didat("work_m_00000000000334967124_3148738255", "isim/tb_ecs_isim_beh.exe.sim/work/m_00000000000334967124_3148738255.didat");
	xsi_register_executes(pe);
}
