% %  Perform t-test
function [loading_stance,mid_stance,late_stance,ROM,stride_length]=...
    statistcal_tests(loading_stance,mid_stance,late_stance,...
    gait_emg_metrics,gait_emg_metrics_rms,main_parameters_full,gait_metrics_full)
% function [loading_stance,early_stance,mid_stance,late_stance]=...
%     statistcal_tests(loading_stance,early_stance,mid_stance,late_stance,...
%     gait_emg_metrics,gait_emg_metrics_rms)
%% Loading
%CCR
[loading_stance.CCR_r_hypo, loading_stance.CCR_r_p,~,loading_stance.CCR_r_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_r_loading.values',gait_emg_metrics.keeogo.CCR_zero_r_loading.values','Vartype','unequal');
[loading_stance.CCR_l_hypo, loading_stance.CCR_l_p,~,loading_stance.CCR_r_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_l_loading.values',gait_emg_metrics.keeogo.CCR_zero_l_loading.values','Vartype','unequal');
%CCI
[loading_stance.CCI_r_hypo, loading_stance.CCI_r_p,~,loading_stance.CCI_r_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_r_loading_rms.values',gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values','Vartype','unequal');
[loading_stance.CCI_l_hypo, loading_stance.CCI_l_p,~,loading_stance.CCI_r_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_l_loading_rms.values',gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values','Vartype','unequal');
%% Early
% CCR Right
[early_stance.CCR_r_hypo, early_stance.CCR_r_p,~,early_stance.CCR_r_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_r_early.values',gait_emg_metrics.keeogo.CCR_zero_r_early.values','Vartype','unequal');
% CCR Left
[early_stance.CCR_l_hypo, early_stance.CCR_l_p,~,early_stance.CCR_l_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_l_early.values',gait_emg_metrics.keeogo.CCR_zero_l_early.values','Vartype','unequal');
%CCI Right
[early_stance.CCI_r_hypo, early_stance.CCI_r_p,~,early_stance.CCI_r_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_r_early_rms.values',gait_emg_metrics_rms.keeogo.CCI_r_early_rms.values','Vartype','unequal');
%CCI Left
[early_stance.CCI_l_hypo, early_stance.CCI_l_p,~,early_stance.CCI_l_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_l_early_rms.values',gait_emg_metrics_rms.keeogo.CCI_l_early_rms.values','Vartype','unequal');
%% Mid
% CCR Right
[mid_stance.CCR_r_hypo, mid_stance.CCR_r_p,~,mid_stance.CCR_r_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_r_mid.values',gait_emg_metrics.keeogo.CCR_zero_r_mid.values','Vartype','unequal');
% CCR Left 
[mid_stance.CCR_l_hypo, mid_stance.CCR_l_p,~,mid_stance.CCR_l_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_l_mid.values',gait_emg_metrics.keeogo.CCR_zero_l_mid.values','Vartype','unequal');
%CCI Right
[mid_stance.CCI_r_hypo, mid_stance.CCI_r_p,~,mid_stance.CCI_r_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_r_mid_rms.values',gait_emg_metrics_rms.keeogo.CCI_r_mid_rms.values','Vartype','unequal');
%CCI Left
[mid_stance.CCI_l_hypo, mid_stance.CCI_l_p,~,mid_stance.CCI_l_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_l_mid_rms.values',gait_emg_metrics_rms.keeogo.CCI_l_mid_rms.values','Vartype','unequal');
%% Late
% CCR Right
[late_stance.CCR_r_hypo, late_stance.CCR_r_p,~,late_stance.CCR_r_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_r_late.values',gait_emg_metrics.keeogo.CCR_zero_r_late.values','Vartype','unequal');
% CCR Left
[late_stance.CCR_l_hypo, late_stance.CCR_l_p,~,late_stance.CCR_l_stats]=...
    ttest2(gait_emg_metrics.control.CCR_zero_l_late.values',gait_emg_metrics.keeogo.CCR_zero_l_late.values','Vartype','unequal');
%CCI Right
[late_stance.CCI_r_hypo, late_stance.CCI_r_p,~,late_stance.CCI_r_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_r_late_rms.values',gait_emg_metrics_rms.keeogo.CCI_r_late_rms.values','Vartype','unequal');
%CCI Left
[late_stance.CCI_l_hypo, late_stance.CCI_l_p,~,late_stance.CCI_l_stats]=...
    ttest2(gait_emg_metrics_rms.control.CCI_l_late_rms.values',gait_emg_metrics_rms.keeogo.CCI_l_late_rms.values','Vartype','unequal');
%% Stride Length
[stride_length.hypo, stride_length.p,~,stride_length.stats]=...
    ttest2(gait_metrics_full.control.stride_length.values',gait_metrics_full.keeogo.stride_length.values');
%% ROM
[ROM.hypo_r, ROM.p_r,~,ROM.stats_r]=...
    ttest2(main_parameters_full.control.swing_rom_r.values',main_parameters_full.keeogo.swing_rom_r.values');
[ROM.hypo_l, ROM.p_l,~,ROM.stats_l]=...
    ttest2(main_parameters_full.control.swing_rom_l.values',main_parameters_full.keeogo.swing_rom_l.values');
%% Moments
%% Early
% flexion right
[early_stance.flexion_r_hypo, early_stance.flexion_r_p,~,early_stance.flexion_r_stats]=...
    ttest2(main_parameters_full.control.early_stance.flexion_r.values',main_parameters_full.keeogo.early_stance.flexion_r.values');
% flexion Left
[early_stance.flexion_l_hypo, early_stance.flexion_l_p,~,early_stance.flexion_l_stats]=...
    ttest2(main_parameters_full.control.early_stance.flexion_l.values',main_parameters_full.keeogo.early_stance.flexion_l.values');
% adduction Right
[early_stance.add_r_hypo, early_stance.add_r_p,~,early_stance.add_r_stats]=...
    ttest2(main_parameters_full.control.early_stance.adduction_r.values',main_parameters_full.keeogo.early_stance.adduction_r.values');
% adduction Left
[early_stance.add_l_hypo, early_stance.add_l_p,~,early_stance.add_l_stats]=...
    ttest2(main_parameters_full.control.early_stance.adduction_l.values',main_parameters_full.keeogo.early_stance.adduction_l.values');
%% Mid
% flexion right
[mid_stance.flexion_r_hypo, mid_stance.flexion_r_p,~,mid_stance.flexion_r_stats]=...
    ttest2(main_parameters_full.control.mid_stance.flexion_r.values',main_parameters_full.keeogo.mid_stance.flexion_r.values');
% flexion Left
[mid_stance.flexion_l_hypo, mid_stance.flexion_l_p,~,mid_stance.flexion_l_stats]=...
    ttest2(main_parameters_full.control.mid_stance.flexion_l.values',main_parameters_full.keeogo.mid_stance.flexion_l.values');
% adduction Right
[mid_stance.add_r_hypo, mid_stance.add_r_p,~,mid_stance.add_r_stats]=...
    ttest2(main_parameters_full.control.mid_stance.adduction_r.values',main_parameters_full.keeogo.mid_stance.adduction_r.values');
% adduction Left
[mid_stance.add_l_hypo, mid_stance.add_l_p,~,mid_stance.add_l_stats]=...
    ttest2(main_parameters_full.control.mid_stance.adduction_l.values',main_parameters_full.keeogo.mid_stance.adduction_l.values');

%% late
% flexion right
[late_stance.flexion_r_hypo, late_stance.flexion_r_p,~,late_stance.flexion_r_stats]=...
    ttest2(main_parameters_full.control.late_stance.flexion_r.values',main_parameters_full.keeogo.late_stance.flexion_r.values');
% flexion Left
[late_stance.flexion_l_hypo, late_stance.flexion_l_p,~,late_stance.flexion_l_stats]=...
    ttest2(main_parameters_full.control.late_stance.flexion_l.values',main_parameters_full.keeogo.late_stance.flexion_l.values');
% adduction Right
[late_stance.add_r_hypo, late_stance.add_r_p,~,late_stance.add_r_stats]=...
    ttest2(main_parameters_full.control.late_stance.adduction_r.values',main_parameters_full.keeogo.late_stance.adduction_r.values');
% adduction Left
[late_stance.add_l_hypo, late_stance.add_l_p,~,late_stance.add_l_stats]=...
    ttest2(main_parameters_full.control.late_stance.adduction_l.values',main_parameters_full.keeogo.late_stance.adduction_l.values');

end