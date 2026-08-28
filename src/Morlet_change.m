function  morl = Morlet_change(t)
% 信号采样点数
n_samples = 6000;

% 采样频率
Fs = 10; % Hz

% 计算信号的总时间长度
total_time = n_samples / Fs;

% 设置时移因子为信号长度的一半
time_shift_factor = total_time / 2;
    
a = 2;    % 尺度因子
b = 1;    % 时移因子
t = -10:0.01:10;  % 时间范围

% 生成 Morlet 小波函数
morlet_wavelet = cmorwavf(-1/a, b, 6);

% 绘制 Morlet 小波函数图像
plot(t, real(morlet_wavelet));
xlabel('Time');
ylabel('Amplitude');
title('Morlet Wavelet');

end