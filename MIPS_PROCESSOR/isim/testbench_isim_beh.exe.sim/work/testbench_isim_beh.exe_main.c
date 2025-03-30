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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_0774719531;
char *IEEE_P_3499444699;
char *IEEE_P_3564397177;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_0774719531_init();
    ieee_p_1242562249_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_3430011751_3212880686_init();
    work_a_1130845995_0831356973_init();
    work_a_3222946569_3212880686_init();
    work_a_1657022548_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_3396318600_3212880686_init();
    work_a_0308474336_3212880686_init();
    work_a_0137877920_3212880686_init();
    work_a_2635823028_3212880686_init();
    work_a_1218917173_3212880686_init();
    work_a_1228989981_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_3720894149_0831356973_init();
    work_a_0075444614_3212880686_init();
    work_a_0374534878_3212880686_init();
    work_a_3201991771_3212880686_init();
    work_a_3882926292_3212880686_init();
    work_a_1144588732_3212880686_init();
    work_a_1640669797_3212880686_init();
    work_a_1949178628_1985558087_init();


    xsi_register_tops("work_a_1949178628_1985558087");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
