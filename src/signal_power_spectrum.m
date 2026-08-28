function E_W_squared = signal_power_spectrum(energy_all, freqs_per_scale)
    % energy_all: 大小为 [num_freqs, num_scales] 的功率谱密度矩阵
    % freqs_per_scale: 每个尺度下的频率范围，大小为 [num_freqs, num_scales]
    
    % 获取尺度维度的大小
    [ num_scales,~] = size(energy_all);
    
    % 初始化 E_W_squared
    E_W_squared = zeros(1, num_scales);
    
    % 计算每个尺度下的平均功率谱密度
    for j = 1:num_scales
        % 对每个尺度下的功率谱密度进行积分
        E_W_squared(j) = trapz(freqs_per_scale(:, j), energy_all(j,:));
    end
end
