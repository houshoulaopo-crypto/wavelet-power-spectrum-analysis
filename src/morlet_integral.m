function derta = morlet_integral(a, b, omega_0)
    % 定义时间范围
    t = 0:0.1:60; % 时间范围
    
    % 预先定义 psi 和 integral_value
    psi = zeros(length(t), length(b));
    integral_value = zeros(size(b));

    % 计算 Morlet 小波函数和全时间积分
    for i = 1:length(b)
        psi(:, i) = morlet_wavelet(t, a(i), b, omega_0);
        % 计算 Morlet 小波函数的绝对值的平方
        abs_psi_squared = abs(psi(:, i)).^2;
        % 计算全时间积分
        integral_value(i) = trapz(t, abs_psi_squared) ;
    end
    
    % 计算 derta
    derta = zeros(length(b));
    for i = 1:length(integral_value)
        for j = 1:length(integral_value)
            derta(i,j) = 1/(a(i)^2) * integral_value(i)^2 * integral_value(j)^2;
        end
    end
end

function psi = morlet_wavelet(t, a, b, omega_0)
    % Morlet 小波函数表达式
    psi = 1/a^(1/2) * (pi^(-1/4)) * exp(1i * omega_0 * (- (t - b) / a)) .* exp(-(t - b).^2 / (2 * a));
end
