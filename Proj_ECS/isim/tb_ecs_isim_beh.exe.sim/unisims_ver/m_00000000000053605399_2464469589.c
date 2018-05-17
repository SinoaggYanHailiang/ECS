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
static unsigned int ng0[] = {1U, 0U};



static void Cont_35_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;

LAB0:    t1 = (t0 + 4104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1344U);
    t4 = *((char **)t2);
    t2 = (t0 + 1504U);
    t5 = *((char **)t2);
    t2 = (t0 + 1664U);
    t6 = *((char **)t2);
    t2 = (t0 + 1824U);
    t7 = *((char **)t2);
    t2 = (t0 + 1984U);
    t8 = *((char **)t2);
    t2 = (t0 + 2144U);
    t9 = *((char **)t2);
    xsi_vlogtype_concat(t3, 6, 6, 6U, t9, 1, t8, 1, t7, 1, t6, 1, t5, 1, t4, 1);
    t2 = (t0 + 5280);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memset(t13, 0, 8);
    t14 = 63U;
    t15 = t14;
    t16 = (t3 + 4);
    t17 = *((unsigned int *)t3);
    t14 = (t14 & t17);
    t18 = *((unsigned int *)t16);
    t15 = (t15 & t18);
    t19 = (t13 + 4);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t20 | t14);
    t21 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t21 | t15);
    xsi_driver_vfirst_trans(t2, 0, 5);
    t22 = (t0 + 5168);
    *((int *)t22) = 1;

LAB1:    return;
}

static void Cont_36_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 4352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3184);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 3184);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2784U);
    t10 = *((char **)t9);
    xsi_vlog_generic_get_index_select_value(t5, 1, t4, t8, 2, t10, 6, 2);
    t9 = (t0 + 5344);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memset(t14, 0, 8);
    t15 = 1U;
    t16 = t15;
    t17 = (t5 + 4);
    t18 = *((unsigned int *)t5);
    t15 = (t15 & t18);
    t19 = *((unsigned int *)t17);
    t16 = (t16 & t19);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t21 | t15);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t22 | t16);
    xsi_driver_vfirst_trans(t9, 0, 0);
    t23 = (t0 + 5184);
    *((int *)t23) = 1;

LAB1:    return;
}

static void Initial_38_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 472);
    t2 = *((char **)t1);
    t1 = (t0 + 3184);
    xsi_vlogvar_assign_value(t1, t2, 0, 0, 64);

LAB1:    return;
}

static void Always_41_3(char *t0)
{
    char t6[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
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
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;

LAB0:    t1 = (t0 + 4848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 5200);
    *((int *)t2) = 1;
    t3 = (t0 + 4880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t4 = (t0 + 2624U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng0)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB8;

LAB5:    if (t18 != 0)
        goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;

LAB8:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB8;

LAB9:    t28 = (t0 + 2304U);
    t29 = *((char **)t28);
    t28 = (t0 + 3184);
    t31 = (t0 + 3184);
    t32 = (t31 + 72U);
    t33 = *((char **)t32);
    t34 = (t0 + 2784U);
    t35 = *((char **)t34);
    xsi_vlog_generic_convert_bit_index(t30, t33, 2, t35, 6, 2);
    t34 = (t30 + 4);
    t36 = *((unsigned int *)t34);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB12;

LAB13:    goto LAB11;

LAB12:    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t30), 1, 100LL);
    goto LAB13;

}


extern void unisims_ver_m_00000000000053605399_2464469589_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2464469589", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2464469589.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1906017458_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1906017458", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1906017458.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4115563972_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4115563972", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4115563972.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0293639863_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0293639863", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0293639863.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2872007971_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2872007971", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2872007971.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2389852997_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2389852997", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2389852997.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2019170998_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2019170998", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2019170998.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3525583068_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3525583068", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3525583068.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0238971445_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0238971445", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0238971445.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3067853857_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3067853857", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3067853857.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3844228996_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3844228996", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3844228996.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1456771330_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1456771330", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1456771330.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4185630377_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4185630377", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4185630377.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1485911189_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1485911189", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1485911189.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1469164466_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1469164466", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1469164466.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0440742250_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0440742250", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0440742250.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1407988382_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1407988382", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1407988382.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4225991474_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4225991474", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4225991474.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_4233383987_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_4233383987", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_4233383987.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2422109424_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2422109424", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2422109424.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1409161530_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1409161530", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1409161530.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1763576811_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1763576811", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1763576811.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1207574693_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1207574693", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1207574693.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0371695140_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0371695140", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0371695140.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3862923299_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3862923299", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3862923299.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_2951009151_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_2951009151", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_2951009151.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3569115662_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3569115662", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3569115662.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0194161942_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0194161942", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0194161942.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0612677191_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0612677191", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0612677191.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0892253503_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0892253503", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0892253503.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_1679571931_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_1679571931", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_1679571931.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0168591717_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0168591717", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0168591717.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_3882767118_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_3882767118", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_3882767118.didat");
	xsi_register_executes(pe);
}

extern void unisims_ver_m_00000000000053605399_0256354384_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_41_3};
	xsi_register_didat("unisims_ver_m_00000000000053605399_0256354384", "isim/tb_ecs_isim_beh.exe.sim/unisims_ver/m_00000000000053605399_0256354384.didat");
	xsi_register_executes(pe);
}
