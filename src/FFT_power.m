% 从 Excel 文件读取数据
x = xlsread('data.xlsx');
% 样本长度
t = size(x, 1);
% 采样率
Fs = 10;
% 计算FFT
N = length(x); % 信号长度
X = fft(x); % 进行FFT变换
Pxx = abs(X).^2/N; % 计算功率谱密度
% 计算频率轴
f = Fs * (0:N-1) / N;
% 计算功率谱
P = 2 * Pxx(1:N/2); % 取一半频谱
% 平滑处理（移动平均）可删除
window_size = 3; % 窗口大小
%P_smoothed = movmean(P, window_size);
% 绘制平滑后的功率谱图
% figure;
% plot(f(1:N/2), P_smoothed);
% title('Smoothed Power Spectrum');
% xlabel('Frequency (Hz)');
% ylabel('Power');
% set(gca,'XScale','log','YScale','log');
