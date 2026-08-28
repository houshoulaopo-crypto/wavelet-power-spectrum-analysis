function b_values = scale(a_scales,t)
b = t / 20; % 计算时移参数 b

% 如果有多个尺度，则将 b 扩展为一个与尺度数量相同的向量
b_values = ones(size(a_scales)) * b; % 将 b 扩展为与 a_scales 相同大小的向量

end

