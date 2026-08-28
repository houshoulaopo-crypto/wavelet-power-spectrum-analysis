clc; clear all;
%进行傅里叶变换
FFT_power;
%x = xlsread('e:\MATLAB\bin\A4.xlsx','sheet1','D:D');
x = xlsread('data.xlsx');
fs = 10; % 采样率(奈奎斯特采样定律）
omega = 25;
wavename = 'morl';
a_scales = 15:1:300; % 尺度范围
%之前的代码尺度范围太大，你的信号频率集中在低频和高频所以要将这两个频段放大效果才好
%用的论文的尺度变换公式，调整了尺度范围
a_scales =  (1.5 ^ 0.08) .^ a_scales;
% 根据尺度和采样率计算对应的频率范围
freqs_per_scale = scal2frq(a_scales, 'morl', 1/fs);
b = 1;

% 进行 CWT 分析
cwtcoeffs = cwt(x, a_scales, wavename); 
cwtfreqs = scal2frq(a_scales, wavename, 1/fs); % 将尺度转换为频率

% % 计算频域能量
energy_all = abs(cwtcoeffs).^2;

% 计算在不同尺度下的功率谱密度
S_ff = signal_power_spectrum(energy_all,freqs_per_scale);

% % 计算小波函数加权和功率谱
wavelet_power_spectrum = sum(energy_all, 2)/t; 
wavelet_power = abs_psi_squared(a_scales,b,omega);

k = Edge(a_scales,b,omega,wavelet_power_spectrum);
%计算Syy
for j = 1:length(k)
    Syy(j) = (k(j)* wavelet_power(j)^2) ;
end

%去除0防止意外
for i = 2:length(Syy)
    if Syy(i) == 0
        Syy(i) = Syy(i-1);
    end
end
%% 绘图
figure;
% 绘制傅里叶变换结果
plot(f(1:N/2), P,':','LineWidth', 1.1);
% 
hold on;
% 绘制连续小波变换的功率谱'
plot(cwtfreqs,Syy, 'LineWidth', 1); % 加粗并绘制 
xlabel('频率 \omega/Hz');
ylabel('功率谱 S_{ff}(\omega)');
set(gca,'XScale','log','YScale','log');

% 添加图例
legend( '傅里叶变换','小波变换');
