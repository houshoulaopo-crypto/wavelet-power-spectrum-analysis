clc; clear;

% 读取数据
x = xlsread('data.xlsx');
fs = 10 / 2; % 采样率(奈奎斯特采样定律）
wavename = 'morl';
scales = 1.5:0.08:5; % 尺度范围

% 进行 CWT 分析
cwtcoeffs = cwt(x, scales, wavename); 
cwtfreqs = scal2frq(scales, wavename, 1/fs); % 将尺度转换为频率

% 计算频域能量
energy_all = abs(cwtcoeffs).^2;

% 计算小波函数加权和功率谱
t = (1:length(x)) / fs;
wavelet_power_spectrum = sum(energy_all, 2) / (length(x)/fs); % 沿着列的方向求和

% 绘制时变功率谱图
figure;
pcolor(t, cwtfreqs, energy_all.');
shading interp;
xlabel('时间 (s)');
ylabel('频率 (Hz)');
title('时变功率谱图');
colorbar;
set(gca,'YScale','log');
