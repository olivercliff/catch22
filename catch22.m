function [out,times] = catch22(y)

% no combination of single functions
coder.inline('never');

% z-score
y = (y - mean(y))/std(y);

out = zeros(22,1);
elapsed = zeros(22,1);

mytic = tic;
out(1) = DN_HistogramMode_5(y);
elapsed(1) = toc(mytic);

out(2) = DN_HistogramMode_10(y);
elapsed(2) = toc(mytic);

out(3) = CO_f1ecac(y);
elapsed(3) = toc(mytic);

out(4) = CO_FirstMin_ac(y);
elapsed(4) = toc(mytic);

out(5) = CO_HistogramAMI_even_2_5(y);
elapsed(5) = toc(mytic);

out(6) = CO_trev_1_num(y);
elapsed(6) = toc(mytic);

out(7) = MD_hrv_classic_pnn40(y); 
elapsed(7) = toc(mytic);

% out(8) = SB_TransitionMatrix_2ac_sumdiagcov(y);
out(8) = SB_BinaryStats_mean_longstretch1(y); 
elapsed(8) = toc(mytic);

% out(9) = SB_TransitionMatrix_3ac_maxeigcov(y);
out(9) = SB_TransitionMatrix_3ac_sumdiagcov(y); 
elapsed(9) = toc(mytic);

out(10) = PD_PeriodicityWang_th0_01(y);
elapsed(10) = toc(mytic);

out(11) = CO_Embed2_Dist_tau_d_expfit_meandiff(y);
elapsed(11) = toc(mytic);

% out(12) = PH_Walker_prop_01_sw_propcross(y);
out(12) = IN_AutoMutualInfoStats_40_gaussian_fmmi(y); 
elapsed(12) = toc(mytic);

out(13) = FC_LocalSimple_mean1_tauresrat(y);
elapsed(13) = toc(mytic);

out(14) = DN_OutlierInclude_p_001_mdrmd(y);
elapsed(14) = toc(mytic);

out(15) = DN_OutlierInclude_n_001_mdrmd(y);
elapsed(15) = toc(mytic);

% out(16) = EX_MovingThreshold_01_01_meankickf(y);
out(16) = SP_Summaries_welch_rect_area_5_1(y); 
elapsed(16) = toc(mytic);

out(17) = SB_BinaryStats_diff_longstretch0(y);
elapsed(17) = toc(mytic);

out(18) = SB_MotifThree_quantile_hh(y);
elapsed(18) = toc(mytic);

out(19) = SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1(y);
elapsed(19) = toc(mytic);

out(20) = SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1(y);
elapsed(20) = toc(mytic);

out(21) = SP_Summaries_welch_rect_centroid(y);
elapsed(21) = toc(mytic);

% out(22) = CO_trev_2_denom(y); % replacement for  MF_arfit_1_8_sbc_meanA
out(22) = FC_LocalSimple_mean3_stderr(y); 
elapsed(22) = toc(mytic);

times = diff([0;elapsed]);