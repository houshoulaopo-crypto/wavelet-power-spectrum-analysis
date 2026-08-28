clc;clear;
%x=xlsread('e:\MATLAB\bin\A4.xlsx','sheet1','D:D');
x=xlsread('data.xlsx');
fs = 10; % 采样率
t = length(x);                                                             % 样本长度
T = 0:1:length(x)-1;
wavename='morl';
scales =1.6:40:8000; % 尺度范围
cwtcoeffs = cwt(x,scales,wavename); % 进行 CWT 分析
cwtfreqs = scal2frq(scales,wavename,1/fs); % 将尺度转换为频率

TT = length(cwtfreqs);                                                       % 样本长度
energy_all = (abs(cwtcoeffs)).^2/fs;                                         %计算频域能量
[meshT,meshfz]=meshgrid(T,cwtfreqs);
figure
mesh(meshT/10,meshfz,energy_all)
xlabel('时间(s)')
ylabel('频率(rad/s)')
zlabel('谱')
title('实测脉动风的演变谱')
set(gca,'ZScale','log','YScale','log'); %三维时需要加ZScale
view(-90,0);