% 生成示例信号
Fs = 1000;          % 采样频率
t = 0:1/Fs:1-1/Fs;  % 时间向量
x = cos(2*pi*50*t) + sin(2*pi*150*t); % 示例信号

% 小波变换参数
scales = 1:1:128;   % 尺度范围
wavename = 'morl';  % Morlet 小波

% 进行连续小波变换
cwtcoeffs = cwt(x, scales, wavename);

% 计算边缘分辨率和边缘偏移
time_resolution = scal2frq(scales, wavename, 1/Fs); % 时间分辨率
frequency_resolution = 1./time_resolution; % 频率分辨率
time_smearing = scales./Fs; % 时间偏移
frequency_smearing = 1./scales; % 频率偏移

% 可视化边缘特性
figure;
subplot(2,1,1);
plot(scales, time_resolution);
xlabel('Scale');
ylabel('Time Resolution');
title('Time Resolution vs Scale');
subplot(2,1,2);
plot(scales, frequency_resolution);
xlabel('Scale'); 
ylabel('Frequency Resolution');
title('Frequency Resolution vs Scale');

figure;
subplot(2,1,1);
plot(scales, time_smearing);
xlabel('Scale');
ylabel('Time Smearing');
title('Time Smearing vs Scale');
subplot(2,1,2);
plot(scales, frequency_smearing);
xlabel('Scale');
ylabel('Frequency Smearing');
title('Frequency Smearing vs Scale');
