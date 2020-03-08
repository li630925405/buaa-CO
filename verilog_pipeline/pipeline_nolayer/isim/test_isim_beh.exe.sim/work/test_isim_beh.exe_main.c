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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003534618430_3075639595_init();
    work_m_00000000002283368729_2822496749_init();
    work_m_00000000002204679099_1452706411_init();
    work_m_00000000002467517595_3210399350_init();
    work_m_00000000001001668245_2885957937_init();
    work_m_00000000003934400045_3224323566_init();
    work_m_00000000003870195027_0327331561_init();
    work_m_00000000001497156220_1733832700_init();
    work_m_00000000001067030221_3062290408_init();
    work_m_00000000000995314565_0757879789_init();
    work_m_00000000001372280050_4241813833_init();
    work_m_00000000003426588713_1579609468_init();
    work_m_00000000000008059898_0621066737_init();
    work_m_00000000003433173178_0238727309_init();
    work_m_00000000000080021159_2725559894_init();
    work_m_00000000002667215862_2924402094_init();
    work_m_00000000002869860732_3027548060_init();
    work_m_00000000004228641501_3877310806_init();
    work_m_00000000002047498008_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}