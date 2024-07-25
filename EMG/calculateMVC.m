function [mvc2] = calculateMVC(signal)
    fs = 2000;
    fs_nyq = fs/2;
    win_smooth = 0.25;
    win_size = win_smooth*fs;
    bp_low = 10;
    bp_high = 500;
    fc_low = 6;
    Wn1 = bp_low/fs_nyq;
    Wn2 = bp_high/fs_nyq;
    Wn = fc_low/fs_nyq;
    level = 100;
    % [bb,ba] = butter(4,[Wn1,Wn2],'bandpass');
    % data = filtfilt(bb,ba,signal);
    % recdata = abs(data - mean(data));
    % smoothed = smoothdata(recdata,'sgolay',win_size);
    % [l_t0_pos1,s0_pos1,l_t0_neg1,s0_neg1]= crossing_V7(ForceLT,time,zcr_threshold,'linear');
    % [t0_pos,s0_pos,t0_neg,s0_neg] = crossing_V7(signal,t,level,'linear');
    pks = findpeaks(signal,'MinPeakDistance',fs*5);%,2*win_size);
    mvc = mean(pks);
    pks2 = sort(pks,'descend');
    mvc2 = mean(pks2(1:5));
end