% FFT
x=xlsread('data.xlsx');
t = length(x);                                                             % 样本长度
T = 0:1:length(x)-1;
fs = 10 / 2 ; % 采样率
% 进行傅里叶变换
N = length(x); % 数据点数
Y = fft(x); % 傅里叶变换

% 计算频率
f = (0:N-1)*(fs/N); % 频率范围
% 绘制原始数据图像
figure;
subplot(2,1,1)
plot(T, x);
title('原始数据');
xlabel('时间');
ylabel('振幅');
% 绘制FFT结果图像
subplot(2,1,2)
plot(f,abs(Y)/N);
title('FFT结果');
xlabel('频率 (Hz)');
ylabel('振幅');
set(gca,'XScale','log','YScale','log'); %三维时需要加ZScale
