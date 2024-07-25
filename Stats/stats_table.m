function [stride_length,loading_stance,early_stance,mid_stance,late_stance,ROM] =...
    stats_table(gait_metrics_full,gait_emg_metrics,gait_emg_metrics_rms,...
    main_parameters_full,participant_number)
% function [stride_length,loading_stance,mid_stance,late_stance,ROM] =...
%     stats_table(gait_emg_metrics,main_parameters_full,participant_number)
% function [loading_stance,early_stance,mid_stance,late_stance,combined] =...
%     stats_table(gait_emg_metrics,gait_emg_metrics_rms,participant_number)

% 0 = control
% 1 = keeogo
%% Add Values into a table
%% Stride Length
stride_length = {zeros(length(gait_metrics_full.control.stride_length.values'),1),gait_metrics_full.control.stride_length.values';...
    ones(length(gait_metrics_full.keeogo.stride_length.values),1),gait_metrics_full.keeogo.stride_length.values'};
stride_length = array2table(stride_length,"VariableNames",{'Condition','stride_length'});
%% CCR Zero
% Right
% % % control_cell_r = cell(length(gait_emg_metrics.control.CCR_zero_r_loading.values'),1);
% % % control_cell_r(:) = {'Control'};
% % % keeogo_cell_r = cell(length(gait_emg_metrics.keeogo.CCR_zero_r_loading.values'),1);
% % % keeogo_cell_r(:) = {'Keeogo'};
% % % loading_stance.CCR_zero_r_loading = [control_cell_r,num2cell(gait_emg_metrics.control.CCR_zero_r_loading.values');...
% % %     keeogo_cell_r,num2cell(gait_emg_metrics.keeogo.CCR_zero_r_loading.values')];
% % % % loading_stance.CCR_zero_r_loading = cell2table(loading_stance.CCR_zero_r_loading,"VariableNames",{'Condition_r','CCR_zero_r_loading'});
% % % early_stance.CCR_zero_r_early = [control_cell_r,num2cell(gait_emg_metrics.control.CCR_zero_r_early.values');...
% % %     keeogo_cell_r,num2cell(gait_emg_metrics.keeogo.CCR_zero_r_early.values')];
% % % % early_stance.CCR_zero_r_early = array2table(early_stance.CCR_zero_r_early,"VariableNames",{'Condition_r','CCR_zero_r_early'});
% % % mid_stance.CCR_zero_r_mid = [control_cell_r,num2cell(gait_emg_metrics.control.CCR_zero_r_mid.values');...
% % %     keeogo_cell_r,num2cell(gait_emg_metrics.keeogo.CCR_zero_r_mid.values')];
% % % % mid_stance.CCR_zero_r_mid = array2table(mid_stance.CCR_zero_r_mid,"VariableNames",{'Condition_r','CCR_zero_r_mid'});
% % % late_stance.CCR_zero_r_late = [control_cell_r,num2cell(gait_emg_metrics.control.CCR_zero_r_late.values');...
% % %     keeogo_cell_r,num2cell(gait_emg_metrics.keeogo.CCR_zero_r_late.values')];
% % % late_stance.CCR_zero_r_late = array2table(late_stance.CCR_zero_r_late,"VariableNames",{'Condition_r','CCR_zero_r_late'});
% For R programming use
% loading_stance.CCR_zero_r_loading = [zeros(length(gait_emg_metrics.control.CCR_zero_r_loading.values'),1),gait_emg_metrics.control.CCR_zero_r_loading.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_r_loading.values'),1),gait_emg_metrics.keeogo.CCR_zero_r_loading.values'];
% loading_stance.CCR_zero_r_loading = array2table(loading_stance.CCR_zero_r_loading,"VariableNames",{'Condition_r','CCR_zero_r_loading'});
% early_stance.CCR_zero_r_early = [zeros(length(gait_emg_metrics.control.CCR_zero_r_early.values'),1),gait_emg_metrics.control.CCR_zero_r_early.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_r_early.values),1),gait_emg_metrics.keeogo.CCR_zero_r_early.values'];
% early_stance.CCR_zero_r_early = array2table(early_stance.CCR_zero_r_early,"VariableNames",{'Condition_r','CCR_zero_r_early'});
% mid_stance.CCR_zero_r_mid = [zeros(length(gait_emg_metrics.control.CCR_zero_r_mid.values'),1),gait_emg_metrics.control.CCR_zero_r_mid.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_r_mid.values'),1),gait_emg_metrics.keeogo.CCR_zero_r_mid.values'];
% mid_stance.CCR_zero_r_mid = array2table(mid_stance.CCR_zero_r_mid,"VariableNames",{'Condition_r','CCR_zero_r_mid'});
% late_stance.CCR_zero_r_late = [zeros(length(gait_emg_metrics.control.CCR_zero_r_late.values'),1),gait_emg_metrics.control.CCR_zero_r_late.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_r_late.values),1),gait_emg_metrics.keeogo.CCR_zero_r_late.values'];
% late_stance.CCR_zero_r_late = array2table(late_stance.CCR_zero_r_late,"VariableNames",{'Condition_r','CCR_zero_r_late'});

%for python programming use

CCR_zero_r_loading_control = [{'Control_r'};num2cell(gait_emg_metrics.control.CCR_zero_r_loading.values')];
CCR_zero_r_loading_keeogo = [{'Keeogo_r'};num2cell(gait_emg_metrics.keeogo.CCR_zero_r_loading.values')];

CCR_zero_r_early_control = [{'Control_r'};num2cell(gait_emg_metrics.control.CCR_zero_r_early.values')];
CCR_zero_r_early_keeogo = [{'Keeogo_r'};num2cell(gait_emg_metrics.keeogo.CCR_zero_r_early.values')];

CCR_zero_r_mid_control = [{'Control_r'};num2cell(gait_emg_metrics.control.CCR_zero_r_mid.values')];
CCR_zero_r_mid_keeogo = [{'Keeogo_r'};num2cell(gait_emg_metrics.keeogo.CCR_zero_r_mid.values')];

CCR_zero_r_late_control = [{'Control_r'};num2cell(gait_emg_metrics.control.CCR_zero_r_late.values')];
CCR_zero_r_late_keeogo = [{'Keeogo_r'};num2cell(gait_emg_metrics.keeogo.CCR_zero_r_late.values')];

% left
% For naming the condition
% % % control_cell_l = cell(length(gait_emg_metrics.control.CCR_zero_l_loading.values'),1);
% % % control_cell_l(:) = {'Control'};
% % % keeogo_cell_l = cell(length(gait_emg_metrics.keeogo.CCR_zero_l_loading.values'),1);
% % % keeogo_cell_l(:) = {'Keeogo'};
% % % loading_stance.CCR_zero_l_loading = [control_cell_l,num2cell(gait_emg_metrics.control.CCR_zero_l_loading.values');...
% % %     keeogo_cell_l,num2cell(gait_emg_metrics.keeogo.CCR_zero_l_loading.values')];
% % % % loading_stance.CCR_zero_l_loading = array2table(loading_stance.CCR_zero_l_loading,"VariableNames",{'Condition_l','CCR_zero_l_loading'});
% % % early_stance.CCR_zero_l_early = [control_cell_l,num2cell(gait_emg_metrics.control.CCR_zero_l_early.values');...
% % %     keeogo_cell_l,num2cell(gait_emg_metrics.keeogo.CCR_zero_l_early.values')];
% % % % early_stance.CCR_zero_l_early = array2table(early_stance.CCR_zero_l_early,"VariableNames",{'Condition_l','CCR_zero_l_early'});
% % % mid_stance.CCR_zero_l_mid = [control_cell_l,num2cell(gait_emg_metrics.control.CCR_zero_l_mid.values');...
% % %     keeogo_cell_l,num2cell(gait_emg_metrics.keeogo.CCR_zero_l_mid.values')];
% % % % mid_stance.CCR_zero_l_mid = array2table(mid_stance.CCR_zero_l_mid,"VariableNames",{'Condition_l','CCR_zero_l_mid'});
% % % late_stance.CCR_zero_l_late = [control_cell_l,num2cell(gait_emg_metrics.control.CCR_zero_l_late.values');...
% % %     keeogo_cell_l,num2cell(gait_emg_metrics.keeogo.CCR_zero_l_late.values')];
% % % late_stance.CCR_zero_l_late = array2table(late_stance.CCR_zero_l_late,"VariableNames",{'Condition_l','CCR_zero_l_late'});
% For R Use
% loading_stance.CCR_zero_l_loading = [zeros(length(gait_emg_metrics.control.CCR_zero_l_loading.values'),1),gait_emg_metrics.control.CCR_zero_l_loading.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_l_loading.values'),1),gait_emg_metrics.keeogo.CCR_zero_l_loading.values'];
% loading_stance.CCR_zero_l_loading = array2table(loading_stance.CCR_zero_l_loading,"VariableNames",{'Condition_l','CCR_zero_l_loading'});
% early_stance.CCR_zero_l_early = [zeros(length(gait_emg_metrics.control.CCR_zero_l_early.values'),1),gait_emg_metrics.control.CCR_zero_l_early.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_l_early.values'),1),gait_emg_metrics.keeogo.CCR_zero_l_early.values'];
% early_stance.CCR_zero_l_early = array2table(early_stance.CCR_zero_l_early,"VariableNames",{'Condition_l','CCR_zero_l_early'});
% mid_stance.CCR_zero_l_mid = [zeros(length(gait_emg_metrics.control.CCR_zero_l_mid.values'),1),gait_emg_metrics.control.CCR_zero_l_mid.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_l_mid.values'),1),gait_emg_metrics.keeogo.CCR_zero_l_mid.values'];
% mid_stance.CCR_zero_l_mid = array2table(mid_stance.CCR_zero_l_mid,"VariableNames",{'Condition_l','CCR_zero_l_mid'});
% late_stance.CCR_zero_l_late = [zeros(length(gait_emg_metrics.control.CCR_zero_l_late.values'),1),gait_emg_metrics.control.CCR_zero_l_late.values';...
%     ones(length(gait_emg_metrics.keeogo.CCR_zero_l_late.values'),1),gait_emg_metrics.keeogo.CCR_zero_l_late.values'];
% late_stance.CCR_zero_l_late = array2table(late_stance.CCR_zero_l_late,"VariableNames",{'Condition_l','CCR_zero_l_late'});
% for python use
%for python programming use

CCR_zero_l_loading_control = [{'Control_l'};num2cell(gait_emg_metrics.control.CCR_zero_l_loading.values')];
CCR_zero_l_loading_keeogo = [{'Keeogo_l'};num2cell(gait_emg_metrics.keeogo.CCR_zero_l_loading.values')];

CCR_zero_l_early_control = [{'Control_l'};num2cell(gait_emg_metrics.control.CCR_zero_l_early.values')];
CCR_zero_l_early_keeogo = [{'Keeogo_l'};num2cell(gait_emg_metrics.keeogo.CCR_zero_l_early.values')];

CCR_zero_l_mid_control = [{'Control_l'};num2cell(gait_emg_metrics.control.CCR_zero_l_mid.values')];
CCR_zero_l_mid_keeogo = [{'Keeogo_l'};num2cell(gait_emg_metrics.keeogo.CCR_zero_l_mid.values')];

CCR_zero_l_late_control = [{'Control_l'};num2cell(gait_emg_metrics.control.CCR_zero_l_late.values')];
CCR_zero_l_late_keeogo = [{'Keeogo_l'};num2cell(gait_emg_metrics.keeogo.CCR_zero_l_late.values')];
%% CCI
%% Right
% Control
control_cell_r = cell(length(gait_emg_metrics_rms.control.CCI_r_loading_rms.values'),1);
control_cell_r(:) = {'Control'};
loading_control_r = cell(length(gait_emg_metrics_rms.control.CCI_r_loading_rms.values'),1);
loading_control_r(:) = {'Loading'};
early_control_r = cell(length(gait_emg_metrics_rms.control.CCI_r_loading_rms.values'),1);
early_control_r(:) = {'Early'};
mid_control_r = cell(length(gait_emg_metrics_rms.control.CCI_r_loading_rms.values'),1);
mid_control_r(:) = {'Mid'};
late_control_r = cell(length(gait_emg_metrics_rms.control.CCI_r_loading_rms.values'),1);
late_control_r(:) = {'Late'};
% Keeogo
keeogo_cell_r = cell(length(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values'),1);
keeogo_cell_r(:) = {'Keeogo'};
loading_keeogo_r = cell(length(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values'),1);
loading_keeogo_r(:) = {'Loading'};
early_keeogo_r = cell(length(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values'),1);
early_keeogo_r(:) = {'Early'};
mid_keeogo_r = cell(length(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values'),1);
mid_keeogo_r(:) = {'Mid'};
late_keeogo_r = cell(length(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values'),1);
late_keeogo_r(:) = {'Late'};

loading_stance.CCI_r_loading = [control_cell_r,num2cell(gait_emg_metrics_rms.control.CCI_r_loading_rms.values');...
    keeogo_cell_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values')];
loading_stance.CCI_r_loading = array2table(loading_stance.CCI_r_loading,"VariableNames",{'Condition_r','CCI_r_loading'});
early_stance.CCI_r_early = [control_cell_r,num2cell(gait_emg_metrics_rms.control.CCI_r_early_rms.values');...
    keeogo_cell_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_early_rms.values')];
early_stance.CCI_r_early = array2table(early_stance.CCI_r_early,"VariableNames",{'Condition_r','CCI_r_early'});
mid_stance.CCI_r_mid = [control_cell_r,num2cell(gait_emg_metrics_rms.control.CCI_r_mid_rms.values');...
    keeogo_cell_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_mid_rms.values')];
mid_stance.CCI_r_mid = array2table(mid_stance.CCI_r_mid,"VariableNames",{'Condition_r','CCI_r_mid'});
late_stance.CCI_r_late = [control_cell_r,num2cell(gait_emg_metrics_rms.control.CCI_r_late_rms.values');...
    keeogo_cell_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_late_rms.values')];
late_stance.CCI_r_late = array2table(late_stance.CCI_r_late,"VariableNames",{'Condition_r','CCI_r_late'});

% % loading_stance.CCI_r_loading = [control_cell_r,loading_control_r,num2cell(gait_emg_metrics_rms.control.CCI_r_loading_rms.values');...
% %     keeogo_cell_r,loading_keeogo_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_loading_rms.values')];
% % % loading_stance.CCI_r_loading = array2table(loading_stance.CCI_r_loading,"VariableNames",{'Condition_r','CCI_r_loading'});
% % early_stance.CCI_r_early = [control_cell_r,early_control_r,num2cell(gait_emg_metrics_rms.control.CCI_r_early_rms.values');...
% %     keeogo_cell_r,early_keeogo_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_early_rms.values')];
% % % early_stance.CCI_r_early = array2table(early_stance.CCI_r_early,"VariableNames",{'Condition_r','CCI_r_early'});
% % mid_stance.CCI_r_mid = [control_cell_r,mid_control_r,num2cell(gait_emg_metrics_rms.control.CCI_r_mid_rms.values');...
% %     keeogo_cell_r,mid_keeogo_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_mid_rms.values')];
% % % mid_stance.CCI_r_mid = array2table(mid_stance.CCI_r_mid,"VariableNames",{'Condition_r','CCI_r_mid'});
% % late_stance.CCI_r_late = [control_cell_r,late_control_r,num2cell(gait_emg_metrics_rms.control.CCI_r_late_rms.values');...
% %     keeogo_cell_r,late_keeogo_r,num2cell(gait_emg_metrics_rms.keeogo.CCI_r_late_rms.values')];
% % % late_stance.CCI_r_late = array2table(late_stance.CCI_r_late,"VariableNames",{'Condition_r','CCI_r_late'});
% % combined.CCI_R = [{'Condition_r','Phase_r','CCI_r',};loading_stance.CCI_r_loading;early_stance.CCI_r_early;...
% %    mid_stance.CCI_r_mid;late_stance.CCI_r_late];
% left
control_cell_l = cell(length(gait_emg_metrics_rms.control.CCI_l_loading_rms.values'),1);
control_cell_l(:) = {'Control'};
loading_control_l = cell(length(gait_emg_metrics_rms.control.CCI_l_loading_rms.values'),1);
loading_control_l(:) = {'Loading'};
early_control_l = cell(length(gait_emg_metrics_rms.control.CCI_l_loading_rms.values'),1);
early_control_l(:) = {'Early'};
mid_control_l = cell(length(gait_emg_metrics_rms.control.CCI_l_loading_rms.values'),1);
mid_control_l(:) = {'Mid'};
late_control_l = cell(length(gait_emg_metrics_rms.control.CCI_l_loading_rms.values'),1);
late_control_l(:) = {'Late'};
% Keeogo
keeogo_cell_l = cell(length(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values'),1);
keeogo_cell_l(:) = {'Keeogo'};
loading_keeogo_l = cell(length(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values'),1);
loading_keeogo_l(:) = {'Loading'};
early_keeogo_l = cell(length(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values'),1);
early_keeogo_l(:) = {'Early'};
mid_keeogo_l = cell(length(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values'),1);
mid_keeogo_l(:) = {'Mid'};
late_keeogo_l = cell(length(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values'),1);
late_keeogo_l(:) = {'Late'};
loading_stance.CCI_l_loading = [control_cell_l,num2cell(gait_emg_metrics_rms.control.CCI_l_loading_rms.values');...
    keeogo_cell_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values')];
loading_stance.CCI_l_loading = array2table(loading_stance.CCI_l_loading,"VariableNames",{'Condition_l','CCI_l_loading'});
early_stance.CCI_l_early = [control_cell_l,num2cell(gait_emg_metrics_rms.control.CCI_l_early_rms.values');...
    keeogo_cell_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_early_rms.values')];
early_stance.CCI_l_early = array2table(early_stance.CCI_l_early,"VariableNames",{'Condition_l','CCI_l_early'});
mid_stance.CCI_l_mid = [control_cell_l,num2cell(gait_emg_metrics_rms.control.CCI_l_mid_rms.values');...
    keeogo_cell_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_mid_rms.values')];
mid_stance.CCI_l_mid = array2table(mid_stance.CCI_l_mid,"VariableNames",{'Condition_l','CCI_l_mid'});
late_stance.CCI_l_late = [control_cell_l,num2cell(gait_emg_metrics_rms.control.CCI_l_late_rms.values');...
    keeogo_cell_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_late_rms.values')];
late_stance.CCI_l_late = array2table(late_stance.CCI_l_late,"VariableNames",{'Condition_l','CCI_l_late'});
% % loading_stance.CCI_l_loading = [control_cell_l,loading_control_l,num2cell(gait_emg_metrics_rms.control.CCI_l_loading_rms.values');...
% %     keeogo_cell_l,loading_keeogo_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_loading_rms.values')];
% % % loading_stance.CCI_l_loading = array2table(loading_stance.CCI_l_loading,"VariableNames",{'Condition_l','CCI_l_loading'});
% % early_stance.CCI_l_early = [control_cell_l,early_control_l,num2cell(gait_emg_metrics_rms.control.CCI_l_early_rms.values');...
% %     keeogo_cell_l,early_keeogo_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_early_rms.values')];
% % % early_stance.CCI_l_early = array2table(early_stance.CCI_l_early,"VariableNames",{'Condition_l','CCI_l_early'});
% % mid_stance.CCI_l_mid = [control_cell_l,mid_control_l,num2cell(gait_emg_metrics_rms.control.CCI_l_mid_rms.values');...
% %     keeogo_cell_l,mid_keeogo_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_mid_rms.values')];
% % % mid_stance.CCI_l_mid = array2table(mid_stance.CCI_l_mid,"VariableNames",{'Condition_l','CCI_l_mid'});
% % late_stance.CCI_l_late = [control_cell_l,late_control_l,num2cell(gait_emg_metrics_rms.control.CCI_l_late_rms.values');...
% %     keeogo_cell_l,late_keeogo_l,num2cell(gait_emg_metrics_rms.keeogo.CCI_l_late_rms.values')];
% % % late_stance.CCI_l_late = array2table(late_stance.CCI_l_late,"VariableNames",{'Condition_l','CCI_l_late'});
% % combined.CCI_L = [{'Condition_l','Phase_l','CCI_l',};loading_stance.CCI_l_loading;early_stance.CCI_l_early;...
% %    mid_stance.CCI_l_mid;late_stance.CCI_l_late];
%% Range of motion
ROM.left = [zeros(length(main_parameters_full.control.swing_rom_l.values'),1),main_parameters_full.control.swing_rom_l.values';...
    ones(length(main_parameters_full.keeogo.swing_rom_l.values'),1),main_parameters_full.keeogo.swing_rom_l.values'];
ROM.left = array2table(ROM.left,"VariableNames",{'Condition_l','ROM_left'});
ROM.right = [zeros(length(main_parameters_full.control.swing_rom_r.values'),1),main_parameters_full.control.swing_rom_r.values';...
    ones(length(main_parameters_full.keeogo.swing_rom_r.values'),1),main_parameters_full.keeogo.swing_rom_r.values'];
ROM.right = array2table(ROM.right,"VariableNames",{'Condition_r','ROM_right'});
%% Moments
%early Stance
early_stance.flexion_r = [zeros(length(main_parameters_full.control.early_stance.flexion_r.values),1),main_parameters_full.control.early_stance.flexion_r.values';...
    ones(length(main_parameters_full.keeogo.early_stance.flexion_r.values),1),main_parameters_full.keeogo.early_stance.flexion_r.values'];
early_stance.flexion_r = array2table(early_stance.flexion_r,"VariableNames",{'Condition_r','Flexion_r'});
early_stance.flexion_l = [zeros(length(main_parameters_full.control.early_stance.flexion_l.values),1),main_parameters_full.control.early_stance.flexion_l.values';...
    ones(length(main_parameters_full.keeogo.early_stance.flexion_l.values),1),main_parameters_full.keeogo.early_stance.flexion_l.values'];
early_stance.flexion_l = array2table(early_stance.flexion_l,"VariableNames",{'Condition_l','Flexion_l'});
early_stance.adduction_r = [zeros(length(main_parameters_full.control.early_stance.adduction_r.values),1),main_parameters_full.control.early_stance.adduction_r.values';...
    ones(length(main_parameters_full.keeogo.early_stance.adduction_r.values),1),main_parameters_full.keeogo.early_stance.adduction_r.values'];
early_stance.adduction_r = array2table(early_stance.adduction_r,"VariableNames",{'Condition_r','adduction_r'});
early_stance.adduction_l = [zeros(length(main_parameters_full.control.early_stance.adduction_l.values),1),main_parameters_full.control.early_stance.adduction_l.values';...
    ones(length(main_parameters_full.keeogo.early_stance.adduction_l.values),1),main_parameters_full.keeogo.early_stance.adduction_l.values'];
early_stance.adduction_l = array2table(early_stance.adduction_l,"VariableNames",{'Condition_l','adduction_l'});
%Mid-stance 
mid_stance.flexion_r = [zeros(length(main_parameters_full.control.mid_stance.flexion_r.values),1),main_parameters_full.control.mid_stance.flexion_r.values';...
    ones(length(main_parameters_full.keeogo.mid_stance.flexion_r.values),1),main_parameters_full.keeogo.mid_stance.flexion_r.values'];
mid_stance.flexion_r = array2table(mid_stance.flexion_r,"VariableNames",{'Condition_r','flexion_r'});
mid_stance.flexion_l = [zeros(length(main_parameters_full.control.mid_stance.flexion_l.values),1),main_parameters_full.control.mid_stance.flexion_l.values';...
    ones(length(main_parameters_full.keeogo.mid_stance.flexion_l.values),1),main_parameters_full.keeogo.mid_stance.flexion_l.values'];
mid_stance.flexion_l = array2table(mid_stance.flexion_l,"VariableNames",{'Condition_l','flexion_l'});
mid_stance.adduction_r = [zeros(length(main_parameters_full.control.mid_stance.adduction_r.values),1),main_parameters_full.control.mid_stance.adduction_r.values';... 
    ones(length(main_parameters_full.keeogo.mid_stance.adduction_r.values),1),main_parameters_full.keeogo.mid_stance.adduction_r.values'];
mid_stance.adduction_r = array2table(mid_stance.adduction_r,"VariableNames",{'Condition_r','adduction_r'});
mid_stance.adduction_l = [zeros(length(main_parameters_full.control.mid_stance.adduction_l.values),1),main_parameters_full.control.mid_stance.adduction_l.values';...
    ones(length(main_parameters_full.keeogo.mid_stance.adduction_l.values),1),main_parameters_full.keeogo.mid_stance.adduction_l.values'];
mid_stance.adduction_l = array2table(mid_stance.adduction_l,"VariableNames",{'Condition_l','adduction_l'});
%late Stance
late_stance.flexion_r = [zeros(length(main_parameters_full.control.late_stance.flexion_r.values),1),main_parameters_full.control.late_stance.flexion_r.values';...
    ones(length(main_parameters_full.keeogo.late_stance.flexion_r.values),1),main_parameters_full.keeogo.late_stance.flexion_r.values'];
late_stance.flexion_r = array2table(late_stance.flexion_r,"VariableNames",{'Condition_r','flexion_r'});
late_stance.flexion_l = [zeros(length(main_parameters_full.control.late_stance.flexion_l.values),1),main_parameters_full.control.late_stance.flexion_l.values';...
    ones(length(main_parameters_full.keeogo.late_stance.flexion_l.values),1),main_parameters_full.keeogo.late_stance.flexion_l.values'];
late_stance.flexion_l = array2table(late_stance.flexion_l,"VariableNames",{'Condition_l','flexion_l'});
late_stance.adduction_r = [zeros(length(main_parameters_full.control.late_stance.adduction_r.values),1),main_parameters_full.control.late_stance.adduction_r.values';...
    ones(length(main_parameters_full.keeogo.late_stance.adduction_r.values),1),main_parameters_full.keeogo.late_stance.adduction_r.values'];
late_stance.adduction_r = array2table(late_stance.adduction_r,"VariableNames",{'Condition_r','adduction_r'});
late_stance.adduction_l = [zeros(length(main_parameters_full.control.late_stance.adduction_l.values),1),main_parameters_full.control.late_stance.adduction_l.values';...
    ones(length(main_parameters_full.keeogo.late_stance.adduction_l.values),1),main_parameters_full.keeogo.late_stance.adduction_l.values'];
late_stance.adduction_l = array2table(late_stance.adduction_l,"VariableNames",{'Condition_l','adduction_l'});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File name
file_name = 'stats_analysis_'+ participant_number +'.xlsx';
%% Stride Length
writetable(stride_length,file_name,'Sheet','ROM','WriteVariableNames',true,'Range','B1');
%% ROM
writetable(ROM.right,file_name,'Sheet','ROM','WriteVariableNames',true,'Range','B1');
writetable(ROM.left,file_name,'Sheet','ROM','WriteVariableNames',true,'Range','D1');
%% CCR 
% % For R Use
% % Loading
% writetable(loading_stance.CCR_zero_r_loading,file_name,'Sheet','CCR_Loading','WriteVariableNames',true,'Range','B1');
% writetable(loading_stance.CCR_zero_l_loading,file_name,'Sheet','CCR_Loading','WriteVariableNames',true,'Range','D1');
% %Early
% writetable(early_stance.CCR_zero_r_early,file_name,'Sheet','CCR_Early','WriteVariableNames',true,'Range','B1');
% writetable(early_stance.CCR_zero_l_early,file_name,'Sheet','CCR_Early','WriteVariableNames',true,'Range','D1');
% % Mid
% writetable(mid_stance.CCR_zero_r_mid,file_name,'Sheet','CCR_Mid','WriteVariableNames',true,'Range','B1');
% writetable(mid_stance.CCR_zero_l_mid,file_name,'Sheet','CCR_Mid','WriteVariableNames',true,'Range','D1');
% %Late
% writetable(late_stance.CCR_zero_r_late,file_name,'Sheet','CCR_Late','WriteVariableNames',true,'Range','B1');
% writetable(late_stance.CCR_zero_l_late,file_name,'Sheet','CCR_Late','WriteVariableNames',true,'Range','D1');
% % For python use
% Loading
writecell(CCR_zero_r_loading_control,file_name,'Sheet','CCR_Loading_control_r');
writecell(CCR_zero_r_loading_keeogo,file_name,'Sheet','CCR_Loading_keeogo_r');
writecell(CCR_zero_l_loading_control,file_name,'Sheet','CCR_Loading_control_l');
writecell(CCR_zero_l_loading_keeogo,file_name,'Sheet','CCR_Loading_keeogo_l');
%Early
writecell(CCR_zero_r_early_control,file_name,'Sheet','CCR_Early_control_r');
writecell(CCR_zero_r_early_keeogo,file_name,'Sheet','CCR_Early_keeogo_r');
writecell(CCR_zero_l_early_control,file_name,'Sheet','CCR_Early_control_l');
writecell(CCR_zero_l_early_keeogo,file_name,'Sheet','CCR_Early_keeogo_l');
% Mid
writecell(CCR_zero_r_mid_control,file_name,'Sheet','CCR_Mid_control_r');
writecell(CCR_zero_r_mid_keeogo,file_name,'Sheet','CCR_Mid_keeogo_r');
writecell(CCR_zero_l_mid_control,file_name,'Sheet','CCR_Mid_control_l');
writecell(CCR_zero_l_mid_keeogo,file_name,'Sheet','CCR_Mid_keeogo_l');
%Late
writecell(CCR_zero_r_late_control,file_name,'Sheet','CCR_Late_control_r');
writecell(CCR_zero_r_late_keeogo,file_name,'Sheet','CCR_Late_keeogo_r');
writecell(CCR_zero_l_late_control,file_name,'Sheet','CCR_Late_control_l');
writecell(CCR_zero_l_late_keeogo,file_name,'Sheet','CCR_Late_keeogo_l');
% % Original
% % Loading
% writecell(loading_stance.CCR_zero_r_loading,file_name,'Sheet','CCR_Loading','Range','B1');
% writecell(loading_stance.CCR_zero_l_loading,file_name,'Sheet','CCR_Loading','Range','D1');
% %Early
% writecell(early_stance.CCR_zero_r_early,file_name,'Sheet','CCR_Early','Range','B1');
% writecell(early_stance.CCR_zero_l_early,file_name,'Sheet','CCR_Early','Range','D1');
% % Mid
% writecell(mid_stance.CCR_zero_r_mid,file_name,'Sheet','CCR_Mid','Range','B1');
% writecell(mid_stance.CCR_zero_l_mid,file_name,'Sheet','CCR_Mid','Range','D1');
% %Late
% writecell(late_stance.CCR_zero_r_late,file_name,'Sheet','CCR_Late','Range','B1');
% writecell(late_stance.CCR_zero_l_late,file_name,'Sheet','CCR_Late','Range','D1');
%% CCI 
% Loading
writetable(loading_stance.CCI_r_loading,file_name,'Sheet','CCI_Loading','WriteVariableNames',true,'Range','B1');
writetable(loading_stance.CCI_l_loading,file_name,'Sheet','CCI_Loading','WriteVariableNames',true,'Range','D1');
%Early
writetable(early_stance.CCI_r_early,file_name,'Sheet','CCI_Early','WriteVariableNames',true,'Range','B1');
writetable(early_stance.CCI_l_early,file_name,'Sheet','CCI_Early','WriteVariableNames',true,'Range','D1');
%Mid
writetable(mid_stance.CCI_r_mid,file_name,'Sheet','CCI_Mid','WriteVariableNames',true,'Range','B1');
writetable(mid_stance.CCI_l_mid,file_name,'Sheet','CCI_Mid','WriteVariableNames',true,'Range','D1');
%Late
writetable(late_stance.CCI_r_late,file_name,'Sheet','CCI_Late','WriteVariableNames',true,'Range','B1');
writetable(late_stance.CCI_l_late,file_name,'Sheet','CCI_Late','WriteVariableNames',true,'Range','D1');
% For python use

%Combined
% writetable(Combined.CCI_R,file_name,'Sheet','CCI_Combined','WriteVariableNames',true,'Range','B1');
% writetable(Combined.CCI_L,file_name,'Sheet','CCI_Combined','WriteVariableNames',true,'Range','D1');
% % Loading
% writecell(loading_stance.CCI_r_loading,file_name,'Sheet','CCI_Loading','Range','B1');
% writecell(loading_stance.CCI_l_loading,file_name,'Sheet','CCI_Loading','Range','E1');
% %Early
% writecell(early_stance.CCI_r_early,file_name,'Sheet','CCI_Early','Range','B1');
% writecell(early_stance.CCI_l_early,file_name,'Sheet','CCI_Early','Range','E1');
% %Mid
% writecell(mid_stance.CCI_r_mid,file_name,'Sheet','CCI_Mid','Range','B1');
% writecell(mid_stance.CCI_l_mid,file_name,'Sheet','CCI_Mid','Range','E1');
% %Late
% writecell(late_stance.CCI_r_late,file_name,'Sheet','CCI_Late','Range','B1');
% writecell(late_stance.CCI_l_late,file_name,'Sheet','CCI_Late','Range','E1');
% %Combined
% writecell(combined.CCI_R,file_name,'Sheet','CCI_Combined','Range','B1');
% writecell(combined.CCI_L,file_name,'Sheet','CCI_Combined','Range','E1');
%% Moments (Flexion)
%Early
writetable(early_stance.flexion_r,file_name,'Sheet','Early_Flexion','WriteVariableNames',true,'Range','B1');
writetable(early_stance.flexion_l,file_name,'Sheet','Early_Flexion','WriteVariableNames',true,'Range','D1');
%Mid
writetable(mid_stance.flexion_r,file_name,'Sheet','Mid_Flexion','WriteVariableNames',true,'Range','B1');
writetable(mid_stance.flexion_l,file_name,'Sheet','Mid_Flexion','WriteVariableNames',true,'Range','D1');
%Late
writetable(late_stance.flexion_r,file_name,'Sheet','Late_Flexion','WriteVariableNames',true,'Range','B1');
writetable(late_stance.flexion_l,file_name,'Sheet','Late_Flexion','WriteVariableNames',true,'Range','D1');
%% Moments (Adduction)
%Early
writetable(early_stance.adduction_r,file_name,'Sheet','Early_Adduction','WriteVariableNames',true,'Range','B1');
writetable(early_stance.adduction_l,file_name,'Sheet','Early_Adduction','WriteVariableNames',true,'Range','D1');
%Mid
writetable(mid_stance.adduction_r,file_name,'Sheet','Mid_Adduction','WriteVariableNames',true,'Range','B1');
writetable(mid_stance.adduction_l,file_name,'Sheet','Mid_Adduction','WriteVariableNames',true,'Range','D1');
%Late
writetable(late_stance.adduction_r,file_name,'Sheet','Late_Adduction','WriteVariableNames',true,'Range','B1');
writetable(late_stance.adduction_l,file_name,'Sheet','Late_Adduction','WriteVariableNames',true,'Range','D1');
end