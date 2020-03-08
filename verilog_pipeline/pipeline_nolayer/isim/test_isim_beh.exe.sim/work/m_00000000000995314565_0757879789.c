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
static const char *ng0 = "E:/homework/CC/verilog_pipeline/pipeline_nolayer/NPC.v";
static int ng1[] = {0, 0};
static int ng2[] = {4, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {14, 0};
static int ng6[] = {2, 0};
static int ng7[] = {3, 0};



static void Always_34_0(char *t0)
{
    char t9[8];
    char t11[8];
    char t21[8];
    char t22[8];
    char t32[8];
    char t36[8];
    char t44[8];
    char t51[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    char *t52;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 3968);
    *((int *)t2) = 1;
    t3 = (t0 + 3680);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(34, ng0);

LAB5:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t9, 0, 0, 32);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(36, ng0);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    t7 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t8, 32, t7, 32);
    t10 = (t0 + 2728);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 32);
    goto LAB17;

LAB9:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t3 = (t4 + 4);
    t12 = *((unsigned int *)t3);
    t13 = (~(t12));
    t14 = *((unsigned int *)t4);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t3) != 0)
        goto LAB20;

LAB21:    t8 = (t11 + 4);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t8);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB22;

LAB23:    t45 = *((unsigned int *)t11);
    t46 = (~(t45));
    t47 = *((unsigned int *)t8);
    t48 = (t46 || t47);
    if (t48 > 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t8) > 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t11) > 0)
        goto LAB28;

LAB29:    memcpy(t9, t51, 8);

LAB30:    t52 = (t0 + 2728);
    xsi_vlogvar_assign_value(t52, t9, 0, 0, 32);
    goto LAB17;

LAB11:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    memset(t11, 0, 8);
    t4 = (t11 + 4);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 28);
    *((unsigned int *)t11) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 28);
    *((unsigned int *)t4) = t15;
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 15U);
    t17 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t17 & 15U);
    xsi_vlogtype_concat(t9, 32, 32, 3U, t11, 4, t7, 26, t3, 2);
    t20 = (t0 + 2728);
    xsi_vlogvar_assign_value(t20, t9, 0, 0, 32);
    goto LAB17;

LAB13:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 2328U);
    t4 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB17;

LAB18:    *((unsigned int *)t11) = 1;
    goto LAB21;

LAB20:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB21;

LAB22:    t10 = (t0 + 1048U);
    t20 = *((char **)t10);
    t10 = ((char*)((ng4)));
    t23 = (t0 + 1208U);
    t24 = *((char **)t23);
    memset(t22, 0, 8);
    t23 = (t22 + 4);
    t25 = (t24 + 4);
    t26 = *((unsigned int *)t24);
    t27 = (t26 >> 0);
    *((unsigned int *)t22) = t27;
    t28 = *((unsigned int *)t25);
    t29 = (t28 >> 0);
    *((unsigned int *)t23) = t29;
    t30 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t30 & 65535U);
    t31 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t31 & 65535U);
    t33 = ((char*)((ng5)));
    t34 = (t0 + 1208U);
    t35 = *((char **)t34);
    memset(t36, 0, 8);
    t34 = (t36 + 4);
    t37 = (t35 + 4);
    t38 = *((unsigned int *)t35);
    t39 = (t38 >> 15);
    t40 = (t39 & 1);
    *((unsigned int *)t36) = t40;
    t41 = *((unsigned int *)t37);
    t42 = (t41 >> 15);
    t43 = (t42 & 1);
    *((unsigned int *)t34) = t43;
    xsi_vlog_mul_concat(t32, 14, 1, t33, 1U, t36, 1);
    xsi_vlogtype_concat(t21, 32, 32, 3U, t32, 14, t22, 16, t10, 2);
    memset(t44, 0, 8);
    xsi_vlog_unsigned_add(t44, 32, t20, 32, t21, 32);
    goto LAB23;

LAB24:    t49 = (t0 + 1048U);
    t50 = *((char **)t49);
    t49 = ((char*)((ng2)));
    memset(t51, 0, 8);
    xsi_vlog_unsigned_add(t51, 32, t50, 32, t49, 32);
    goto LAB25;

LAB26:    xsi_vlog_unsigned_bit_combine(t9, 32, t44, 32, t51, 32);
    goto LAB30;

LAB28:    memcpy(t9, t44, 8);
    goto LAB30;

}


extern void work_m_00000000000995314565_0757879789_init()
{
	static char *pe[] = {(void *)Always_34_0};
	xsi_register_didat("work_m_00000000000995314565_0757879789", "isim/test_isim_beh.exe.sim/work/m_00000000000995314565_0757879789.didat");
	xsi_register_executes(pe);
}
