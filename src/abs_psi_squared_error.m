function psi_squared = abs_psi_squared(w, a)
    % w: 频率向量
    % a: 尺度向量
    
    % 初始化 psi_squared
    num_freqs = length(w);
    num_scales = length(a);
    psi_squared = zeros(num_freqs, num_scales);
    
    % 计算每个频率和尺度下的绝对值的平方
    for i = 1:num_scales
        exp_term = -w.^2 ./ (2 * a(i));
        psi_squared(:, i) = (1 ./ a(i)) .* exp(exp_term);
    end
end
