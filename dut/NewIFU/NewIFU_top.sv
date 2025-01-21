module NewIFU_top;

  logic  clock;
  logic  reset;
  logic  io_ftqInter_fromFtq_req_ready;
  logic  io_ftqInter_fromFtq_req_valid;
  logic [49:0] io_ftqInter_fromFtq_req_bits_startAddr;
  logic [49:0] io_ftqInter_fromFtq_req_bits_nextlineStart;
  logic [49:0] io_ftqInter_fromFtq_req_bits_nextStartAddr;
  logic  io_ftqInter_fromFtq_req_bits_ftqIdx_flag;
  logic [5:0] io_ftqInter_fromFtq_req_bits_ftqIdx_value;
  logic  io_ftqInter_fromFtq_req_bits_ftqOffset_valid;
  logic [3:0] io_ftqInter_fromFtq_req_bits_ftqOffset_bits;
  logic  io_ftqInter_fromFtq_redirect_valid;
  logic  io_ftqInter_fromFtq_redirect_bits_ftqIdx_flag;
  logic [5:0] io_ftqInter_fromFtq_redirect_bits_ftqIdx_value;
  logic [3:0] io_ftqInter_fromFtq_redirect_bits_ftqOffset;
  logic  io_ftqInter_fromFtq_redirect_bits_level;
  logic  io_ftqInter_fromFtq_flushFromBpu_s2_valid;
  logic  io_ftqInter_fromFtq_flushFromBpu_s2_bits_flag;
  logic [5:0] io_ftqInter_fromFtq_flushFromBpu_s2_bits_value;
  logic  io_ftqInter_fromFtq_flushFromBpu_s3_valid;
  logic  io_ftqInter_fromFtq_flushFromBpu_s3_bits_flag;
  logic [5:0] io_ftqInter_fromFtq_flushFromBpu_s3_bits_value;
  logic  io_ftqInter_toFtq_pdWb_valid;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_0;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_1;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_2;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_3;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_4;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_5;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_6;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_7;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_8;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_9;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_10;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_11;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_12;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_13;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_14;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_pc_15;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_0_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_0_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_0_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_0_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_0_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_1_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_1_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_1_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_1_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_1_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_2_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_2_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_2_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_2_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_2_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_3_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_3_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_3_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_3_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_3_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_4_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_4_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_4_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_4_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_4_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_5_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_5_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_5_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_5_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_5_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_6_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_6_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_6_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_6_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_6_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_7_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_7_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_7_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_7_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_7_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_8_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_8_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_8_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_8_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_8_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_9_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_9_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_9_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_9_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_9_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_10_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_10_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_10_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_10_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_10_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_11_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_11_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_11_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_11_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_11_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_12_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_12_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_12_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_12_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_12_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_13_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_13_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_13_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_13_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_13_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_14_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_14_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_14_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_14_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_14_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_15_valid;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_15_isRVC;
  logic [1:0] io_ftqInter_toFtq_pdWb_bits_pd_15_brType;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_15_isCall;
  logic  io_ftqInter_toFtq_pdWb_bits_pd_15_isRet;
  logic  io_ftqInter_toFtq_pdWb_bits_ftqIdx_flag;
  logic [5:0] io_ftqInter_toFtq_pdWb_bits_ftqIdx_value;
  logic  io_ftqInter_toFtq_pdWb_bits_misOffset_valid;
  logic [3:0] io_ftqInter_toFtq_pdWb_bits_misOffset_bits;
  logic  io_ftqInter_toFtq_pdWb_bits_cfiOffset_valid;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_target;
  logic [49:0] io_ftqInter_toFtq_pdWb_bits_jalTarget;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_0;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_1;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_2;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_3;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_4;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_5;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_6;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_7;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_8;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_9;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_10;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_11;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_12;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_13;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_14;
  logic  io_ftqInter_toFtq_pdWb_bits_instrRange_15;
  logic  io_icacheInter_icacheReady;
  logic  io_icacheInter_resp_valid;
  logic  io_icacheInter_resp_bits_doubleline;
  logic [49:0] io_icacheInter_resp_bits_vaddr_0;
  logic [49:0] io_icacheInter_resp_bits_vaddr_1;
  logic [511:0] io_icacheInter_resp_bits_data;
  logic [47:0] io_icacheInter_resp_bits_paddr_0;
  logic [1:0] io_icacheInter_resp_bits_exception_0;
  logic [1:0] io_icacheInter_resp_bits_exception_1;
  logic  io_icacheInter_resp_bits_pmp_mmio_0;
  logic  io_icacheInter_resp_bits_pmp_mmio_1;
  logic [1:0] io_icacheInter_resp_bits_itlb_pbmt_0;
  logic [1:0] io_icacheInter_resp_bits_itlb_pbmt_1;
  logic  io_icacheInter_resp_bits_backendException;
  logic [55:0] io_icacheInter_resp_bits_gpaddr;
  logic  io_icacheInter_resp_bits_isForVSnonLeafPTE;
  logic  io_icacheStop;
  logic  io_icachePerfInfo_only_0_hit;
  logic  io_icachePerfInfo_only_0_miss;
  logic  io_icachePerfInfo_hit_0_hit_1;
  logic  io_icachePerfInfo_hit_0_miss_1;
  logic  io_icachePerfInfo_miss_0_hit_1;
  logic  io_icachePerfInfo_miss_0_miss_1;
  logic  io_icachePerfInfo_bank_hit_1;
  logic  io_icachePerfInfo_hit;
  logic  io_toIbuffer_ready;
  logic  io_toIbuffer_valid;
  logic [31:0] io_toIbuffer_bits_instrs_0;
  logic [31:0] io_toIbuffer_bits_instrs_1;
  logic [31:0] io_toIbuffer_bits_instrs_2;
  logic [31:0] io_toIbuffer_bits_instrs_3;
  logic [31:0] io_toIbuffer_bits_instrs_4;
  logic [31:0] io_toIbuffer_bits_instrs_5;
  logic [31:0] io_toIbuffer_bits_instrs_6;
  logic [31:0] io_toIbuffer_bits_instrs_7;
  logic [31:0] io_toIbuffer_bits_instrs_8;
  logic [31:0] io_toIbuffer_bits_instrs_9;
  logic [31:0] io_toIbuffer_bits_instrs_10;
  logic [31:0] io_toIbuffer_bits_instrs_11;
  logic [31:0] io_toIbuffer_bits_instrs_12;
  logic [31:0] io_toIbuffer_bits_instrs_13;
  logic [31:0] io_toIbuffer_bits_instrs_14;
  logic [31:0] io_toIbuffer_bits_instrs_15;
  logic [15:0] io_toIbuffer_bits_valid;
  logic [15:0] io_toIbuffer_bits_enqEnable;
  logic  io_toIbuffer_bits_pd_0_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_0_brType;
  logic  io_toIbuffer_bits_pd_1_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_1_brType;
  logic  io_toIbuffer_bits_pd_2_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_2_brType;
  logic  io_toIbuffer_bits_pd_3_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_3_brType;
  logic  io_toIbuffer_bits_pd_4_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_4_brType;
  logic  io_toIbuffer_bits_pd_5_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_5_brType;
  logic  io_toIbuffer_bits_pd_6_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_6_brType;
  logic  io_toIbuffer_bits_pd_7_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_7_brType;
  logic  io_toIbuffer_bits_pd_8_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_8_brType;
  logic  io_toIbuffer_bits_pd_9_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_9_brType;
  logic  io_toIbuffer_bits_pd_10_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_10_brType;
  logic  io_toIbuffer_bits_pd_11_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_11_brType;
  logic  io_toIbuffer_bits_pd_12_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_12_brType;
  logic  io_toIbuffer_bits_pd_13_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_13_brType;
  logic  io_toIbuffer_bits_pd_14_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_14_brType;
  logic  io_toIbuffer_bits_pd_15_isRVC;
  logic [1:0] io_toIbuffer_bits_pd_15_brType;
  logic [9:0] io_toIbuffer_bits_foldpc_0;
  logic [9:0] io_toIbuffer_bits_foldpc_1;
  logic [9:0] io_toIbuffer_bits_foldpc_2;
  logic [9:0] io_toIbuffer_bits_foldpc_3;
  logic [9:0] io_toIbuffer_bits_foldpc_4;
  logic [9:0] io_toIbuffer_bits_foldpc_5;
  logic [9:0] io_toIbuffer_bits_foldpc_6;
  logic [9:0] io_toIbuffer_bits_foldpc_7;
  logic [9:0] io_toIbuffer_bits_foldpc_8;
  logic [9:0] io_toIbuffer_bits_foldpc_9;
  logic [9:0] io_toIbuffer_bits_foldpc_10;
  logic [9:0] io_toIbuffer_bits_foldpc_11;
  logic [9:0] io_toIbuffer_bits_foldpc_12;
  logic [9:0] io_toIbuffer_bits_foldpc_13;
  logic [9:0] io_toIbuffer_bits_foldpc_14;
  logic [9:0] io_toIbuffer_bits_foldpc_15;
  logic  io_toIbuffer_bits_ftqOffset_0_valid;
  logic  io_toIbuffer_bits_ftqOffset_1_valid;
  logic  io_toIbuffer_bits_ftqOffset_2_valid;
  logic  io_toIbuffer_bits_ftqOffset_3_valid;
  logic  io_toIbuffer_bits_ftqOffset_4_valid;
  logic  io_toIbuffer_bits_ftqOffset_5_valid;
  logic  io_toIbuffer_bits_ftqOffset_6_valid;
  logic  io_toIbuffer_bits_ftqOffset_7_valid;
  logic  io_toIbuffer_bits_ftqOffset_8_valid;
  logic  io_toIbuffer_bits_ftqOffset_9_valid;
  logic  io_toIbuffer_bits_ftqOffset_10_valid;
  logic  io_toIbuffer_bits_ftqOffset_11_valid;
  logic  io_toIbuffer_bits_ftqOffset_12_valid;
  logic  io_toIbuffer_bits_ftqOffset_13_valid;
  logic  io_toIbuffer_bits_ftqOffset_14_valid;
  logic  io_toIbuffer_bits_ftqOffset_15_valid;
  logic  io_toIbuffer_bits_backendException_0;
  logic [1:0] io_toIbuffer_bits_exceptionType_0;
  logic [1:0] io_toIbuffer_bits_exceptionType_1;
  logic [1:0] io_toIbuffer_bits_exceptionType_2;
  logic [1:0] io_toIbuffer_bits_exceptionType_3;
  logic [1:0] io_toIbuffer_bits_exceptionType_4;
  logic [1:0] io_toIbuffer_bits_exceptionType_5;
  logic [1:0] io_toIbuffer_bits_exceptionType_6;
  logic [1:0] io_toIbuffer_bits_exceptionType_7;
  logic [1:0] io_toIbuffer_bits_exceptionType_8;
  logic [1:0] io_toIbuffer_bits_exceptionType_9;
  logic [1:0] io_toIbuffer_bits_exceptionType_10;
  logic [1:0] io_toIbuffer_bits_exceptionType_11;
  logic [1:0] io_toIbuffer_bits_exceptionType_12;
  logic [1:0] io_toIbuffer_bits_exceptionType_13;
  logic [1:0] io_toIbuffer_bits_exceptionType_14;
  logic [1:0] io_toIbuffer_bits_exceptionType_15;
  logic  io_toIbuffer_bits_crossPageIPFFix_0;
  logic  io_toIbuffer_bits_crossPageIPFFix_1;
  logic  io_toIbuffer_bits_crossPageIPFFix_2;
  logic  io_toIbuffer_bits_crossPageIPFFix_3;
  logic  io_toIbuffer_bits_crossPageIPFFix_4;
  logic  io_toIbuffer_bits_crossPageIPFFix_5;
  logic  io_toIbuffer_bits_crossPageIPFFix_6;
  logic  io_toIbuffer_bits_crossPageIPFFix_7;
  logic  io_toIbuffer_bits_crossPageIPFFix_8;
  logic  io_toIbuffer_bits_crossPageIPFFix_9;
  logic  io_toIbuffer_bits_crossPageIPFFix_10;
  logic  io_toIbuffer_bits_crossPageIPFFix_11;
  logic  io_toIbuffer_bits_crossPageIPFFix_12;
  logic  io_toIbuffer_bits_crossPageIPFFix_13;
  logic  io_toIbuffer_bits_crossPageIPFFix_14;
  logic  io_toIbuffer_bits_crossPageIPFFix_15;
  logic  io_toIbuffer_bits_illegalInstr_0;
  logic  io_toIbuffer_bits_illegalInstr_1;
  logic  io_toIbuffer_bits_illegalInstr_2;
  logic  io_toIbuffer_bits_illegalInstr_3;
  logic  io_toIbuffer_bits_illegalInstr_4;
  logic  io_toIbuffer_bits_illegalInstr_5;
  logic  io_toIbuffer_bits_illegalInstr_6;
  logic  io_toIbuffer_bits_illegalInstr_7;
  logic  io_toIbuffer_bits_illegalInstr_8;
  logic  io_toIbuffer_bits_illegalInstr_9;
  logic  io_toIbuffer_bits_illegalInstr_10;
  logic  io_toIbuffer_bits_illegalInstr_11;
  logic  io_toIbuffer_bits_illegalInstr_12;
  logic  io_toIbuffer_bits_illegalInstr_13;
  logic  io_toIbuffer_bits_illegalInstr_14;
  logic  io_toIbuffer_bits_illegalInstr_15;
  logic [3:0] io_toIbuffer_bits_triggered_0;
  logic [3:0] io_toIbuffer_bits_triggered_1;
  logic [3:0] io_toIbuffer_bits_triggered_2;
  logic [3:0] io_toIbuffer_bits_triggered_3;
  logic [3:0] io_toIbuffer_bits_triggered_4;
  logic [3:0] io_toIbuffer_bits_triggered_5;
  logic [3:0] io_toIbuffer_bits_triggered_6;
  logic [3:0] io_toIbuffer_bits_triggered_7;
  logic [3:0] io_toIbuffer_bits_triggered_8;
  logic [3:0] io_toIbuffer_bits_triggered_9;
  logic [3:0] io_toIbuffer_bits_triggered_10;
  logic [3:0] io_toIbuffer_bits_triggered_11;
  logic [3:0] io_toIbuffer_bits_triggered_12;
  logic [3:0] io_toIbuffer_bits_triggered_13;
  logic [3:0] io_toIbuffer_bits_triggered_14;
  logic [3:0] io_toIbuffer_bits_triggered_15;
  logic  io_toIbuffer_bits_isLastInFtqEntry_0;
  logic  io_toIbuffer_bits_isLastInFtqEntry_1;
  logic  io_toIbuffer_bits_isLastInFtqEntry_2;
  logic  io_toIbuffer_bits_isLastInFtqEntry_3;
  logic  io_toIbuffer_bits_isLastInFtqEntry_4;
  logic  io_toIbuffer_bits_isLastInFtqEntry_5;
  logic  io_toIbuffer_bits_isLastInFtqEntry_6;
  logic  io_toIbuffer_bits_isLastInFtqEntry_7;
  logic  io_toIbuffer_bits_isLastInFtqEntry_8;
  logic  io_toIbuffer_bits_isLastInFtqEntry_9;
  logic  io_toIbuffer_bits_isLastInFtqEntry_10;
  logic  io_toIbuffer_bits_isLastInFtqEntry_11;
  logic  io_toIbuffer_bits_isLastInFtqEntry_12;
  logic  io_toIbuffer_bits_isLastInFtqEntry_13;
  logic  io_toIbuffer_bits_isLastInFtqEntry_14;
  logic  io_toIbuffer_bits_isLastInFtqEntry_15;
  logic  io_toIbuffer_bits_ftqPtr_flag;
  logic [5:0] io_toIbuffer_bits_ftqPtr_value;
  logic  io_toBackend_gpaddrMem_wen;
  logic [5:0] io_toBackend_gpaddrMem_waddr;
  logic [55:0] io_toBackend_gpaddrMem_wdata_gpaddr;
  logic  io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTE;
  logic  io_uncacheInter_fromUncache_valid;
  logic [31:0] io_uncacheInter_fromUncache_bits_data;
  logic  io_uncacheInter_toUncache_ready;
  logic  io_uncacheInter_toUncache_valid;
  logic [47:0] io_uncacheInter_toUncache_bits_addr;
  logic  io_frontendTrigger_tUpdate_valid;
  logic [1:0] io_frontendTrigger_tUpdate_bits_addr;
  logic [1:0] io_frontendTrigger_tUpdate_bits_tdata_matchType;
  logic  io_frontendTrigger_tUpdate_bits_tdata_select;
  logic [3:0] io_frontendTrigger_tUpdate_bits_tdata_action;
  logic  io_frontendTrigger_tUpdate_bits_tdata_chain;
  logic [63:0] io_frontendTrigger_tUpdate_bits_tdata_tdata2;
  logic  io_frontendTrigger_tEnableVec_0;
  logic  io_frontendTrigger_tEnableVec_1;
  logic  io_frontendTrigger_tEnableVec_2;
  logic  io_frontendTrigger_tEnableVec_3;
  logic  io_frontendTrigger_debugMode;
  logic  io_frontendTrigger_triggerCanRaiseBpExp;
  logic  io_rob_commits_0_valid;
  logic  io_rob_commits_0_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_0_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_0_bits_ftqOffset;
  logic  io_rob_commits_1_valid;
  logic  io_rob_commits_1_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_1_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_1_bits_ftqOffset;
  logic  io_rob_commits_2_valid;
  logic  io_rob_commits_2_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_2_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_2_bits_ftqOffset;
  logic  io_rob_commits_3_valid;
  logic  io_rob_commits_3_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_3_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_3_bits_ftqOffset;
  logic  io_rob_commits_4_valid;
  logic  io_rob_commits_4_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_4_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_4_bits_ftqOffset;
  logic  io_rob_commits_5_valid;
  logic  io_rob_commits_5_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_5_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_5_bits_ftqOffset;
  logic  io_rob_commits_6_valid;
  logic  io_rob_commits_6_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_6_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_6_bits_ftqOffset;
  logic  io_rob_commits_7_valid;
  logic  io_rob_commits_7_bits_ftqIdx_flag;
  logic [5:0] io_rob_commits_7_bits_ftqIdx_value;
  logic [3:0] io_rob_commits_7_bits_ftqOffset;
  logic  io_iTLBInter_req_ready;
  logic  io_iTLBInter_req_valid;
  logic [49:0] io_iTLBInter_req_bits_vaddr;
  logic  io_iTLBInter_resp_ready;
  logic  io_iTLBInter_resp_valid;
  logic [47:0] io_iTLBInter_resp_bits_paddr_0;
  logic [63:0] io_iTLBInter_resp_bits_gpaddr_0;
  logic [1:0] io_iTLBInter_resp_bits_pbmt_0;
  logic  io_iTLBInter_resp_bits_isForVSnonLeafPTE;
  logic  io_iTLBInter_resp_bits_excp_0_gpf_instr;
  logic  io_iTLBInter_resp_bits_excp_0_pf_instr;
  logic  io_iTLBInter_resp_bits_excp_0_af_instr;
  logic [47:0] io_pmp_req_bits_addr;
  logic  io_pmp_resp_instr;
  logic  io_pmp_resp_mmio;
  logic  io_mmioCommitRead_mmioFtqPtr_flag;
  logic [5:0] io_mmioCommitRead_mmioFtqPtr_value;
  logic  io_mmioCommitRead_mmioLastCommit;
  logic  io_csr_fsIsOff;
  logic [5:0] io_perf_0_value;
  logic [5:0] io_perf_1_value;
  logic [5:0] io_perf_2_value;
  logic [5:0] io_perf_3_value;
  logic [5:0] io_perf_4_value;
  logic [5:0] io_perf_5_value;
  logic [5:0] io_perf_6_value;
  logic [5:0] io_perf_7_value;
  logic [5:0] io_perf_8_value;
  logic [5:0] io_perf_9_value;
  logic [5:0] io_perf_10_value;
  logic [5:0] io_perf_11_value;
  logic [5:0] io_perf_12_value;


 NewIFU NewIFU(
    .clock(clock),
    .reset(reset),
    .io_ftqInter_fromFtq_req_ready(io_ftqInter_fromFtq_req_ready),
    .io_ftqInter_fromFtq_req_valid(io_ftqInter_fromFtq_req_valid),
    .io_ftqInter_fromFtq_req_bits_startAddr(io_ftqInter_fromFtq_req_bits_startAddr),
    .io_ftqInter_fromFtq_req_bits_nextlineStart(io_ftqInter_fromFtq_req_bits_nextlineStart),
    .io_ftqInter_fromFtq_req_bits_nextStartAddr(io_ftqInter_fromFtq_req_bits_nextStartAddr),
    .io_ftqInter_fromFtq_req_bits_ftqIdx_flag(io_ftqInter_fromFtq_req_bits_ftqIdx_flag),
    .io_ftqInter_fromFtq_req_bits_ftqIdx_value(io_ftqInter_fromFtq_req_bits_ftqIdx_value),
    .io_ftqInter_fromFtq_req_bits_ftqOffset_valid(io_ftqInter_fromFtq_req_bits_ftqOffset_valid),
    .io_ftqInter_fromFtq_req_bits_ftqOffset_bits(io_ftqInter_fromFtq_req_bits_ftqOffset_bits),
    .io_ftqInter_fromFtq_redirect_valid(io_ftqInter_fromFtq_redirect_valid),
    .io_ftqInter_fromFtq_redirect_bits_ftqIdx_flag(io_ftqInter_fromFtq_redirect_bits_ftqIdx_flag),
    .io_ftqInter_fromFtq_redirect_bits_ftqIdx_value(io_ftqInter_fromFtq_redirect_bits_ftqIdx_value),
    .io_ftqInter_fromFtq_redirect_bits_ftqOffset(io_ftqInter_fromFtq_redirect_bits_ftqOffset),
    .io_ftqInter_fromFtq_redirect_bits_level(io_ftqInter_fromFtq_redirect_bits_level),
    .io_ftqInter_fromFtq_flushFromBpu_s2_valid(io_ftqInter_fromFtq_flushFromBpu_s2_valid),
    .io_ftqInter_fromFtq_flushFromBpu_s2_bits_flag(io_ftqInter_fromFtq_flushFromBpu_s2_bits_flag),
    .io_ftqInter_fromFtq_flushFromBpu_s2_bits_value(io_ftqInter_fromFtq_flushFromBpu_s2_bits_value),
    .io_ftqInter_fromFtq_flushFromBpu_s3_valid(io_ftqInter_fromFtq_flushFromBpu_s3_valid),
    .io_ftqInter_fromFtq_flushFromBpu_s3_bits_flag(io_ftqInter_fromFtq_flushFromBpu_s3_bits_flag),
    .io_ftqInter_fromFtq_flushFromBpu_s3_bits_value(io_ftqInter_fromFtq_flushFromBpu_s3_bits_value),
    .io_ftqInter_toFtq_pdWb_valid(io_ftqInter_toFtq_pdWb_valid),
    .io_ftqInter_toFtq_pdWb_bits_pc_0(io_ftqInter_toFtq_pdWb_bits_pc_0),
    .io_ftqInter_toFtq_pdWb_bits_pc_1(io_ftqInter_toFtq_pdWb_bits_pc_1),
    .io_ftqInter_toFtq_pdWb_bits_pc_2(io_ftqInter_toFtq_pdWb_bits_pc_2),
    .io_ftqInter_toFtq_pdWb_bits_pc_3(io_ftqInter_toFtq_pdWb_bits_pc_3),
    .io_ftqInter_toFtq_pdWb_bits_pc_4(io_ftqInter_toFtq_pdWb_bits_pc_4),
    .io_ftqInter_toFtq_pdWb_bits_pc_5(io_ftqInter_toFtq_pdWb_bits_pc_5),
    .io_ftqInter_toFtq_pdWb_bits_pc_6(io_ftqInter_toFtq_pdWb_bits_pc_6),
    .io_ftqInter_toFtq_pdWb_bits_pc_7(io_ftqInter_toFtq_pdWb_bits_pc_7),
    .io_ftqInter_toFtq_pdWb_bits_pc_8(io_ftqInter_toFtq_pdWb_bits_pc_8),
    .io_ftqInter_toFtq_pdWb_bits_pc_9(io_ftqInter_toFtq_pdWb_bits_pc_9),
    .io_ftqInter_toFtq_pdWb_bits_pc_10(io_ftqInter_toFtq_pdWb_bits_pc_10),
    .io_ftqInter_toFtq_pdWb_bits_pc_11(io_ftqInter_toFtq_pdWb_bits_pc_11),
    .io_ftqInter_toFtq_pdWb_bits_pc_12(io_ftqInter_toFtq_pdWb_bits_pc_12),
    .io_ftqInter_toFtq_pdWb_bits_pc_13(io_ftqInter_toFtq_pdWb_bits_pc_13),
    .io_ftqInter_toFtq_pdWb_bits_pc_14(io_ftqInter_toFtq_pdWb_bits_pc_14),
    .io_ftqInter_toFtq_pdWb_bits_pc_15(io_ftqInter_toFtq_pdWb_bits_pc_15),
    .io_ftqInter_toFtq_pdWb_bits_pd_0_valid(io_ftqInter_toFtq_pdWb_bits_pd_0_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_0_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_0_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_0_brType(io_ftqInter_toFtq_pdWb_bits_pd_0_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_0_isCall(io_ftqInter_toFtq_pdWb_bits_pd_0_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_0_isRet(io_ftqInter_toFtq_pdWb_bits_pd_0_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_1_valid(io_ftqInter_toFtq_pdWb_bits_pd_1_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_1_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_1_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_1_brType(io_ftqInter_toFtq_pdWb_bits_pd_1_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_1_isCall(io_ftqInter_toFtq_pdWb_bits_pd_1_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_1_isRet(io_ftqInter_toFtq_pdWb_bits_pd_1_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_2_valid(io_ftqInter_toFtq_pdWb_bits_pd_2_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_2_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_2_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_2_brType(io_ftqInter_toFtq_pdWb_bits_pd_2_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_2_isCall(io_ftqInter_toFtq_pdWb_bits_pd_2_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_2_isRet(io_ftqInter_toFtq_pdWb_bits_pd_2_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_3_valid(io_ftqInter_toFtq_pdWb_bits_pd_3_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_3_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_3_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_3_brType(io_ftqInter_toFtq_pdWb_bits_pd_3_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_3_isCall(io_ftqInter_toFtq_pdWb_bits_pd_3_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_3_isRet(io_ftqInter_toFtq_pdWb_bits_pd_3_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_4_valid(io_ftqInter_toFtq_pdWb_bits_pd_4_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_4_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_4_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_4_brType(io_ftqInter_toFtq_pdWb_bits_pd_4_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_4_isCall(io_ftqInter_toFtq_pdWb_bits_pd_4_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_4_isRet(io_ftqInter_toFtq_pdWb_bits_pd_4_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_5_valid(io_ftqInter_toFtq_pdWb_bits_pd_5_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_5_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_5_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_5_brType(io_ftqInter_toFtq_pdWb_bits_pd_5_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_5_isCall(io_ftqInter_toFtq_pdWb_bits_pd_5_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_5_isRet(io_ftqInter_toFtq_pdWb_bits_pd_5_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_6_valid(io_ftqInter_toFtq_pdWb_bits_pd_6_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_6_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_6_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_6_brType(io_ftqInter_toFtq_pdWb_bits_pd_6_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_6_isCall(io_ftqInter_toFtq_pdWb_bits_pd_6_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_6_isRet(io_ftqInter_toFtq_pdWb_bits_pd_6_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_7_valid(io_ftqInter_toFtq_pdWb_bits_pd_7_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_7_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_7_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_7_brType(io_ftqInter_toFtq_pdWb_bits_pd_7_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_7_isCall(io_ftqInter_toFtq_pdWb_bits_pd_7_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_7_isRet(io_ftqInter_toFtq_pdWb_bits_pd_7_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_8_valid(io_ftqInter_toFtq_pdWb_bits_pd_8_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_8_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_8_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_8_brType(io_ftqInter_toFtq_pdWb_bits_pd_8_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_8_isCall(io_ftqInter_toFtq_pdWb_bits_pd_8_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_8_isRet(io_ftqInter_toFtq_pdWb_bits_pd_8_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_9_valid(io_ftqInter_toFtq_pdWb_bits_pd_9_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_9_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_9_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_9_brType(io_ftqInter_toFtq_pdWb_bits_pd_9_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_9_isCall(io_ftqInter_toFtq_pdWb_bits_pd_9_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_9_isRet(io_ftqInter_toFtq_pdWb_bits_pd_9_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_10_valid(io_ftqInter_toFtq_pdWb_bits_pd_10_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_10_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_10_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_10_brType(io_ftqInter_toFtq_pdWb_bits_pd_10_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_10_isCall(io_ftqInter_toFtq_pdWb_bits_pd_10_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_10_isRet(io_ftqInter_toFtq_pdWb_bits_pd_10_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_11_valid(io_ftqInter_toFtq_pdWb_bits_pd_11_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_11_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_11_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_11_brType(io_ftqInter_toFtq_pdWb_bits_pd_11_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_11_isCall(io_ftqInter_toFtq_pdWb_bits_pd_11_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_11_isRet(io_ftqInter_toFtq_pdWb_bits_pd_11_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_12_valid(io_ftqInter_toFtq_pdWb_bits_pd_12_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_12_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_12_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_12_brType(io_ftqInter_toFtq_pdWb_bits_pd_12_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_12_isCall(io_ftqInter_toFtq_pdWb_bits_pd_12_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_12_isRet(io_ftqInter_toFtq_pdWb_bits_pd_12_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_13_valid(io_ftqInter_toFtq_pdWb_bits_pd_13_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_13_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_13_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_13_brType(io_ftqInter_toFtq_pdWb_bits_pd_13_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_13_isCall(io_ftqInter_toFtq_pdWb_bits_pd_13_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_13_isRet(io_ftqInter_toFtq_pdWb_bits_pd_13_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_14_valid(io_ftqInter_toFtq_pdWb_bits_pd_14_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_14_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_14_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_14_brType(io_ftqInter_toFtq_pdWb_bits_pd_14_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_14_isCall(io_ftqInter_toFtq_pdWb_bits_pd_14_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_14_isRet(io_ftqInter_toFtq_pdWb_bits_pd_14_isRet),
    .io_ftqInter_toFtq_pdWb_bits_pd_15_valid(io_ftqInter_toFtq_pdWb_bits_pd_15_valid),
    .io_ftqInter_toFtq_pdWb_bits_pd_15_isRVC(io_ftqInter_toFtq_pdWb_bits_pd_15_isRVC),
    .io_ftqInter_toFtq_pdWb_bits_pd_15_brType(io_ftqInter_toFtq_pdWb_bits_pd_15_brType),
    .io_ftqInter_toFtq_pdWb_bits_pd_15_isCall(io_ftqInter_toFtq_pdWb_bits_pd_15_isCall),
    .io_ftqInter_toFtq_pdWb_bits_pd_15_isRet(io_ftqInter_toFtq_pdWb_bits_pd_15_isRet),
    .io_ftqInter_toFtq_pdWb_bits_ftqIdx_flag(io_ftqInter_toFtq_pdWb_bits_ftqIdx_flag),
    .io_ftqInter_toFtq_pdWb_bits_ftqIdx_value(io_ftqInter_toFtq_pdWb_bits_ftqIdx_value),
    .io_ftqInter_toFtq_pdWb_bits_misOffset_valid(io_ftqInter_toFtq_pdWb_bits_misOffset_valid),
    .io_ftqInter_toFtq_pdWb_bits_misOffset_bits(io_ftqInter_toFtq_pdWb_bits_misOffset_bits),
    .io_ftqInter_toFtq_pdWb_bits_cfiOffset_valid(io_ftqInter_toFtq_pdWb_bits_cfiOffset_valid),
    .io_ftqInter_toFtq_pdWb_bits_target(io_ftqInter_toFtq_pdWb_bits_target),
    .io_ftqInter_toFtq_pdWb_bits_jalTarget(io_ftqInter_toFtq_pdWb_bits_jalTarget),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_0(io_ftqInter_toFtq_pdWb_bits_instrRange_0),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_1(io_ftqInter_toFtq_pdWb_bits_instrRange_1),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_2(io_ftqInter_toFtq_pdWb_bits_instrRange_2),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_3(io_ftqInter_toFtq_pdWb_bits_instrRange_3),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_4(io_ftqInter_toFtq_pdWb_bits_instrRange_4),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_5(io_ftqInter_toFtq_pdWb_bits_instrRange_5),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_6(io_ftqInter_toFtq_pdWb_bits_instrRange_6),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_7(io_ftqInter_toFtq_pdWb_bits_instrRange_7),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_8(io_ftqInter_toFtq_pdWb_bits_instrRange_8),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_9(io_ftqInter_toFtq_pdWb_bits_instrRange_9),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_10(io_ftqInter_toFtq_pdWb_bits_instrRange_10),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_11(io_ftqInter_toFtq_pdWb_bits_instrRange_11),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_12(io_ftqInter_toFtq_pdWb_bits_instrRange_12),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_13(io_ftqInter_toFtq_pdWb_bits_instrRange_13),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_14(io_ftqInter_toFtq_pdWb_bits_instrRange_14),
    .io_ftqInter_toFtq_pdWb_bits_instrRange_15(io_ftqInter_toFtq_pdWb_bits_instrRange_15),
    .io_icacheInter_icacheReady(io_icacheInter_icacheReady),
    .io_icacheInter_resp_valid(io_icacheInter_resp_valid),
    .io_icacheInter_resp_bits_doubleline(io_icacheInter_resp_bits_doubleline),
    .io_icacheInter_resp_bits_vaddr_0(io_icacheInter_resp_bits_vaddr_0),
    .io_icacheInter_resp_bits_vaddr_1(io_icacheInter_resp_bits_vaddr_1),
    .io_icacheInter_resp_bits_data(io_icacheInter_resp_bits_data),
    .io_icacheInter_resp_bits_paddr_0(io_icacheInter_resp_bits_paddr_0),
    .io_icacheInter_resp_bits_exception_0(io_icacheInter_resp_bits_exception_0),
    .io_icacheInter_resp_bits_exception_1(io_icacheInter_resp_bits_exception_1),
    .io_icacheInter_resp_bits_pmp_mmio_0(io_icacheInter_resp_bits_pmp_mmio_0),
    .io_icacheInter_resp_bits_pmp_mmio_1(io_icacheInter_resp_bits_pmp_mmio_1),
    .io_icacheInter_resp_bits_itlb_pbmt_0(io_icacheInter_resp_bits_itlb_pbmt_0),
    .io_icacheInter_resp_bits_itlb_pbmt_1(io_icacheInter_resp_bits_itlb_pbmt_1),
    .io_icacheInter_resp_bits_backendException(io_icacheInter_resp_bits_backendException),
    .io_icacheInter_resp_bits_gpaddr(io_icacheInter_resp_bits_gpaddr),
    .io_icacheInter_resp_bits_isForVSnonLeafPTE(io_icacheInter_resp_bits_isForVSnonLeafPTE),
    .io_icacheStop(io_icacheStop),
    .io_icachePerfInfo_only_0_hit(io_icachePerfInfo_only_0_hit),
    .io_icachePerfInfo_only_0_miss(io_icachePerfInfo_only_0_miss),
    .io_icachePerfInfo_hit_0_hit_1(io_icachePerfInfo_hit_0_hit_1),
    .io_icachePerfInfo_hit_0_miss_1(io_icachePerfInfo_hit_0_miss_1),
    .io_icachePerfInfo_miss_0_hit_1(io_icachePerfInfo_miss_0_hit_1),
    .io_icachePerfInfo_miss_0_miss_1(io_icachePerfInfo_miss_0_miss_1),
    .io_icachePerfInfo_bank_hit_1(io_icachePerfInfo_bank_hit_1),
    .io_icachePerfInfo_hit(io_icachePerfInfo_hit),
    .io_toIbuffer_ready(io_toIbuffer_ready),
    .io_toIbuffer_valid(io_toIbuffer_valid),
    .io_toIbuffer_bits_instrs_0(io_toIbuffer_bits_instrs_0),
    .io_toIbuffer_bits_instrs_1(io_toIbuffer_bits_instrs_1),
    .io_toIbuffer_bits_instrs_2(io_toIbuffer_bits_instrs_2),
    .io_toIbuffer_bits_instrs_3(io_toIbuffer_bits_instrs_3),
    .io_toIbuffer_bits_instrs_4(io_toIbuffer_bits_instrs_4),
    .io_toIbuffer_bits_instrs_5(io_toIbuffer_bits_instrs_5),
    .io_toIbuffer_bits_instrs_6(io_toIbuffer_bits_instrs_6),
    .io_toIbuffer_bits_instrs_7(io_toIbuffer_bits_instrs_7),
    .io_toIbuffer_bits_instrs_8(io_toIbuffer_bits_instrs_8),
    .io_toIbuffer_bits_instrs_9(io_toIbuffer_bits_instrs_9),
    .io_toIbuffer_bits_instrs_10(io_toIbuffer_bits_instrs_10),
    .io_toIbuffer_bits_instrs_11(io_toIbuffer_bits_instrs_11),
    .io_toIbuffer_bits_instrs_12(io_toIbuffer_bits_instrs_12),
    .io_toIbuffer_bits_instrs_13(io_toIbuffer_bits_instrs_13),
    .io_toIbuffer_bits_instrs_14(io_toIbuffer_bits_instrs_14),
    .io_toIbuffer_bits_instrs_15(io_toIbuffer_bits_instrs_15),
    .io_toIbuffer_bits_valid(io_toIbuffer_bits_valid),
    .io_toIbuffer_bits_enqEnable(io_toIbuffer_bits_enqEnable),
    .io_toIbuffer_bits_pd_0_isRVC(io_toIbuffer_bits_pd_0_isRVC),
    .io_toIbuffer_bits_pd_0_brType(io_toIbuffer_bits_pd_0_brType),
    .io_toIbuffer_bits_pd_1_isRVC(io_toIbuffer_bits_pd_1_isRVC),
    .io_toIbuffer_bits_pd_1_brType(io_toIbuffer_bits_pd_1_brType),
    .io_toIbuffer_bits_pd_2_isRVC(io_toIbuffer_bits_pd_2_isRVC),
    .io_toIbuffer_bits_pd_2_brType(io_toIbuffer_bits_pd_2_brType),
    .io_toIbuffer_bits_pd_3_isRVC(io_toIbuffer_bits_pd_3_isRVC),
    .io_toIbuffer_bits_pd_3_brType(io_toIbuffer_bits_pd_3_brType),
    .io_toIbuffer_bits_pd_4_isRVC(io_toIbuffer_bits_pd_4_isRVC),
    .io_toIbuffer_bits_pd_4_brType(io_toIbuffer_bits_pd_4_brType),
    .io_toIbuffer_bits_pd_5_isRVC(io_toIbuffer_bits_pd_5_isRVC),
    .io_toIbuffer_bits_pd_5_brType(io_toIbuffer_bits_pd_5_brType),
    .io_toIbuffer_bits_pd_6_isRVC(io_toIbuffer_bits_pd_6_isRVC),
    .io_toIbuffer_bits_pd_6_brType(io_toIbuffer_bits_pd_6_brType),
    .io_toIbuffer_bits_pd_7_isRVC(io_toIbuffer_bits_pd_7_isRVC),
    .io_toIbuffer_bits_pd_7_brType(io_toIbuffer_bits_pd_7_brType),
    .io_toIbuffer_bits_pd_8_isRVC(io_toIbuffer_bits_pd_8_isRVC),
    .io_toIbuffer_bits_pd_8_brType(io_toIbuffer_bits_pd_8_brType),
    .io_toIbuffer_bits_pd_9_isRVC(io_toIbuffer_bits_pd_9_isRVC),
    .io_toIbuffer_bits_pd_9_brType(io_toIbuffer_bits_pd_9_brType),
    .io_toIbuffer_bits_pd_10_isRVC(io_toIbuffer_bits_pd_10_isRVC),
    .io_toIbuffer_bits_pd_10_brType(io_toIbuffer_bits_pd_10_brType),
    .io_toIbuffer_bits_pd_11_isRVC(io_toIbuffer_bits_pd_11_isRVC),
    .io_toIbuffer_bits_pd_11_brType(io_toIbuffer_bits_pd_11_brType),
    .io_toIbuffer_bits_pd_12_isRVC(io_toIbuffer_bits_pd_12_isRVC),
    .io_toIbuffer_bits_pd_12_brType(io_toIbuffer_bits_pd_12_brType),
    .io_toIbuffer_bits_pd_13_isRVC(io_toIbuffer_bits_pd_13_isRVC),
    .io_toIbuffer_bits_pd_13_brType(io_toIbuffer_bits_pd_13_brType),
    .io_toIbuffer_bits_pd_14_isRVC(io_toIbuffer_bits_pd_14_isRVC),
    .io_toIbuffer_bits_pd_14_brType(io_toIbuffer_bits_pd_14_brType),
    .io_toIbuffer_bits_pd_15_isRVC(io_toIbuffer_bits_pd_15_isRVC),
    .io_toIbuffer_bits_pd_15_brType(io_toIbuffer_bits_pd_15_brType),
    .io_toIbuffer_bits_foldpc_0(io_toIbuffer_bits_foldpc_0),
    .io_toIbuffer_bits_foldpc_1(io_toIbuffer_bits_foldpc_1),
    .io_toIbuffer_bits_foldpc_2(io_toIbuffer_bits_foldpc_2),
    .io_toIbuffer_bits_foldpc_3(io_toIbuffer_bits_foldpc_3),
    .io_toIbuffer_bits_foldpc_4(io_toIbuffer_bits_foldpc_4),
    .io_toIbuffer_bits_foldpc_5(io_toIbuffer_bits_foldpc_5),
    .io_toIbuffer_bits_foldpc_6(io_toIbuffer_bits_foldpc_6),
    .io_toIbuffer_bits_foldpc_7(io_toIbuffer_bits_foldpc_7),
    .io_toIbuffer_bits_foldpc_8(io_toIbuffer_bits_foldpc_8),
    .io_toIbuffer_bits_foldpc_9(io_toIbuffer_bits_foldpc_9),
    .io_toIbuffer_bits_foldpc_10(io_toIbuffer_bits_foldpc_10),
    .io_toIbuffer_bits_foldpc_11(io_toIbuffer_bits_foldpc_11),
    .io_toIbuffer_bits_foldpc_12(io_toIbuffer_bits_foldpc_12),
    .io_toIbuffer_bits_foldpc_13(io_toIbuffer_bits_foldpc_13),
    .io_toIbuffer_bits_foldpc_14(io_toIbuffer_bits_foldpc_14),
    .io_toIbuffer_bits_foldpc_15(io_toIbuffer_bits_foldpc_15),
    .io_toIbuffer_bits_ftqOffset_0_valid(io_toIbuffer_bits_ftqOffset_0_valid),
    .io_toIbuffer_bits_ftqOffset_1_valid(io_toIbuffer_bits_ftqOffset_1_valid),
    .io_toIbuffer_bits_ftqOffset_2_valid(io_toIbuffer_bits_ftqOffset_2_valid),
    .io_toIbuffer_bits_ftqOffset_3_valid(io_toIbuffer_bits_ftqOffset_3_valid),
    .io_toIbuffer_bits_ftqOffset_4_valid(io_toIbuffer_bits_ftqOffset_4_valid),
    .io_toIbuffer_bits_ftqOffset_5_valid(io_toIbuffer_bits_ftqOffset_5_valid),
    .io_toIbuffer_bits_ftqOffset_6_valid(io_toIbuffer_bits_ftqOffset_6_valid),
    .io_toIbuffer_bits_ftqOffset_7_valid(io_toIbuffer_bits_ftqOffset_7_valid),
    .io_toIbuffer_bits_ftqOffset_8_valid(io_toIbuffer_bits_ftqOffset_8_valid),
    .io_toIbuffer_bits_ftqOffset_9_valid(io_toIbuffer_bits_ftqOffset_9_valid),
    .io_toIbuffer_bits_ftqOffset_10_valid(io_toIbuffer_bits_ftqOffset_10_valid),
    .io_toIbuffer_bits_ftqOffset_11_valid(io_toIbuffer_bits_ftqOffset_11_valid),
    .io_toIbuffer_bits_ftqOffset_12_valid(io_toIbuffer_bits_ftqOffset_12_valid),
    .io_toIbuffer_bits_ftqOffset_13_valid(io_toIbuffer_bits_ftqOffset_13_valid),
    .io_toIbuffer_bits_ftqOffset_14_valid(io_toIbuffer_bits_ftqOffset_14_valid),
    .io_toIbuffer_bits_ftqOffset_15_valid(io_toIbuffer_bits_ftqOffset_15_valid),
    .io_toIbuffer_bits_backendException_0(io_toIbuffer_bits_backendException_0),
    .io_toIbuffer_bits_exceptionType_0(io_toIbuffer_bits_exceptionType_0),
    .io_toIbuffer_bits_exceptionType_1(io_toIbuffer_bits_exceptionType_1),
    .io_toIbuffer_bits_exceptionType_2(io_toIbuffer_bits_exceptionType_2),
    .io_toIbuffer_bits_exceptionType_3(io_toIbuffer_bits_exceptionType_3),
    .io_toIbuffer_bits_exceptionType_4(io_toIbuffer_bits_exceptionType_4),
    .io_toIbuffer_bits_exceptionType_5(io_toIbuffer_bits_exceptionType_5),
    .io_toIbuffer_bits_exceptionType_6(io_toIbuffer_bits_exceptionType_6),
    .io_toIbuffer_bits_exceptionType_7(io_toIbuffer_bits_exceptionType_7),
    .io_toIbuffer_bits_exceptionType_8(io_toIbuffer_bits_exceptionType_8),
    .io_toIbuffer_bits_exceptionType_9(io_toIbuffer_bits_exceptionType_9),
    .io_toIbuffer_bits_exceptionType_10(io_toIbuffer_bits_exceptionType_10),
    .io_toIbuffer_bits_exceptionType_11(io_toIbuffer_bits_exceptionType_11),
    .io_toIbuffer_bits_exceptionType_12(io_toIbuffer_bits_exceptionType_12),
    .io_toIbuffer_bits_exceptionType_13(io_toIbuffer_bits_exceptionType_13),
    .io_toIbuffer_bits_exceptionType_14(io_toIbuffer_bits_exceptionType_14),
    .io_toIbuffer_bits_exceptionType_15(io_toIbuffer_bits_exceptionType_15),
    .io_toIbuffer_bits_crossPageIPFFix_0(io_toIbuffer_bits_crossPageIPFFix_0),
    .io_toIbuffer_bits_crossPageIPFFix_1(io_toIbuffer_bits_crossPageIPFFix_1),
    .io_toIbuffer_bits_crossPageIPFFix_2(io_toIbuffer_bits_crossPageIPFFix_2),
    .io_toIbuffer_bits_crossPageIPFFix_3(io_toIbuffer_bits_crossPageIPFFix_3),
    .io_toIbuffer_bits_crossPageIPFFix_4(io_toIbuffer_bits_crossPageIPFFix_4),
    .io_toIbuffer_bits_crossPageIPFFix_5(io_toIbuffer_bits_crossPageIPFFix_5),
    .io_toIbuffer_bits_crossPageIPFFix_6(io_toIbuffer_bits_crossPageIPFFix_6),
    .io_toIbuffer_bits_crossPageIPFFix_7(io_toIbuffer_bits_crossPageIPFFix_7),
    .io_toIbuffer_bits_crossPageIPFFix_8(io_toIbuffer_bits_crossPageIPFFix_8),
    .io_toIbuffer_bits_crossPageIPFFix_9(io_toIbuffer_bits_crossPageIPFFix_9),
    .io_toIbuffer_bits_crossPageIPFFix_10(io_toIbuffer_bits_crossPageIPFFix_10),
    .io_toIbuffer_bits_crossPageIPFFix_11(io_toIbuffer_bits_crossPageIPFFix_11),
    .io_toIbuffer_bits_crossPageIPFFix_12(io_toIbuffer_bits_crossPageIPFFix_12),
    .io_toIbuffer_bits_crossPageIPFFix_13(io_toIbuffer_bits_crossPageIPFFix_13),
    .io_toIbuffer_bits_crossPageIPFFix_14(io_toIbuffer_bits_crossPageIPFFix_14),
    .io_toIbuffer_bits_crossPageIPFFix_15(io_toIbuffer_bits_crossPageIPFFix_15),
    .io_toIbuffer_bits_illegalInstr_0(io_toIbuffer_bits_illegalInstr_0),
    .io_toIbuffer_bits_illegalInstr_1(io_toIbuffer_bits_illegalInstr_1),
    .io_toIbuffer_bits_illegalInstr_2(io_toIbuffer_bits_illegalInstr_2),
    .io_toIbuffer_bits_illegalInstr_3(io_toIbuffer_bits_illegalInstr_3),
    .io_toIbuffer_bits_illegalInstr_4(io_toIbuffer_bits_illegalInstr_4),
    .io_toIbuffer_bits_illegalInstr_5(io_toIbuffer_bits_illegalInstr_5),
    .io_toIbuffer_bits_illegalInstr_6(io_toIbuffer_bits_illegalInstr_6),
    .io_toIbuffer_bits_illegalInstr_7(io_toIbuffer_bits_illegalInstr_7),
    .io_toIbuffer_bits_illegalInstr_8(io_toIbuffer_bits_illegalInstr_8),
    .io_toIbuffer_bits_illegalInstr_9(io_toIbuffer_bits_illegalInstr_9),
    .io_toIbuffer_bits_illegalInstr_10(io_toIbuffer_bits_illegalInstr_10),
    .io_toIbuffer_bits_illegalInstr_11(io_toIbuffer_bits_illegalInstr_11),
    .io_toIbuffer_bits_illegalInstr_12(io_toIbuffer_bits_illegalInstr_12),
    .io_toIbuffer_bits_illegalInstr_13(io_toIbuffer_bits_illegalInstr_13),
    .io_toIbuffer_bits_illegalInstr_14(io_toIbuffer_bits_illegalInstr_14),
    .io_toIbuffer_bits_illegalInstr_15(io_toIbuffer_bits_illegalInstr_15),
    .io_toIbuffer_bits_triggered_0(io_toIbuffer_bits_triggered_0),
    .io_toIbuffer_bits_triggered_1(io_toIbuffer_bits_triggered_1),
    .io_toIbuffer_bits_triggered_2(io_toIbuffer_bits_triggered_2),
    .io_toIbuffer_bits_triggered_3(io_toIbuffer_bits_triggered_3),
    .io_toIbuffer_bits_triggered_4(io_toIbuffer_bits_triggered_4),
    .io_toIbuffer_bits_triggered_5(io_toIbuffer_bits_triggered_5),
    .io_toIbuffer_bits_triggered_6(io_toIbuffer_bits_triggered_6),
    .io_toIbuffer_bits_triggered_7(io_toIbuffer_bits_triggered_7),
    .io_toIbuffer_bits_triggered_8(io_toIbuffer_bits_triggered_8),
    .io_toIbuffer_bits_triggered_9(io_toIbuffer_bits_triggered_9),
    .io_toIbuffer_bits_triggered_10(io_toIbuffer_bits_triggered_10),
    .io_toIbuffer_bits_triggered_11(io_toIbuffer_bits_triggered_11),
    .io_toIbuffer_bits_triggered_12(io_toIbuffer_bits_triggered_12),
    .io_toIbuffer_bits_triggered_13(io_toIbuffer_bits_triggered_13),
    .io_toIbuffer_bits_triggered_14(io_toIbuffer_bits_triggered_14),
    .io_toIbuffer_bits_triggered_15(io_toIbuffer_bits_triggered_15),
    .io_toIbuffer_bits_isLastInFtqEntry_0(io_toIbuffer_bits_isLastInFtqEntry_0),
    .io_toIbuffer_bits_isLastInFtqEntry_1(io_toIbuffer_bits_isLastInFtqEntry_1),
    .io_toIbuffer_bits_isLastInFtqEntry_2(io_toIbuffer_bits_isLastInFtqEntry_2),
    .io_toIbuffer_bits_isLastInFtqEntry_3(io_toIbuffer_bits_isLastInFtqEntry_3),
    .io_toIbuffer_bits_isLastInFtqEntry_4(io_toIbuffer_bits_isLastInFtqEntry_4),
    .io_toIbuffer_bits_isLastInFtqEntry_5(io_toIbuffer_bits_isLastInFtqEntry_5),
    .io_toIbuffer_bits_isLastInFtqEntry_6(io_toIbuffer_bits_isLastInFtqEntry_6),
    .io_toIbuffer_bits_isLastInFtqEntry_7(io_toIbuffer_bits_isLastInFtqEntry_7),
    .io_toIbuffer_bits_isLastInFtqEntry_8(io_toIbuffer_bits_isLastInFtqEntry_8),
    .io_toIbuffer_bits_isLastInFtqEntry_9(io_toIbuffer_bits_isLastInFtqEntry_9),
    .io_toIbuffer_bits_isLastInFtqEntry_10(io_toIbuffer_bits_isLastInFtqEntry_10),
    .io_toIbuffer_bits_isLastInFtqEntry_11(io_toIbuffer_bits_isLastInFtqEntry_11),
    .io_toIbuffer_bits_isLastInFtqEntry_12(io_toIbuffer_bits_isLastInFtqEntry_12),
    .io_toIbuffer_bits_isLastInFtqEntry_13(io_toIbuffer_bits_isLastInFtqEntry_13),
    .io_toIbuffer_bits_isLastInFtqEntry_14(io_toIbuffer_bits_isLastInFtqEntry_14),
    .io_toIbuffer_bits_isLastInFtqEntry_15(io_toIbuffer_bits_isLastInFtqEntry_15),
    .io_toIbuffer_bits_ftqPtr_flag(io_toIbuffer_bits_ftqPtr_flag),
    .io_toIbuffer_bits_ftqPtr_value(io_toIbuffer_bits_ftqPtr_value),
    .io_toBackend_gpaddrMem_wen(io_toBackend_gpaddrMem_wen),
    .io_toBackend_gpaddrMem_waddr(io_toBackend_gpaddrMem_waddr),
    .io_toBackend_gpaddrMem_wdata_gpaddr(io_toBackend_gpaddrMem_wdata_gpaddr),
    .io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTE(io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTE),
    .io_uncacheInter_fromUncache_valid(io_uncacheInter_fromUncache_valid),
    .io_uncacheInter_fromUncache_bits_data(io_uncacheInter_fromUncache_bits_data),
    .io_uncacheInter_toUncache_ready(io_uncacheInter_toUncache_ready),
    .io_uncacheInter_toUncache_valid(io_uncacheInter_toUncache_valid),
    .io_uncacheInter_toUncache_bits_addr(io_uncacheInter_toUncache_bits_addr),
    .io_frontendTrigger_tUpdate_valid(io_frontendTrigger_tUpdate_valid),
    .io_frontendTrigger_tUpdate_bits_addr(io_frontendTrigger_tUpdate_bits_addr),
    .io_frontendTrigger_tUpdate_bits_tdata_matchType(io_frontendTrigger_tUpdate_bits_tdata_matchType),
    .io_frontendTrigger_tUpdate_bits_tdata_select(io_frontendTrigger_tUpdate_bits_tdata_select),
    .io_frontendTrigger_tUpdate_bits_tdata_action(io_frontendTrigger_tUpdate_bits_tdata_action),
    .io_frontendTrigger_tUpdate_bits_tdata_chain(io_frontendTrigger_tUpdate_bits_tdata_chain),
    .io_frontendTrigger_tUpdate_bits_tdata_tdata2(io_frontendTrigger_tUpdate_bits_tdata_tdata2),
    .io_frontendTrigger_tEnableVec_0(io_frontendTrigger_tEnableVec_0),
    .io_frontendTrigger_tEnableVec_1(io_frontendTrigger_tEnableVec_1),
    .io_frontendTrigger_tEnableVec_2(io_frontendTrigger_tEnableVec_2),
    .io_frontendTrigger_tEnableVec_3(io_frontendTrigger_tEnableVec_3),
    .io_frontendTrigger_debugMode(io_frontendTrigger_debugMode),
    .io_frontendTrigger_triggerCanRaiseBpExp(io_frontendTrigger_triggerCanRaiseBpExp),
    .io_rob_commits_0_valid(io_rob_commits_0_valid),
    .io_rob_commits_0_bits_ftqIdx_flag(io_rob_commits_0_bits_ftqIdx_flag),
    .io_rob_commits_0_bits_ftqIdx_value(io_rob_commits_0_bits_ftqIdx_value),
    .io_rob_commits_0_bits_ftqOffset(io_rob_commits_0_bits_ftqOffset),
    .io_rob_commits_1_valid(io_rob_commits_1_valid),
    .io_rob_commits_1_bits_ftqIdx_flag(io_rob_commits_1_bits_ftqIdx_flag),
    .io_rob_commits_1_bits_ftqIdx_value(io_rob_commits_1_bits_ftqIdx_value),
    .io_rob_commits_1_bits_ftqOffset(io_rob_commits_1_bits_ftqOffset),
    .io_rob_commits_2_valid(io_rob_commits_2_valid),
    .io_rob_commits_2_bits_ftqIdx_flag(io_rob_commits_2_bits_ftqIdx_flag),
    .io_rob_commits_2_bits_ftqIdx_value(io_rob_commits_2_bits_ftqIdx_value),
    .io_rob_commits_2_bits_ftqOffset(io_rob_commits_2_bits_ftqOffset),
    .io_rob_commits_3_valid(io_rob_commits_3_valid),
    .io_rob_commits_3_bits_ftqIdx_flag(io_rob_commits_3_bits_ftqIdx_flag),
    .io_rob_commits_3_bits_ftqIdx_value(io_rob_commits_3_bits_ftqIdx_value),
    .io_rob_commits_3_bits_ftqOffset(io_rob_commits_3_bits_ftqOffset),
    .io_rob_commits_4_valid(io_rob_commits_4_valid),
    .io_rob_commits_4_bits_ftqIdx_flag(io_rob_commits_4_bits_ftqIdx_flag),
    .io_rob_commits_4_bits_ftqIdx_value(io_rob_commits_4_bits_ftqIdx_value),
    .io_rob_commits_4_bits_ftqOffset(io_rob_commits_4_bits_ftqOffset),
    .io_rob_commits_5_valid(io_rob_commits_5_valid),
    .io_rob_commits_5_bits_ftqIdx_flag(io_rob_commits_5_bits_ftqIdx_flag),
    .io_rob_commits_5_bits_ftqIdx_value(io_rob_commits_5_bits_ftqIdx_value),
    .io_rob_commits_5_bits_ftqOffset(io_rob_commits_5_bits_ftqOffset),
    .io_rob_commits_6_valid(io_rob_commits_6_valid),
    .io_rob_commits_6_bits_ftqIdx_flag(io_rob_commits_6_bits_ftqIdx_flag),
    .io_rob_commits_6_bits_ftqIdx_value(io_rob_commits_6_bits_ftqIdx_value),
    .io_rob_commits_6_bits_ftqOffset(io_rob_commits_6_bits_ftqOffset),
    .io_rob_commits_7_valid(io_rob_commits_7_valid),
    .io_rob_commits_7_bits_ftqIdx_flag(io_rob_commits_7_bits_ftqIdx_flag),
    .io_rob_commits_7_bits_ftqIdx_value(io_rob_commits_7_bits_ftqIdx_value),
    .io_rob_commits_7_bits_ftqOffset(io_rob_commits_7_bits_ftqOffset),
    .io_iTLBInter_req_ready(io_iTLBInter_req_ready),
    .io_iTLBInter_req_valid(io_iTLBInter_req_valid),
    .io_iTLBInter_req_bits_vaddr(io_iTLBInter_req_bits_vaddr),
    .io_iTLBInter_resp_ready(io_iTLBInter_resp_ready),
    .io_iTLBInter_resp_valid(io_iTLBInter_resp_valid),
    .io_iTLBInter_resp_bits_paddr_0(io_iTLBInter_resp_bits_paddr_0),
    .io_iTLBInter_resp_bits_gpaddr_0(io_iTLBInter_resp_bits_gpaddr_0),
    .io_iTLBInter_resp_bits_pbmt_0(io_iTLBInter_resp_bits_pbmt_0),
    .io_iTLBInter_resp_bits_isForVSnonLeafPTE(io_iTLBInter_resp_bits_isForVSnonLeafPTE),
    .io_iTLBInter_resp_bits_excp_0_gpf_instr(io_iTLBInter_resp_bits_excp_0_gpf_instr),
    .io_iTLBInter_resp_bits_excp_0_pf_instr(io_iTLBInter_resp_bits_excp_0_pf_instr),
    .io_iTLBInter_resp_bits_excp_0_af_instr(io_iTLBInter_resp_bits_excp_0_af_instr),
    .io_pmp_req_bits_addr(io_pmp_req_bits_addr),
    .io_pmp_resp_instr(io_pmp_resp_instr),
    .io_pmp_resp_mmio(io_pmp_resp_mmio),
    .io_mmioCommitRead_mmioFtqPtr_flag(io_mmioCommitRead_mmioFtqPtr_flag),
    .io_mmioCommitRead_mmioFtqPtr_value(io_mmioCommitRead_mmioFtqPtr_value),
    .io_mmioCommitRead_mmioLastCommit(io_mmioCommitRead_mmioLastCommit),
    .io_csr_fsIsOff(io_csr_fsIsOff),
    .io_perf_0_value(io_perf_0_value),
    .io_perf_1_value(io_perf_1_value),
    .io_perf_2_value(io_perf_2_value),
    .io_perf_3_value(io_perf_3_value),
    .io_perf_4_value(io_perf_4_value),
    .io_perf_5_value(io_perf_5_value),
    .io_perf_6_value(io_perf_6_value),
    .io_perf_7_value(io_perf_7_value),
    .io_perf_8_value(io_perf_8_value),
    .io_perf_9_value(io_perf_9_value),
    .io_perf_10_value(io_perf_10_value),
    .io_perf_11_value(io_perf_11_value),
    .io_perf_12_value(io_perf_12_value)
 );


  export "DPI-C" function get_clockxxHTrWwcStfkV;
  export "DPI-C" function set_clockxxHTrWwcStfkV;
  export "DPI-C" function get_resetxxHTrWwcStfkV;
  export "DPI-C" function set_resetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_readyxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_readyxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_startAddrxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_startAddrxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_nextlineStartxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_nextlineStartxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_nextStartAddrxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_nextStartAddrxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_ftqOffset_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_ftqOffset_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_req_bits_ftqOffset_bitsxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_req_bits_ftqOffset_bitsxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_redirect_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_redirect_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_redirect_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_redirect_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_redirect_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_redirect_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_redirect_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_redirect_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_redirect_bits_levelxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_redirect_bits_levelxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_flushFromBpu_s2_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_flushFromBpu_s2_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_flushFromBpu_s2_bits_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_flushFromBpu_s2_bits_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_flushFromBpu_s2_bits_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_flushFromBpu_s2_bits_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_flushFromBpu_s3_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_flushFromBpu_s3_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_flushFromBpu_s3_bits_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_flushFromBpu_s3_bits_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_fromFtq_flushFromBpu_s3_bits_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_fromFtq_flushFromBpu_s3_bits_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pc_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pc_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_0_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_0_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_0_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_0_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_0_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_0_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_0_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_0_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_0_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_0_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_1_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_1_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_1_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_1_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_1_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_1_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_1_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_1_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_1_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_1_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_2_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_2_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_2_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_2_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_2_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_2_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_2_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_2_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_2_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_2_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_3_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_3_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_3_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_3_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_3_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_3_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_3_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_3_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_3_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_3_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_4_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_4_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_4_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_4_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_4_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_4_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_4_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_4_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_4_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_4_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_5_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_5_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_5_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_5_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_5_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_5_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_5_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_5_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_5_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_5_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_6_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_6_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_6_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_6_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_6_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_6_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_6_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_6_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_6_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_6_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_7_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_7_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_7_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_7_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_7_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_7_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_7_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_7_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_7_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_7_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_8_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_8_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_8_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_8_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_8_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_8_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_8_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_8_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_8_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_8_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_9_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_9_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_9_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_9_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_9_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_9_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_9_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_9_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_9_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_9_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_10_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_10_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_10_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_10_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_10_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_10_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_10_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_10_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_10_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_10_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_11_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_11_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_11_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_11_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_11_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_11_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_11_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_11_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_11_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_11_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_12_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_12_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_12_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_12_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_12_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_12_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_12_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_12_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_12_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_12_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_13_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_13_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_13_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_13_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_13_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_13_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_13_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_13_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_13_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_13_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_14_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_14_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_14_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_14_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_14_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_14_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_14_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_14_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_14_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_14_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_15_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_15_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_15_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_15_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_15_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_15_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_15_isCallxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_15_isCallxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_pd_15_isRetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_pd_15_isRetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_misOffset_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_misOffset_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_misOffset_bitsxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_misOffset_bitsxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_cfiOffset_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_cfiOffset_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_targetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_targetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_jalTargetxxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_jalTargetxxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_ftqInter_toFtq_pdWb_bits_instrRange_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_ftqInter_toFtq_pdWb_bits_instrRange_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_icacheReadyxxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_icacheReadyxxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_doublelinexxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_doublelinexxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_vaddr_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_vaddr_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_vaddr_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_vaddr_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_dataxxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_dataxxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_paddr_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_paddr_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_exception_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_exception_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_exception_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_exception_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_pmp_mmio_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_pmp_mmio_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_pmp_mmio_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_pmp_mmio_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_itlb_pbmt_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_itlb_pbmt_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_itlb_pbmt_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_itlb_pbmt_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_backendExceptionxxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_backendExceptionxxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_gpaddrxxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_gpaddrxxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
  export "DPI-C" function get_io_icacheStopxxHTrWwcStfkV;
  export "DPI-C" function set_io_icacheStopxxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_only_0_hitxxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_only_0_hitxxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_only_0_missxxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_only_0_missxxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_hit_0_hit_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_hit_0_hit_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_hit_0_miss_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_hit_0_miss_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_miss_0_hit_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_miss_0_hit_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_miss_0_miss_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_miss_0_miss_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_bank_hit_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_bank_hit_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_icachePerfInfo_hitxxHTrWwcStfkV;
  export "DPI-C" function set_io_icachePerfInfo_hitxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_readyxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_readyxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_instrs_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_instrs_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_enqEnablexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_enqEnablexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_0_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_0_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_0_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_0_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_1_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_1_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_1_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_1_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_2_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_2_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_2_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_2_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_3_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_3_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_3_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_3_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_4_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_4_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_4_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_4_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_5_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_5_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_5_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_5_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_6_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_6_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_6_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_6_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_7_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_7_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_7_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_7_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_8_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_8_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_8_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_8_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_9_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_9_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_9_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_9_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_10_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_10_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_10_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_10_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_11_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_11_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_11_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_11_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_12_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_12_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_12_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_12_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_13_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_13_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_13_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_13_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_14_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_14_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_14_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_14_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_15_isRVCxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_15_isRVCxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_pd_15_brTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_pd_15_brTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_foldpc_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_foldpc_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_0_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_0_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_1_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_1_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_2_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_2_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_3_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_3_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_4_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_4_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_5_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_5_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_6_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_6_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_7_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_7_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_8_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_8_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_9_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_9_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_10_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_10_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_11_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_11_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_12_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_12_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_13_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_13_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_14_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_14_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqOffset_15_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqOffset_15_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_backendException_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_backendException_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_exceptionType_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_exceptionType_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_crossPageIPFFix_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_crossPageIPFFix_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_illegalInstr_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_illegalInstr_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_triggered_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_triggered_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_4xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_4xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_5xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_5xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_6xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_6xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_7xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_7xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_8xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_8xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_9xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_9xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_10xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_10xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_11xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_11xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_12xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_12xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_13xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_13xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_14xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_14xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_isLastInFtqEntry_15xxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_isLastInFtqEntry_15xxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqPtr_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqPtr_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_toIbuffer_bits_ftqPtr_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_toIbuffer_bits_ftqPtr_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_toBackend_gpaddrMem_wenxxHTrWwcStfkV;
  export "DPI-C" function set_io_toBackend_gpaddrMem_wenxxHTrWwcStfkV;
  export "DPI-C" function get_io_toBackend_gpaddrMem_waddrxxHTrWwcStfkV;
  export "DPI-C" function set_io_toBackend_gpaddrMem_waddrxxHTrWwcStfkV;
  export "DPI-C" function get_io_toBackend_gpaddrMem_wdata_gpaddrxxHTrWwcStfkV;
  export "DPI-C" function set_io_toBackend_gpaddrMem_wdata_gpaddrxxHTrWwcStfkV;
  export "DPI-C" function get_io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTExxHTrWwcStfkV;
  export "DPI-C" function set_io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTExxHTrWwcStfkV;
  export "DPI-C" function get_io_uncacheInter_fromUncache_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_uncacheInter_fromUncache_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_uncacheInter_fromUncache_bits_dataxxHTrWwcStfkV;
  export "DPI-C" function set_io_uncacheInter_fromUncache_bits_dataxxHTrWwcStfkV;
  export "DPI-C" function get_io_uncacheInter_toUncache_readyxxHTrWwcStfkV;
  export "DPI-C" function set_io_uncacheInter_toUncache_readyxxHTrWwcStfkV;
  export "DPI-C" function get_io_uncacheInter_toUncache_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_uncacheInter_toUncache_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_uncacheInter_toUncache_bits_addrxxHTrWwcStfkV;
  export "DPI-C" function set_io_uncacheInter_toUncache_bits_addrxxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_addrxxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_addrxxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_selectxxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_selectxxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_actionxxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_actionxxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_chainxxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_chainxxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_1xxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_1xxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_2xxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_2xxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_tEnableVec_3xxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_tEnableVec_3xxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_debugModexxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_debugModexxHTrWwcStfkV;
  export "DPI-C" function get_io_frontendTrigger_triggerCanRaiseBpExpxxHTrWwcStfkV;
  export "DPI-C" function set_io_frontendTrigger_triggerCanRaiseBpExpxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_0_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_0_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_0_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_0_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_0_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_0_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_0_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_0_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_1_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_1_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_1_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_1_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_1_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_1_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_1_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_1_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_2_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_2_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_2_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_2_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_2_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_2_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_2_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_2_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_3_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_3_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_3_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_3_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_3_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_3_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_3_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_3_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_4_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_4_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_4_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_4_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_4_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_4_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_4_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_4_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_5_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_5_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_5_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_5_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_5_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_5_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_5_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_5_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_6_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_6_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_6_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_6_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_6_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_6_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_6_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_6_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_7_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_7_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_7_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_7_bits_ftqIdx_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_7_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_7_bits_ftqIdx_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_rob_commits_7_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function set_io_rob_commits_7_bits_ftqOffsetxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_req_readyxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_req_readyxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_req_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_req_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_req_bits_vaddrxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_req_bits_vaddrxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_readyxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_readyxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_validxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_validxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_paddr_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_paddr_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_gpaddr_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_gpaddr_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_pbmt_0xxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_pbmt_0xxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_excp_0_gpf_instrxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_excp_0_gpf_instrxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_excp_0_pf_instrxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_excp_0_pf_instrxxHTrWwcStfkV;
  export "DPI-C" function get_io_iTLBInter_resp_bits_excp_0_af_instrxxHTrWwcStfkV;
  export "DPI-C" function set_io_iTLBInter_resp_bits_excp_0_af_instrxxHTrWwcStfkV;
  export "DPI-C" function get_io_pmp_req_bits_addrxxHTrWwcStfkV;
  export "DPI-C" function set_io_pmp_req_bits_addrxxHTrWwcStfkV;
  export "DPI-C" function get_io_pmp_resp_instrxxHTrWwcStfkV;
  export "DPI-C" function set_io_pmp_resp_instrxxHTrWwcStfkV;
  export "DPI-C" function get_io_pmp_resp_mmioxxHTrWwcStfkV;
  export "DPI-C" function set_io_pmp_resp_mmioxxHTrWwcStfkV;
  export "DPI-C" function get_io_mmioCommitRead_mmioFtqPtr_flagxxHTrWwcStfkV;
  export "DPI-C" function set_io_mmioCommitRead_mmioFtqPtr_flagxxHTrWwcStfkV;
  export "DPI-C" function get_io_mmioCommitRead_mmioFtqPtr_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_mmioCommitRead_mmioFtqPtr_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_mmioCommitRead_mmioLastCommitxxHTrWwcStfkV;
  export "DPI-C" function set_io_mmioCommitRead_mmioLastCommitxxHTrWwcStfkV;
  export "DPI-C" function get_io_csr_fsIsOffxxHTrWwcStfkV;
  export "DPI-C" function set_io_csr_fsIsOffxxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_0_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_0_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_1_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_1_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_2_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_2_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_3_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_3_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_4_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_4_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_5_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_5_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_6_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_6_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_7_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_7_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_8_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_8_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_9_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_9_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_10_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_10_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_11_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_11_valuexxHTrWwcStfkV;
  export "DPI-C" function get_io_perf_12_valuexxHTrWwcStfkV;
  export "DPI-C" function set_io_perf_12_valuexxHTrWwcStfkV;
  export "DPI-C" function get_NewIFU_f1_flushxxHTrWwcStfkV;
  export "DPI-C" function get_NewIFU_f2_flushxxHTrWwcStfkV;
  export "DPI-C" function get_NewIFU_f3_flushxxHTrWwcStfkV;


  function void get_clockxxHTrWwcStfkV;
    output logic  value;
    value=clock;
  endfunction

  function void set_clockxxHTrWwcStfkV;
    input logic  value;
    clock=value;
  endfunction

  function void get_resetxxHTrWwcStfkV;
    output logic  value;
    value=reset;
  endfunction

  function void set_resetxxHTrWwcStfkV;
    input logic  value;
    reset=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_readyxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_req_ready;
  endfunction

  function void set_io_ftqInter_fromFtq_req_readyxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_req_ready=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_req_valid;
  endfunction

  function void set_io_ftqInter_fromFtq_req_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_req_valid=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_startAddrxxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_fromFtq_req_bits_startAddr;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_startAddrxxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_fromFtq_req_bits_startAddr=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_nextlineStartxxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_fromFtq_req_bits_nextlineStart;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_nextlineStartxxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_fromFtq_req_bits_nextlineStart=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_nextStartAddrxxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_fromFtq_req_bits_nextStartAddr;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_nextStartAddrxxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_fromFtq_req_bits_nextStartAddr=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_req_bits_ftqIdx_flag;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_req_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_ftqInter_fromFtq_req_bits_ftqIdx_value;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_ftqInter_fromFtq_req_bits_ftqIdx_value=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_ftqOffset_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_req_bits_ftqOffset_valid;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_ftqOffset_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_req_bits_ftqOffset_valid=value;
  endfunction

  function void get_io_ftqInter_fromFtq_req_bits_ftqOffset_bitsxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_ftqInter_fromFtq_req_bits_ftqOffset_bits;
  endfunction

  function void set_io_ftqInter_fromFtq_req_bits_ftqOffset_bitsxxHTrWwcStfkV;
    input logic [3:0] value;
    io_ftqInter_fromFtq_req_bits_ftqOffset_bits=value;
  endfunction

  function void get_io_ftqInter_fromFtq_redirect_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_redirect_valid;
  endfunction

  function void set_io_ftqInter_fromFtq_redirect_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_redirect_valid=value;
  endfunction

  function void get_io_ftqInter_fromFtq_redirect_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_redirect_bits_ftqIdx_flag;
  endfunction

  function void set_io_ftqInter_fromFtq_redirect_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_redirect_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_ftqInter_fromFtq_redirect_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_ftqInter_fromFtq_redirect_bits_ftqIdx_value;
  endfunction

  function void set_io_ftqInter_fromFtq_redirect_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_ftqInter_fromFtq_redirect_bits_ftqIdx_value=value;
  endfunction

  function void get_io_ftqInter_fromFtq_redirect_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_ftqInter_fromFtq_redirect_bits_ftqOffset;
  endfunction

  function void set_io_ftqInter_fromFtq_redirect_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_ftqInter_fromFtq_redirect_bits_ftqOffset=value;
  endfunction

  function void get_io_ftqInter_fromFtq_redirect_bits_levelxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_redirect_bits_level;
  endfunction

  function void set_io_ftqInter_fromFtq_redirect_bits_levelxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_redirect_bits_level=value;
  endfunction

  function void get_io_ftqInter_fromFtq_flushFromBpu_s2_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_flushFromBpu_s2_valid;
  endfunction

  function void set_io_ftqInter_fromFtq_flushFromBpu_s2_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_flushFromBpu_s2_valid=value;
  endfunction

  function void get_io_ftqInter_fromFtq_flushFromBpu_s2_bits_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_flushFromBpu_s2_bits_flag;
  endfunction

  function void set_io_ftqInter_fromFtq_flushFromBpu_s2_bits_flagxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_flushFromBpu_s2_bits_flag=value;
  endfunction

  function void get_io_ftqInter_fromFtq_flushFromBpu_s2_bits_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_ftqInter_fromFtq_flushFromBpu_s2_bits_value;
  endfunction

  function void set_io_ftqInter_fromFtq_flushFromBpu_s2_bits_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_ftqInter_fromFtq_flushFromBpu_s2_bits_value=value;
  endfunction

  function void get_io_ftqInter_fromFtq_flushFromBpu_s3_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_flushFromBpu_s3_valid;
  endfunction

  function void set_io_ftqInter_fromFtq_flushFromBpu_s3_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_flushFromBpu_s3_valid=value;
  endfunction

  function void get_io_ftqInter_fromFtq_flushFromBpu_s3_bits_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_fromFtq_flushFromBpu_s3_bits_flag;
  endfunction

  function void set_io_ftqInter_fromFtq_flushFromBpu_s3_bits_flagxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_fromFtq_flushFromBpu_s3_bits_flag=value;
  endfunction

  function void get_io_ftqInter_fromFtq_flushFromBpu_s3_bits_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_ftqInter_fromFtq_flushFromBpu_s3_bits_value;
  endfunction

  function void set_io_ftqInter_fromFtq_flushFromBpu_s3_bits_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_ftqInter_fromFtq_flushFromBpu_s3_bits_value=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_0xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_0;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_0xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_0=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_1xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_1;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_1xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_1=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_2xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_2;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_2xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_2=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_3xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_3;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_3xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_3=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_4xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_4;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_4xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_4=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_5xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_5;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_5xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_5=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_6xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_6;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_6xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_6=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_7xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_7;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_7xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_7=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_8xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_8;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_8xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_8=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_9xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_9;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_9xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_9=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_10xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_10;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_10xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_10=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_11xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_11;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_11xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_11=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_12xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_12;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_12xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_12=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_13xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_13;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_13xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_13=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_14xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_14;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_14xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_14=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pc_15xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pc_15;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pc_15xxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_pc_15=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_0_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_0_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_0_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_0_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_0_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_0_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_0_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_0_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_0_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_0_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_0_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_0_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_0_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_0_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_0_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_0_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_0_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_0_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_0_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_0_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_1_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_1_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_1_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_1_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_1_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_1_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_1_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_1_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_1_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_1_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_1_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_1_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_1_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_1_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_1_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_1_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_1_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_1_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_1_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_1_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_2_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_2_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_2_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_2_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_2_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_2_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_2_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_2_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_2_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_2_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_2_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_2_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_2_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_2_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_2_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_2_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_2_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_2_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_2_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_2_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_3_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_3_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_3_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_3_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_3_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_3_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_3_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_3_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_3_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_3_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_3_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_3_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_3_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_3_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_3_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_3_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_3_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_3_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_3_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_3_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_4_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_4_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_4_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_4_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_4_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_4_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_4_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_4_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_4_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_4_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_4_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_4_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_4_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_4_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_4_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_4_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_4_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_4_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_4_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_4_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_5_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_5_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_5_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_5_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_5_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_5_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_5_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_5_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_5_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_5_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_5_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_5_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_5_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_5_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_5_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_5_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_5_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_5_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_5_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_5_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_6_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_6_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_6_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_6_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_6_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_6_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_6_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_6_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_6_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_6_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_6_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_6_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_6_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_6_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_6_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_6_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_6_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_6_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_6_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_6_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_7_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_7_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_7_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_7_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_7_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_7_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_7_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_7_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_7_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_7_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_7_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_7_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_7_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_7_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_7_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_7_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_7_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_7_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_7_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_7_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_8_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_8_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_8_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_8_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_8_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_8_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_8_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_8_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_8_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_8_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_8_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_8_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_8_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_8_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_8_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_8_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_8_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_8_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_8_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_8_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_9_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_9_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_9_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_9_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_9_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_9_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_9_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_9_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_9_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_9_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_9_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_9_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_9_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_9_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_9_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_9_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_9_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_9_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_9_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_9_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_10_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_10_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_10_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_10_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_10_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_10_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_10_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_10_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_10_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_10_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_10_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_10_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_10_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_10_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_10_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_10_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_10_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_10_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_10_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_10_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_11_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_11_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_11_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_11_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_11_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_11_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_11_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_11_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_11_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_11_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_11_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_11_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_11_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_11_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_11_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_11_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_11_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_11_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_11_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_11_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_12_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_12_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_12_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_12_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_12_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_12_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_12_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_12_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_12_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_12_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_12_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_12_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_12_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_12_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_12_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_12_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_12_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_12_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_12_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_12_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_13_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_13_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_13_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_13_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_13_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_13_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_13_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_13_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_13_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_13_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_13_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_13_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_13_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_13_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_13_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_13_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_13_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_13_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_13_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_13_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_14_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_14_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_14_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_14_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_14_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_14_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_14_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_14_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_14_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_14_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_14_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_14_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_14_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_14_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_14_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_14_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_14_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_14_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_14_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_14_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_15_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_15_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_15_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_15_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_15_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_15_isRVC;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_15_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_15_isRVC=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_15_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_15_brType;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_15_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_ftqInter_toFtq_pdWb_bits_pd_15_brType=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_15_isCallxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_15_isCall;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_15_isCallxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_15_isCall=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_pd_15_isRetxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_pd_15_isRet;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_pd_15_isRetxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_pd_15_isRet=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_ftqIdx_flag;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_ftqIdx_value;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_ftqInter_toFtq_pdWb_bits_ftqIdx_value=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_misOffset_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_misOffset_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_misOffset_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_misOffset_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_misOffset_bitsxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_misOffset_bits;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_misOffset_bitsxxHTrWwcStfkV;
    input logic [3:0] value;
    io_ftqInter_toFtq_pdWb_bits_misOffset_bits=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_cfiOffset_validxxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_cfiOffset_valid;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_cfiOffset_validxxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_cfiOffset_valid=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_targetxxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_target;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_targetxxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_target=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_jalTargetxxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_ftqInter_toFtq_pdWb_bits_jalTarget;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_jalTargetxxHTrWwcStfkV;
    input logic [49:0] value;
    io_ftqInter_toFtq_pdWb_bits_jalTarget=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_0xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_0;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_0xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_0=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_1xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_1;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_1xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_1=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_2xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_2;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_2xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_2=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_3xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_3;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_3xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_3=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_4xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_4;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_4xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_4=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_5xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_5;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_5xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_5=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_6xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_6;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_6xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_6=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_7xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_7;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_7xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_7=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_8xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_8;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_8xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_8=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_9xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_9;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_9xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_9=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_10xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_10;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_10xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_10=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_11xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_11;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_11xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_11=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_12xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_12;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_12xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_12=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_13xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_13;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_13xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_13=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_14xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_14;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_14xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_14=value;
  endfunction

  function void get_io_ftqInter_toFtq_pdWb_bits_instrRange_15xxHTrWwcStfkV;
    output logic  value;
    value=io_ftqInter_toFtq_pdWb_bits_instrRange_15;
  endfunction

  function void set_io_ftqInter_toFtq_pdWb_bits_instrRange_15xxHTrWwcStfkV;
    input logic  value;
    io_ftqInter_toFtq_pdWb_bits_instrRange_15=value;
  endfunction

  function void get_io_icacheInter_icacheReadyxxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_icacheReady;
  endfunction

  function void set_io_icacheInter_icacheReadyxxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_icacheReady=value;
  endfunction

  function void get_io_icacheInter_resp_validxxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_resp_valid;
  endfunction

  function void set_io_icacheInter_resp_validxxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_resp_valid=value;
  endfunction

  function void get_io_icacheInter_resp_bits_doublelinexxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_resp_bits_doubleline;
  endfunction

  function void set_io_icacheInter_resp_bits_doublelinexxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_resp_bits_doubleline=value;
  endfunction

  function void get_io_icacheInter_resp_bits_vaddr_0xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_icacheInter_resp_bits_vaddr_0;
  endfunction

  function void set_io_icacheInter_resp_bits_vaddr_0xxHTrWwcStfkV;
    input logic [49:0] value;
    io_icacheInter_resp_bits_vaddr_0=value;
  endfunction

  function void get_io_icacheInter_resp_bits_vaddr_1xxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_icacheInter_resp_bits_vaddr_1;
  endfunction

  function void set_io_icacheInter_resp_bits_vaddr_1xxHTrWwcStfkV;
    input logic [49:0] value;
    io_icacheInter_resp_bits_vaddr_1=value;
  endfunction

  function void get_io_icacheInter_resp_bits_dataxxHTrWwcStfkV;
    output logic [511:0] value;
    value=io_icacheInter_resp_bits_data;
  endfunction

  function void set_io_icacheInter_resp_bits_dataxxHTrWwcStfkV;
    input logic [511:0] value;
    io_icacheInter_resp_bits_data=value;
  endfunction

  function void get_io_icacheInter_resp_bits_paddr_0xxHTrWwcStfkV;
    output logic [47:0] value;
    value=io_icacheInter_resp_bits_paddr_0;
  endfunction

  function void set_io_icacheInter_resp_bits_paddr_0xxHTrWwcStfkV;
    input logic [47:0] value;
    io_icacheInter_resp_bits_paddr_0=value;
  endfunction

  function void get_io_icacheInter_resp_bits_exception_0xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_icacheInter_resp_bits_exception_0;
  endfunction

  function void set_io_icacheInter_resp_bits_exception_0xxHTrWwcStfkV;
    input logic [1:0] value;
    io_icacheInter_resp_bits_exception_0=value;
  endfunction

  function void get_io_icacheInter_resp_bits_exception_1xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_icacheInter_resp_bits_exception_1;
  endfunction

  function void set_io_icacheInter_resp_bits_exception_1xxHTrWwcStfkV;
    input logic [1:0] value;
    io_icacheInter_resp_bits_exception_1=value;
  endfunction

  function void get_io_icacheInter_resp_bits_pmp_mmio_0xxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_resp_bits_pmp_mmio_0;
  endfunction

  function void set_io_icacheInter_resp_bits_pmp_mmio_0xxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_resp_bits_pmp_mmio_0=value;
  endfunction

  function void get_io_icacheInter_resp_bits_pmp_mmio_1xxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_resp_bits_pmp_mmio_1;
  endfunction

  function void set_io_icacheInter_resp_bits_pmp_mmio_1xxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_resp_bits_pmp_mmio_1=value;
  endfunction

  function void get_io_icacheInter_resp_bits_itlb_pbmt_0xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_icacheInter_resp_bits_itlb_pbmt_0;
  endfunction

  function void set_io_icacheInter_resp_bits_itlb_pbmt_0xxHTrWwcStfkV;
    input logic [1:0] value;
    io_icacheInter_resp_bits_itlb_pbmt_0=value;
  endfunction

  function void get_io_icacheInter_resp_bits_itlb_pbmt_1xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_icacheInter_resp_bits_itlb_pbmt_1;
  endfunction

  function void set_io_icacheInter_resp_bits_itlb_pbmt_1xxHTrWwcStfkV;
    input logic [1:0] value;
    io_icacheInter_resp_bits_itlb_pbmt_1=value;
  endfunction

  function void get_io_icacheInter_resp_bits_backendExceptionxxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_resp_bits_backendException;
  endfunction

  function void set_io_icacheInter_resp_bits_backendExceptionxxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_resp_bits_backendException=value;
  endfunction

  function void get_io_icacheInter_resp_bits_gpaddrxxHTrWwcStfkV;
    output logic [55:0] value;
    value=io_icacheInter_resp_bits_gpaddr;
  endfunction

  function void set_io_icacheInter_resp_bits_gpaddrxxHTrWwcStfkV;
    input logic [55:0] value;
    io_icacheInter_resp_bits_gpaddr=value;
  endfunction

  function void get_io_icacheInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
    output logic  value;
    value=io_icacheInter_resp_bits_isForVSnonLeafPTE;
  endfunction

  function void set_io_icacheInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
    input logic  value;
    io_icacheInter_resp_bits_isForVSnonLeafPTE=value;
  endfunction

  function void get_io_icacheStopxxHTrWwcStfkV;
    output logic  value;
    value=io_icacheStop;
  endfunction

  function void set_io_icacheStopxxHTrWwcStfkV;
    input logic  value;
    io_icacheStop=value;
  endfunction

  function void get_io_icachePerfInfo_only_0_hitxxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_only_0_hit;
  endfunction

  function void set_io_icachePerfInfo_only_0_hitxxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_only_0_hit=value;
  endfunction

  function void get_io_icachePerfInfo_only_0_missxxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_only_0_miss;
  endfunction

  function void set_io_icachePerfInfo_only_0_missxxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_only_0_miss=value;
  endfunction

  function void get_io_icachePerfInfo_hit_0_hit_1xxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_hit_0_hit_1;
  endfunction

  function void set_io_icachePerfInfo_hit_0_hit_1xxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_hit_0_hit_1=value;
  endfunction

  function void get_io_icachePerfInfo_hit_0_miss_1xxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_hit_0_miss_1;
  endfunction

  function void set_io_icachePerfInfo_hit_0_miss_1xxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_hit_0_miss_1=value;
  endfunction

  function void get_io_icachePerfInfo_miss_0_hit_1xxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_miss_0_hit_1;
  endfunction

  function void set_io_icachePerfInfo_miss_0_hit_1xxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_miss_0_hit_1=value;
  endfunction

  function void get_io_icachePerfInfo_miss_0_miss_1xxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_miss_0_miss_1;
  endfunction

  function void set_io_icachePerfInfo_miss_0_miss_1xxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_miss_0_miss_1=value;
  endfunction

  function void get_io_icachePerfInfo_bank_hit_1xxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_bank_hit_1;
  endfunction

  function void set_io_icachePerfInfo_bank_hit_1xxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_bank_hit_1=value;
  endfunction

  function void get_io_icachePerfInfo_hitxxHTrWwcStfkV;
    output logic  value;
    value=io_icachePerfInfo_hit;
  endfunction

  function void set_io_icachePerfInfo_hitxxHTrWwcStfkV;
    input logic  value;
    io_icachePerfInfo_hit=value;
  endfunction

  function void get_io_toIbuffer_readyxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_ready;
  endfunction

  function void set_io_toIbuffer_readyxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_ready=value;
  endfunction

  function void get_io_toIbuffer_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_valid;
  endfunction

  function void set_io_toIbuffer_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_0xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_0;
  endfunction

  function void set_io_toIbuffer_bits_instrs_0xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_0=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_1xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_1;
  endfunction

  function void set_io_toIbuffer_bits_instrs_1xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_1=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_2xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_2;
  endfunction

  function void set_io_toIbuffer_bits_instrs_2xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_2=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_3xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_3;
  endfunction

  function void set_io_toIbuffer_bits_instrs_3xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_3=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_4xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_4;
  endfunction

  function void set_io_toIbuffer_bits_instrs_4xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_4=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_5xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_5;
  endfunction

  function void set_io_toIbuffer_bits_instrs_5xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_5=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_6xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_6;
  endfunction

  function void set_io_toIbuffer_bits_instrs_6xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_6=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_7xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_7;
  endfunction

  function void set_io_toIbuffer_bits_instrs_7xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_7=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_8xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_8;
  endfunction

  function void set_io_toIbuffer_bits_instrs_8xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_8=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_9xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_9;
  endfunction

  function void set_io_toIbuffer_bits_instrs_9xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_9=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_10xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_10;
  endfunction

  function void set_io_toIbuffer_bits_instrs_10xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_10=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_11xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_11;
  endfunction

  function void set_io_toIbuffer_bits_instrs_11xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_11=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_12xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_12;
  endfunction

  function void set_io_toIbuffer_bits_instrs_12xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_12=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_13xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_13;
  endfunction

  function void set_io_toIbuffer_bits_instrs_13xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_13=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_14xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_14;
  endfunction

  function void set_io_toIbuffer_bits_instrs_14xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_14=value;
  endfunction

  function void get_io_toIbuffer_bits_instrs_15xxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_toIbuffer_bits_instrs_15;
  endfunction

  function void set_io_toIbuffer_bits_instrs_15xxHTrWwcStfkV;
    input logic [31:0] value;
    io_toIbuffer_bits_instrs_15=value;
  endfunction

  function void get_io_toIbuffer_bits_validxxHTrWwcStfkV;
    output logic [15:0] value;
    value=io_toIbuffer_bits_valid;
  endfunction

  function void set_io_toIbuffer_bits_validxxHTrWwcStfkV;
    input logic [15:0] value;
    io_toIbuffer_bits_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_enqEnablexxHTrWwcStfkV;
    output logic [15:0] value;
    value=io_toIbuffer_bits_enqEnable;
  endfunction

  function void set_io_toIbuffer_bits_enqEnablexxHTrWwcStfkV;
    input logic [15:0] value;
    io_toIbuffer_bits_enqEnable=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_0_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_0_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_0_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_0_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_0_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_0_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_0_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_0_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_1_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_1_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_1_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_1_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_1_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_1_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_1_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_1_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_2_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_2_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_2_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_2_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_2_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_2_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_2_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_2_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_3_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_3_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_3_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_3_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_3_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_3_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_3_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_3_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_4_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_4_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_4_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_4_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_4_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_4_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_4_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_4_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_5_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_5_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_5_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_5_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_5_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_5_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_5_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_5_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_6_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_6_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_6_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_6_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_6_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_6_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_6_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_6_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_7_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_7_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_7_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_7_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_7_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_7_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_7_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_7_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_8_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_8_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_8_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_8_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_8_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_8_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_8_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_8_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_9_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_9_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_9_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_9_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_9_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_9_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_9_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_9_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_10_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_10_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_10_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_10_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_10_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_10_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_10_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_10_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_11_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_11_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_11_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_11_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_11_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_11_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_11_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_11_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_12_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_12_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_12_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_12_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_12_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_12_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_12_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_12_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_13_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_13_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_13_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_13_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_13_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_13_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_13_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_13_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_14_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_14_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_14_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_14_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_14_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_14_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_14_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_14_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_15_isRVCxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_pd_15_isRVC;
  endfunction

  function void set_io_toIbuffer_bits_pd_15_isRVCxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_pd_15_isRVC=value;
  endfunction

  function void get_io_toIbuffer_bits_pd_15_brTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_pd_15_brType;
  endfunction

  function void set_io_toIbuffer_bits_pd_15_brTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_pd_15_brType=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_0xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_0;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_0xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_0=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_1xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_1;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_1xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_1=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_2xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_2;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_2xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_2=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_3xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_3;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_3xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_3=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_4xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_4;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_4xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_4=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_5xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_5;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_5xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_5=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_6xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_6;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_6xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_6=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_7xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_7;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_7xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_7=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_8xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_8;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_8xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_8=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_9xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_9;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_9xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_9=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_10xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_10;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_10xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_10=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_11xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_11;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_11xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_11=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_12xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_12;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_12xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_12=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_13xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_13;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_13xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_13=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_14xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_14;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_14xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_14=value;
  endfunction

  function void get_io_toIbuffer_bits_foldpc_15xxHTrWwcStfkV;
    output logic [9:0] value;
    value=io_toIbuffer_bits_foldpc_15;
  endfunction

  function void set_io_toIbuffer_bits_foldpc_15xxHTrWwcStfkV;
    input logic [9:0] value;
    io_toIbuffer_bits_foldpc_15=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_0_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_0_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_0_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_0_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_1_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_1_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_1_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_1_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_2_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_2_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_2_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_2_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_3_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_3_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_3_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_3_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_4_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_4_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_4_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_4_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_5_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_5_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_5_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_5_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_6_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_6_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_6_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_6_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_7_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_7_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_7_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_7_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_8_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_8_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_8_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_8_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_9_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_9_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_9_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_9_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_10_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_10_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_10_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_10_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_11_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_11_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_11_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_11_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_12_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_12_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_12_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_12_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_13_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_13_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_13_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_13_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_14_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_14_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_14_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_14_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqOffset_15_validxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqOffset_15_valid;
  endfunction

  function void set_io_toIbuffer_bits_ftqOffset_15_validxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqOffset_15_valid=value;
  endfunction

  function void get_io_toIbuffer_bits_backendException_0xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_backendException_0;
  endfunction

  function void set_io_toIbuffer_bits_backendException_0xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_backendException_0=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_0xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_0;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_0xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_0=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_1xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_1;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_1xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_1=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_2xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_2;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_2xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_2=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_3xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_3;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_3xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_3=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_4xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_4;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_4xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_4=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_5xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_5;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_5xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_5=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_6xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_6;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_6xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_6=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_7xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_7;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_7xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_7=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_8xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_8;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_8xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_8=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_9xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_9;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_9xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_9=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_10xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_10;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_10xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_10=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_11xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_11;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_11xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_11=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_12xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_12;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_12xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_12=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_13xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_13;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_13xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_13=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_14xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_14;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_14xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_14=value;
  endfunction

  function void get_io_toIbuffer_bits_exceptionType_15xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_toIbuffer_bits_exceptionType_15;
  endfunction

  function void set_io_toIbuffer_bits_exceptionType_15xxHTrWwcStfkV;
    input logic [1:0] value;
    io_toIbuffer_bits_exceptionType_15=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_0xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_0;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_0xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_0=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_1xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_1;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_1xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_1=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_2xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_2;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_2xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_2=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_3xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_3;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_3xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_3=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_4xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_4;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_4xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_4=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_5xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_5;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_5xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_5=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_6xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_6;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_6xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_6=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_7xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_7;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_7xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_7=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_8xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_8;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_8xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_8=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_9xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_9;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_9xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_9=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_10xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_10;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_10xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_10=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_11xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_11;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_11xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_11=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_12xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_12;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_12xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_12=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_13xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_13;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_13xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_13=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_14xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_14;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_14xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_14=value;
  endfunction

  function void get_io_toIbuffer_bits_crossPageIPFFix_15xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_crossPageIPFFix_15;
  endfunction

  function void set_io_toIbuffer_bits_crossPageIPFFix_15xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_crossPageIPFFix_15=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_0xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_0;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_0xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_0=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_1xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_1;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_1xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_1=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_2xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_2;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_2xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_2=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_3xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_3;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_3xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_3=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_4xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_4;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_4xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_4=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_5xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_5;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_5xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_5=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_6xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_6;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_6xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_6=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_7xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_7;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_7xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_7=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_8xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_8;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_8xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_8=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_9xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_9;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_9xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_9=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_10xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_10;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_10xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_10=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_11xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_11;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_11xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_11=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_12xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_12;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_12xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_12=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_13xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_13;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_13xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_13=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_14xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_14;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_14xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_14=value;
  endfunction

  function void get_io_toIbuffer_bits_illegalInstr_15xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_illegalInstr_15;
  endfunction

  function void set_io_toIbuffer_bits_illegalInstr_15xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_illegalInstr_15=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_0xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_0;
  endfunction

  function void set_io_toIbuffer_bits_triggered_0xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_0=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_1xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_1;
  endfunction

  function void set_io_toIbuffer_bits_triggered_1xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_1=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_2xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_2;
  endfunction

  function void set_io_toIbuffer_bits_triggered_2xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_2=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_3xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_3;
  endfunction

  function void set_io_toIbuffer_bits_triggered_3xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_3=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_4xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_4;
  endfunction

  function void set_io_toIbuffer_bits_triggered_4xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_4=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_5xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_5;
  endfunction

  function void set_io_toIbuffer_bits_triggered_5xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_5=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_6xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_6;
  endfunction

  function void set_io_toIbuffer_bits_triggered_6xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_6=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_7xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_7;
  endfunction

  function void set_io_toIbuffer_bits_triggered_7xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_7=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_8xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_8;
  endfunction

  function void set_io_toIbuffer_bits_triggered_8xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_8=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_9xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_9;
  endfunction

  function void set_io_toIbuffer_bits_triggered_9xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_9=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_10xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_10;
  endfunction

  function void set_io_toIbuffer_bits_triggered_10xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_10=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_11xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_11;
  endfunction

  function void set_io_toIbuffer_bits_triggered_11xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_11=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_12xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_12;
  endfunction

  function void set_io_toIbuffer_bits_triggered_12xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_12=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_13xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_13;
  endfunction

  function void set_io_toIbuffer_bits_triggered_13xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_13=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_14xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_14;
  endfunction

  function void set_io_toIbuffer_bits_triggered_14xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_14=value;
  endfunction

  function void get_io_toIbuffer_bits_triggered_15xxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_toIbuffer_bits_triggered_15;
  endfunction

  function void set_io_toIbuffer_bits_triggered_15xxHTrWwcStfkV;
    input logic [3:0] value;
    io_toIbuffer_bits_triggered_15=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_0xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_0;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_0xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_0=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_1xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_1;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_1xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_1=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_2xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_2;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_2xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_2=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_3xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_3;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_3xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_3=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_4xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_4;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_4xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_4=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_5xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_5;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_5xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_5=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_6xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_6;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_6xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_6=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_7xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_7;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_7xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_7=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_8xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_8;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_8xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_8=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_9xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_9;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_9xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_9=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_10xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_10;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_10xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_10=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_11xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_11;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_11xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_11=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_12xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_12;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_12xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_12=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_13xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_13;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_13xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_13=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_14xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_14;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_14xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_14=value;
  endfunction

  function void get_io_toIbuffer_bits_isLastInFtqEntry_15xxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_isLastInFtqEntry_15;
  endfunction

  function void set_io_toIbuffer_bits_isLastInFtqEntry_15xxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_isLastInFtqEntry_15=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqPtr_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_toIbuffer_bits_ftqPtr_flag;
  endfunction

  function void set_io_toIbuffer_bits_ftqPtr_flagxxHTrWwcStfkV;
    input logic  value;
    io_toIbuffer_bits_ftqPtr_flag=value;
  endfunction

  function void get_io_toIbuffer_bits_ftqPtr_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_toIbuffer_bits_ftqPtr_value;
  endfunction

  function void set_io_toIbuffer_bits_ftqPtr_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_toIbuffer_bits_ftqPtr_value=value;
  endfunction

  function void get_io_toBackend_gpaddrMem_wenxxHTrWwcStfkV;
    output logic  value;
    value=io_toBackend_gpaddrMem_wen;
  endfunction

  function void set_io_toBackend_gpaddrMem_wenxxHTrWwcStfkV;
    input logic  value;
    io_toBackend_gpaddrMem_wen=value;
  endfunction

  function void get_io_toBackend_gpaddrMem_waddrxxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_toBackend_gpaddrMem_waddr;
  endfunction

  function void set_io_toBackend_gpaddrMem_waddrxxHTrWwcStfkV;
    input logic [5:0] value;
    io_toBackend_gpaddrMem_waddr=value;
  endfunction

  function void get_io_toBackend_gpaddrMem_wdata_gpaddrxxHTrWwcStfkV;
    output logic [55:0] value;
    value=io_toBackend_gpaddrMem_wdata_gpaddr;
  endfunction

  function void set_io_toBackend_gpaddrMem_wdata_gpaddrxxHTrWwcStfkV;
    input logic [55:0] value;
    io_toBackend_gpaddrMem_wdata_gpaddr=value;
  endfunction

  function void get_io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTExxHTrWwcStfkV;
    output logic  value;
    value=io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTE;
  endfunction

  function void set_io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTExxHTrWwcStfkV;
    input logic  value;
    io_toBackend_gpaddrMem_wdata_isForVSnonLeafPTE=value;
  endfunction

  function void get_io_uncacheInter_fromUncache_validxxHTrWwcStfkV;
    output logic  value;
    value=io_uncacheInter_fromUncache_valid;
  endfunction

  function void set_io_uncacheInter_fromUncache_validxxHTrWwcStfkV;
    input logic  value;
    io_uncacheInter_fromUncache_valid=value;
  endfunction

  function void get_io_uncacheInter_fromUncache_bits_dataxxHTrWwcStfkV;
    output logic [31:0] value;
    value=io_uncacheInter_fromUncache_bits_data;
  endfunction

  function void set_io_uncacheInter_fromUncache_bits_dataxxHTrWwcStfkV;
    input logic [31:0] value;
    io_uncacheInter_fromUncache_bits_data=value;
  endfunction

  function void get_io_uncacheInter_toUncache_readyxxHTrWwcStfkV;
    output logic  value;
    value=io_uncacheInter_toUncache_ready;
  endfunction

  function void set_io_uncacheInter_toUncache_readyxxHTrWwcStfkV;
    input logic  value;
    io_uncacheInter_toUncache_ready=value;
  endfunction

  function void get_io_uncacheInter_toUncache_validxxHTrWwcStfkV;
    output logic  value;
    value=io_uncacheInter_toUncache_valid;
  endfunction

  function void set_io_uncacheInter_toUncache_validxxHTrWwcStfkV;
    input logic  value;
    io_uncacheInter_toUncache_valid=value;
  endfunction

  function void get_io_uncacheInter_toUncache_bits_addrxxHTrWwcStfkV;
    output logic [47:0] value;
    value=io_uncacheInter_toUncache_bits_addr;
  endfunction

  function void set_io_uncacheInter_toUncache_bits_addrxxHTrWwcStfkV;
    input logic [47:0] value;
    io_uncacheInter_toUncache_bits_addr=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_validxxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tUpdate_valid;
  endfunction

  function void set_io_frontendTrigger_tUpdate_validxxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tUpdate_valid=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_addrxxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_frontendTrigger_tUpdate_bits_addr;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_addrxxHTrWwcStfkV;
    input logic [1:0] value;
    io_frontendTrigger_tUpdate_bits_addr=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_frontendTrigger_tUpdate_bits_tdata_matchType;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_matchTypexxHTrWwcStfkV;
    input logic [1:0] value;
    io_frontendTrigger_tUpdate_bits_tdata_matchType=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_selectxxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tUpdate_bits_tdata_select;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_selectxxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tUpdate_bits_tdata_select=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_actionxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_frontendTrigger_tUpdate_bits_tdata_action;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_actionxxHTrWwcStfkV;
    input logic [3:0] value;
    io_frontendTrigger_tUpdate_bits_tdata_action=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_chainxxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tUpdate_bits_tdata_chain;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_chainxxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tUpdate_bits_tdata_chain=value;
  endfunction

  function void get_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxHTrWwcStfkV;
    output logic [63:0] value;
    value=io_frontendTrigger_tUpdate_bits_tdata_tdata2;
  endfunction

  function void set_io_frontendTrigger_tUpdate_bits_tdata_tdata2xxHTrWwcStfkV;
    input logic [63:0] value;
    io_frontendTrigger_tUpdate_bits_tdata_tdata2=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_0xxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_0;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_0xxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tEnableVec_0=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_1xxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_1;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_1xxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tEnableVec_1=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_2xxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_2;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_2xxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tEnableVec_2=value;
  endfunction

  function void get_io_frontendTrigger_tEnableVec_3xxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_tEnableVec_3;
  endfunction

  function void set_io_frontendTrigger_tEnableVec_3xxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_tEnableVec_3=value;
  endfunction

  function void get_io_frontendTrigger_debugModexxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_debugMode;
  endfunction

  function void set_io_frontendTrigger_debugModexxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_debugMode=value;
  endfunction

  function void get_io_frontendTrigger_triggerCanRaiseBpExpxxHTrWwcStfkV;
    output logic  value;
    value=io_frontendTrigger_triggerCanRaiseBpExp;
  endfunction

  function void set_io_frontendTrigger_triggerCanRaiseBpExpxxHTrWwcStfkV;
    input logic  value;
    io_frontendTrigger_triggerCanRaiseBpExp=value;
  endfunction

  function void get_io_rob_commits_0_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_0_valid;
  endfunction

  function void set_io_rob_commits_0_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_0_valid=value;
  endfunction

  function void get_io_rob_commits_0_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_0_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_0_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_0_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_0_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_0_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_0_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_0_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_0_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_0_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_0_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_0_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_1_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_1_valid;
  endfunction

  function void set_io_rob_commits_1_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_1_valid=value;
  endfunction

  function void get_io_rob_commits_1_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_1_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_1_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_1_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_1_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_1_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_1_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_1_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_1_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_1_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_1_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_1_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_2_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_2_valid;
  endfunction

  function void set_io_rob_commits_2_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_2_valid=value;
  endfunction

  function void get_io_rob_commits_2_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_2_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_2_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_2_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_2_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_2_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_2_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_2_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_2_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_2_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_2_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_2_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_3_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_3_valid;
  endfunction

  function void set_io_rob_commits_3_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_3_valid=value;
  endfunction

  function void get_io_rob_commits_3_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_3_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_3_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_3_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_3_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_3_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_3_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_3_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_3_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_3_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_3_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_3_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_4_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_4_valid;
  endfunction

  function void set_io_rob_commits_4_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_4_valid=value;
  endfunction

  function void get_io_rob_commits_4_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_4_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_4_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_4_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_4_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_4_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_4_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_4_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_4_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_4_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_4_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_4_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_5_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_5_valid;
  endfunction

  function void set_io_rob_commits_5_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_5_valid=value;
  endfunction

  function void get_io_rob_commits_5_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_5_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_5_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_5_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_5_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_5_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_5_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_5_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_5_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_5_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_5_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_5_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_6_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_6_valid;
  endfunction

  function void set_io_rob_commits_6_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_6_valid=value;
  endfunction

  function void get_io_rob_commits_6_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_6_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_6_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_6_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_6_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_6_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_6_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_6_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_6_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_6_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_6_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_6_bits_ftqOffset=value;
  endfunction

  function void get_io_rob_commits_7_validxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_7_valid;
  endfunction

  function void set_io_rob_commits_7_validxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_7_valid=value;
  endfunction

  function void get_io_rob_commits_7_bits_ftqIdx_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_rob_commits_7_bits_ftqIdx_flag;
  endfunction

  function void set_io_rob_commits_7_bits_ftqIdx_flagxxHTrWwcStfkV;
    input logic  value;
    io_rob_commits_7_bits_ftqIdx_flag=value;
  endfunction

  function void get_io_rob_commits_7_bits_ftqIdx_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_rob_commits_7_bits_ftqIdx_value;
  endfunction

  function void set_io_rob_commits_7_bits_ftqIdx_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_rob_commits_7_bits_ftqIdx_value=value;
  endfunction

  function void get_io_rob_commits_7_bits_ftqOffsetxxHTrWwcStfkV;
    output logic [3:0] value;
    value=io_rob_commits_7_bits_ftqOffset;
  endfunction

  function void set_io_rob_commits_7_bits_ftqOffsetxxHTrWwcStfkV;
    input logic [3:0] value;
    io_rob_commits_7_bits_ftqOffset=value;
  endfunction

  function void get_io_iTLBInter_req_readyxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_req_ready;
  endfunction

  function void set_io_iTLBInter_req_readyxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_req_ready=value;
  endfunction

  function void get_io_iTLBInter_req_validxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_req_valid;
  endfunction

  function void set_io_iTLBInter_req_validxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_req_valid=value;
  endfunction

  function void get_io_iTLBInter_req_bits_vaddrxxHTrWwcStfkV;
    output logic [49:0] value;
    value=io_iTLBInter_req_bits_vaddr;
  endfunction

  function void set_io_iTLBInter_req_bits_vaddrxxHTrWwcStfkV;
    input logic [49:0] value;
    io_iTLBInter_req_bits_vaddr=value;
  endfunction

  function void get_io_iTLBInter_resp_readyxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_resp_ready;
  endfunction

  function void set_io_iTLBInter_resp_readyxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_resp_ready=value;
  endfunction

  function void get_io_iTLBInter_resp_validxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_resp_valid;
  endfunction

  function void set_io_iTLBInter_resp_validxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_resp_valid=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_paddr_0xxHTrWwcStfkV;
    output logic [47:0] value;
    value=io_iTLBInter_resp_bits_paddr_0;
  endfunction

  function void set_io_iTLBInter_resp_bits_paddr_0xxHTrWwcStfkV;
    input logic [47:0] value;
    io_iTLBInter_resp_bits_paddr_0=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_gpaddr_0xxHTrWwcStfkV;
    output logic [63:0] value;
    value=io_iTLBInter_resp_bits_gpaddr_0;
  endfunction

  function void set_io_iTLBInter_resp_bits_gpaddr_0xxHTrWwcStfkV;
    input logic [63:0] value;
    io_iTLBInter_resp_bits_gpaddr_0=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_pbmt_0xxHTrWwcStfkV;
    output logic [1:0] value;
    value=io_iTLBInter_resp_bits_pbmt_0;
  endfunction

  function void set_io_iTLBInter_resp_bits_pbmt_0xxHTrWwcStfkV;
    input logic [1:0] value;
    io_iTLBInter_resp_bits_pbmt_0=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_resp_bits_isForVSnonLeafPTE;
  endfunction

  function void set_io_iTLBInter_resp_bits_isForVSnonLeafPTExxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_resp_bits_isForVSnonLeafPTE=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_excp_0_gpf_instrxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_resp_bits_excp_0_gpf_instr;
  endfunction

  function void set_io_iTLBInter_resp_bits_excp_0_gpf_instrxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_resp_bits_excp_0_gpf_instr=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_excp_0_pf_instrxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_resp_bits_excp_0_pf_instr;
  endfunction

  function void set_io_iTLBInter_resp_bits_excp_0_pf_instrxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_resp_bits_excp_0_pf_instr=value;
  endfunction

  function void get_io_iTLBInter_resp_bits_excp_0_af_instrxxHTrWwcStfkV;
    output logic  value;
    value=io_iTLBInter_resp_bits_excp_0_af_instr;
  endfunction

  function void set_io_iTLBInter_resp_bits_excp_0_af_instrxxHTrWwcStfkV;
    input logic  value;
    io_iTLBInter_resp_bits_excp_0_af_instr=value;
  endfunction

  function void get_io_pmp_req_bits_addrxxHTrWwcStfkV;
    output logic [47:0] value;
    value=io_pmp_req_bits_addr;
  endfunction

  function void set_io_pmp_req_bits_addrxxHTrWwcStfkV;
    input logic [47:0] value;
    io_pmp_req_bits_addr=value;
  endfunction

  function void get_io_pmp_resp_instrxxHTrWwcStfkV;
    output logic  value;
    value=io_pmp_resp_instr;
  endfunction

  function void set_io_pmp_resp_instrxxHTrWwcStfkV;
    input logic  value;
    io_pmp_resp_instr=value;
  endfunction

  function void get_io_pmp_resp_mmioxxHTrWwcStfkV;
    output logic  value;
    value=io_pmp_resp_mmio;
  endfunction

  function void set_io_pmp_resp_mmioxxHTrWwcStfkV;
    input logic  value;
    io_pmp_resp_mmio=value;
  endfunction

  function void get_io_mmioCommitRead_mmioFtqPtr_flagxxHTrWwcStfkV;
    output logic  value;
    value=io_mmioCommitRead_mmioFtqPtr_flag;
  endfunction

  function void set_io_mmioCommitRead_mmioFtqPtr_flagxxHTrWwcStfkV;
    input logic  value;
    io_mmioCommitRead_mmioFtqPtr_flag=value;
  endfunction

  function void get_io_mmioCommitRead_mmioFtqPtr_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_mmioCommitRead_mmioFtqPtr_value;
  endfunction

  function void set_io_mmioCommitRead_mmioFtqPtr_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_mmioCommitRead_mmioFtqPtr_value=value;
  endfunction

  function void get_io_mmioCommitRead_mmioLastCommitxxHTrWwcStfkV;
    output logic  value;
    value=io_mmioCommitRead_mmioLastCommit;
  endfunction

  function void set_io_mmioCommitRead_mmioLastCommitxxHTrWwcStfkV;
    input logic  value;
    io_mmioCommitRead_mmioLastCommit=value;
  endfunction

  function void get_io_csr_fsIsOffxxHTrWwcStfkV;
    output logic  value;
    value=io_csr_fsIsOff;
  endfunction

  function void set_io_csr_fsIsOffxxHTrWwcStfkV;
    input logic  value;
    io_csr_fsIsOff=value;
  endfunction

  function void get_io_perf_0_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_0_value;
  endfunction

  function void set_io_perf_0_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_0_value=value;
  endfunction

  function void get_io_perf_1_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_1_value;
  endfunction

  function void set_io_perf_1_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_1_value=value;
  endfunction

  function void get_io_perf_2_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_2_value;
  endfunction

  function void set_io_perf_2_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_2_value=value;
  endfunction

  function void get_io_perf_3_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_3_value;
  endfunction

  function void set_io_perf_3_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_3_value=value;
  endfunction

  function void get_io_perf_4_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_4_value;
  endfunction

  function void set_io_perf_4_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_4_value=value;
  endfunction

  function void get_io_perf_5_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_5_value;
  endfunction

  function void set_io_perf_5_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_5_value=value;
  endfunction

  function void get_io_perf_6_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_6_value;
  endfunction

  function void set_io_perf_6_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_6_value=value;
  endfunction

  function void get_io_perf_7_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_7_value;
  endfunction

  function void set_io_perf_7_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_7_value=value;
  endfunction

  function void get_io_perf_8_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_8_value;
  endfunction

  function void set_io_perf_8_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_8_value=value;
  endfunction

  function void get_io_perf_9_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_9_value;
  endfunction

  function void set_io_perf_9_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_9_value=value;
  endfunction

  function void get_io_perf_10_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_10_value;
  endfunction

  function void set_io_perf_10_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_10_value=value;
  endfunction

  function void get_io_perf_11_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_11_value;
  endfunction

  function void set_io_perf_11_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_11_value=value;
  endfunction

  function void get_io_perf_12_valuexxHTrWwcStfkV;
    output logic [5:0] value;
    value=io_perf_12_value;
  endfunction

  function void set_io_perf_12_valuexxHTrWwcStfkV;
    input logic [5:0] value;
    io_perf_12_value=value;
  endfunction

  function void get_NewIFU_f1_flushxxHTrWwcStfkV;
    output logic  value;
    value=NewIFU.f1_flush;
  endfunction

  function void get_NewIFU_f2_flushxxHTrWwcStfkV;
    output logic  value;
    value=NewIFU.f2_flush;
  endfunction

  function void get_NewIFU_f3_flushxxHTrWwcStfkV;
    output logic  value;
    value=NewIFU.f3_flush;
  endfunction



  initial begin
    $dumpfile("Tage_SC.fst");
    $dumpvars(0, NewIFU_top);
  end

  export "DPI-C" function finish_HTrWwcStfkV;
  function void finish_HTrWwcStfkV;
    $finish;
  endfunction


endmodule
