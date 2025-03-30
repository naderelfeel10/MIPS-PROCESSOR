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
static const char *ng0 = "C:/Users/ELFEEL/Xilinx/MIPS_PROCESSOR/dsggfs.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_1144588732_3212880686_p_0(char *t0)
{
    char t4[16];
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

LAB0:    xsi_set_current_line(18, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 1648U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 32U);
    xsi_set_current_line(19, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 1768U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 32U);
    xsi_set_current_line(20, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t0 + 5108U);
    t3 = (t0 + 1768U);
    t5 = *((char **)t3);
    t3 = (t0 + 5108U);
    t6 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t4, t2, t1, t5, t3);
    t7 = (t0 + 1888U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    t9 = (t4 + 12U);
    t10 = *((unsigned int *)t9);
    t11 = (1U * t10);
    memcpy(t7, t6, t11);
    xsi_set_current_line(21, ng0);
    t1 = (t0 + 1888U);
    t2 = *((char **)t1);
    t1 = (t0 + 3272);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3192);
    *((int *)t1) = 1;

LAB1:    return;
}


extern void work_a_1144588732_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1144588732_3212880686_p_0};
	xsi_register_didat("work_a_1144588732_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_1144588732_3212880686.didat");
	xsi_register_executes(pe);
}
