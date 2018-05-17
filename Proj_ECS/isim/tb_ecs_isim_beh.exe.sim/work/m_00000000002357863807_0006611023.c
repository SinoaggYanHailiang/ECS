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
static const char *ng0 = "D:/2_FPGA_program/Proj_ECS_sinoagg_v2_fft256_dac8551_fir/Proj_ECS/src/rx_bridge.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {170U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};



static void Always_48_0(char *t0)
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

LAB0:    t1 = (t0 + 4920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 5736);
    *((int *)t2) = 1;
    t3 = (t0 + 4952);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(49, ng0);
    t5 = (t0 + 2160U);
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

LAB10:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 4, 0LL);

LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(49, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 3840);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 4, 0LL);
    goto LAB11;

}

static void Always_53_1(char *t0)
{
    char t11[8];
    char t24[8];
    char t40[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    int t72;
    int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    char *t87;

LAB0:    t1 = (t0 + 5168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 5752);
    *((int *)t2) = 1;
    t3 = (t0 + 5200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(54, ng0);

LAB5:    xsi_set_current_line(55, ng0);
    t4 = (t0 + 3840);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(56, ng0);

LAB24:    xsi_set_current_line(57, ng0);
    t9 = (t0 + 2320U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    t9 = (t10 + 4);
    t12 = *((unsigned int *)t9);
    t13 = (~(t12));
    t14 = *((unsigned int *)t10);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t9) != 0)
        goto LAB27;

LAB28:    t18 = (t11 + 4);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t18);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB29;

LAB30:    memcpy(t48, t11, 8);

LAB31:    t80 = (t48 + 4);
    t81 = *((unsigned int *)t80);
    t82 = (~(t81));
    t83 = *((unsigned int *)t48);
    t84 = (t83 & t82);
    t85 = (t84 != 0);
    if (t85 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB45:    goto LAB23;

LAB9:    xsi_set_current_line(61, ng0);

LAB46:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 2320U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB49:    goto LAB23;

LAB11:    xsi_set_current_line(65, ng0);

LAB50:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 2320U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB51;

LAB52:    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB53:    goto LAB23;

LAB13:    xsi_set_current_line(69, ng0);

LAB54:    xsi_set_current_line(70, ng0);
    t3 = (t0 + 2320U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB57:    goto LAB23;

LAB15:    xsi_set_current_line(73, ng0);

LAB58:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 2320U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB61:    goto LAB23;

LAB17:    xsi_set_current_line(77, ng0);

LAB62:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 2320U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB63;

LAB64:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB65:    goto LAB23;

LAB19:    xsi_set_current_line(87, ng0);

LAB66:    xsi_set_current_line(88, ng0);
    t3 = (t0 + 2320U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t3) != 0)
        goto LAB69;

LAB70:    t7 = (t11 + 4);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t7);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB71;

LAB72:    memcpy(t48, t11, 8);

LAB73:    t53 = (t48 + 4);
    t81 = *((unsigned int *)t53);
    t82 = (~(t81));
    t83 = *((unsigned int *)t48);
    t84 = (t83 & t82);
    t85 = (t84 != 0);
    if (t85 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB87:    goto LAB23;

LAB25:    *((unsigned int *)t11) = 1;
    goto LAB28;

LAB27:    t17 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB28;

LAB29:    t22 = (t0 + 2480U);
    t23 = *((char **)t22);
    t22 = ((char*)((ng2)));
    memset(t24, 0, 8);
    t25 = (t23 + 4);
    t26 = (t22 + 4);
    t27 = *((unsigned int *)t23);
    t28 = *((unsigned int *)t22);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t26);
    t32 = (t30 ^ t31);
    t33 = (t29 | t32);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t26);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB35;

LAB32:    if (t36 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t24) = 1;

LAB35:    memset(t40, 0, 8);
    t41 = (t24 + 4);
    t42 = *((unsigned int *)t41);
    t43 = (~(t42));
    t44 = *((unsigned int *)t24);
    t45 = (t44 & t43);
    t46 = (t45 & 1U);
    if (t46 != 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t41) != 0)
        goto LAB38;

LAB39:    t49 = *((unsigned int *)t11);
    t50 = *((unsigned int *)t40);
    t51 = (t49 & t50);
    *((unsigned int *)t48) = t51;
    t52 = (t11 + 4);
    t53 = (t40 + 4);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t52);
    t56 = *((unsigned int *)t53);
    t57 = (t55 | t56);
    *((unsigned int *)t54) = t57;
    t58 = *((unsigned int *)t54);
    t59 = (t58 != 0);
    if (t59 == 1)
        goto LAB40;

LAB41:
LAB42:    goto LAB31;

LAB34:    t39 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB35;

LAB36:    *((unsigned int *)t40) = 1;
    goto LAB39;

LAB38:    t47 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB39;

LAB40:    t60 = *((unsigned int *)t48);
    t61 = *((unsigned int *)t54);
    *((unsigned int *)t48) = (t60 | t61);
    t62 = (t11 + 4);
    t63 = (t40 + 4);
    t64 = *((unsigned int *)t11);
    t65 = (~(t64));
    t66 = *((unsigned int *)t62);
    t67 = (~(t66));
    t68 = *((unsigned int *)t40);
    t69 = (~(t68));
    t70 = *((unsigned int *)t63);
    t71 = (~(t70));
    t72 = (t65 & t67);
    t73 = (t69 & t71);
    t74 = (~(t72));
    t75 = (~(t73));
    t76 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t76 & t74);
    t77 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t77 & t75);
    t78 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t78 & t74);
    t79 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t79 & t75);
    goto LAB42;

LAB43:    xsi_set_current_line(57, ng0);
    t86 = ((char*)((ng3)));
    t87 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t87, t86, 0, 0, 4, 0LL);
    goto LAB45;

LAB47:    xsi_set_current_line(62, ng0);
    t5 = ((char*)((ng4)));
    t7 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    goto LAB49;

LAB51:    xsi_set_current_line(66, ng0);
    t5 = ((char*)((ng5)));
    t7 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    goto LAB53;

LAB55:    xsi_set_current_line(70, ng0);
    t5 = ((char*)((ng6)));
    t7 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    goto LAB57;

LAB59:    xsi_set_current_line(74, ng0);
    t5 = ((char*)((ng7)));
    t7 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    goto LAB61;

LAB63:    xsi_set_current_line(78, ng0);
    t5 = ((char*)((ng8)));
    t7 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    goto LAB65;

LAB67:    *((unsigned int *)t11) = 1;
    goto LAB70;

LAB69:    t5 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB70;

LAB71:    t9 = (t0 + 2480U);
    t10 = *((char **)t9);
    t9 = ((char*)((ng2)));
    memset(t24, 0, 8);
    t17 = (t10 + 4);
    t18 = (t9 + 4);
    t27 = *((unsigned int *)t10);
    t28 = *((unsigned int *)t9);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t17);
    t31 = *((unsigned int *)t18);
    t32 = (t30 ^ t31);
    t33 = (t29 | t32);
    t34 = *((unsigned int *)t17);
    t35 = *((unsigned int *)t18);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB77;

LAB74:    if (t36 != 0)
        goto LAB76;

LAB75:    *((unsigned int *)t24) = 1;

LAB77:    memset(t40, 0, 8);
    t23 = (t24 + 4);
    t42 = *((unsigned int *)t23);
    t43 = (~(t42));
    t44 = *((unsigned int *)t24);
    t45 = (t44 & t43);
    t46 = (t45 & 1U);
    if (t46 != 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t23) != 0)
        goto LAB80;

LAB81:    t49 = *((unsigned int *)t11);
    t50 = *((unsigned int *)t40);
    t51 = (t49 & t50);
    *((unsigned int *)t48) = t51;
    t26 = (t11 + 4);
    t39 = (t40 + 4);
    t41 = (t48 + 4);
    t55 = *((unsigned int *)t26);
    t56 = *((unsigned int *)t39);
    t57 = (t55 | t56);
    *((unsigned int *)t41) = t57;
    t58 = *((unsigned int *)t41);
    t59 = (t58 != 0);
    if (t59 == 1)
        goto LAB82;

LAB83:
LAB84:    goto LAB73;

LAB76:    t22 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB77;

LAB78:    *((unsigned int *)t40) = 1;
    goto LAB81;

LAB80:    t25 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB81;

LAB82:    t60 = *((unsigned int *)t48);
    t61 = *((unsigned int *)t41);
    *((unsigned int *)t48) = (t60 | t61);
    t47 = (t11 + 4);
    t52 = (t40 + 4);
    t64 = *((unsigned int *)t11);
    t65 = (~(t64));
    t66 = *((unsigned int *)t47);
    t67 = (~(t66));
    t68 = *((unsigned int *)t40);
    t69 = (~(t68));
    t70 = *((unsigned int *)t52);
    t71 = (~(t70));
    t72 = (t65 & t67);
    t73 = (t69 & t71);
    t74 = (~(t72));
    t75 = (~(t73));
    t76 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t76 & t74);
    t77 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t77 & t75);
    t78 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t78 & t74);
    t79 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t79 & t75);
    goto LAB84;

LAB85:    xsi_set_current_line(88, ng0);
    t54 = ((char*)((ng3)));
    t62 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t62, t54, 0, 0, 4, 0LL);
    goto LAB87;

}

static void Always_96_2(char *t0)
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
    int t21;

LAB0:    t1 = (t0 + 5416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 5768);
    *((int *)t2) = 1;
    t3 = (t0 + 5448);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(97, ng0);
    t5 = (t0 + 2160U);
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

LAB10:    xsi_set_current_line(106, ng0);

LAB13:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3840);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB14:    t6 = ((char*)((ng1)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t6, 4);
    if (t21 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng3)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t21 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng4)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t21 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng5)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t21 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng6)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t21 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng7)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t21 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng8)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t21 == 1)
        goto LAB27;

LAB28:
LAB30:
LAB29:    xsi_set_current_line(222, ng0);

LAB59:    xsi_set_current_line(223, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(224, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(226, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(227, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(228, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB31:
LAB11:    goto LAB2;

LAB5:    *((unsigned int *)t4) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(98, ng0);

LAB12:    xsi_set_current_line(99, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB11;

LAB15:    xsi_set_current_line(109, ng0);

LAB32:    xsi_set_current_line(110, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB31;

LAB17:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 2320U);
    t6 = *((char **)t3);
    t3 = (t6 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(128, ng0);

LAB37:    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB35:    goto LAB31;

LAB19:    xsi_set_current_line(137, ng0);
    t3 = (t0 + 2320U);
    t6 = *((char **)t3);
    t3 = (t6 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(147, ng0);

LAB42:    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB40:    goto LAB31;

LAB21:    xsi_set_current_line(156, ng0);
    t3 = (t0 + 2320U);
    t6 = *((char **)t3);
    t3 = (t6 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(166, ng0);

LAB47:    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 3360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(171, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(172, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB45:    goto LAB31;

LAB23:    xsi_set_current_line(175, ng0);
    t3 = (t0 + 2320U);
    t6 = *((char **)t3);
    t3 = (t6 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB48;

LAB49:    xsi_set_current_line(185, ng0);

LAB52:    xsi_set_current_line(186, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = (t0 + 3360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(190, ng0);
    t2 = (t0 + 3520);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB50:    goto LAB31;

LAB25:    xsi_set_current_line(194, ng0);
    t3 = (t0 + 2320U);
    t6 = *((char **)t3);
    t3 = (t6 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(204, ng0);

LAB57:    xsi_set_current_line(205, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(206, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(208, ng0);
    t2 = (t0 + 3360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(209, ng0);
    t2 = (t0 + 3520);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(210, ng0);
    t2 = (t0 + 3680);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);

LAB55:    goto LAB31;

LAB27:    xsi_set_current_line(213, ng0);

LAB58:    xsi_set_current_line(214, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 3360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 3520);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(219, ng0);
    t2 = (t0 + 3680);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    goto LAB31;

LAB33:    xsi_set_current_line(119, ng0);

LAB36:    xsi_set_current_line(120, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    t2 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB35;

LAB38:    xsi_set_current_line(138, ng0);

LAB41:    xsi_set_current_line(139, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    t2 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB40;

LAB43:    xsi_set_current_line(157, ng0);

LAB46:    xsi_set_current_line(158, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    t2 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB45;

LAB48:    xsi_set_current_line(176, ng0);

LAB51:    xsi_set_current_line(177, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 3360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    t2 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(182, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB50;

LAB53:    xsi_set_current_line(195, ng0);

LAB56:    xsi_set_current_line(196, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2880);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(197, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3040);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = (t0 + 3200);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3200);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 3360);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3360);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 3520);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3520);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    t2 = (t0 + 3680);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    goto LAB55;

}


extern void work_m_00000000002357863807_0006611023_init()
{
	static char *pe[] = {(void *)Always_48_0,(void *)Always_53_1,(void *)Always_96_2};
	xsi_register_didat("work_m_00000000002357863807_0006611023", "isim/tb_ecs_isim_beh.exe.sim/work/m_00000000002357863807_0006611023.didat");
	xsi_register_executes(pe);
}
