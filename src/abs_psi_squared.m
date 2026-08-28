function output = abs_psi_squared(a, b, omega_0)

    % 定义时间范围
    t = 0:0.1:598.8; % 时间范围

    % 计算 Morlet 小波函数
    for i = 1:length(a)
        psi(:, i) = morlet_wavelet(t, a(i), b, omega_0);
        % 计算 Morlet 小波函数的绝对值的平方
        output(i) = sum(abs(psi(:, i)).^2);
    end

end

function psi = morlet_wavelet(t, a, b, omega_0)
    % Morlet 小波函数表达式
    psi = 1/a^(1/2) * (pi^(-1/4)) * exp(1i * omega_0 * (- (t - b) / a)) .* exp(-(t - b).^2 / (2 * a));
end

