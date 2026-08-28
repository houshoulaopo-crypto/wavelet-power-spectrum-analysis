function derta = morlet_integral_correct(a, b, omega_0)
    % 定义频率范围
    f = 0:0.01:5; % 频率范围
    
    % 预先定义 psi 和 integral_value
    psi = zeros(length(f), length(a));
    integral_value = zeros(size(a));

    % 计算 Morlet 小波函数和全频域积分
    for i = 1:length(a)
        psi(:,i) = morlet_wavelet(f, a(i), b, omega_0);
        % 计算 Morlet 小波函数的绝对值的平方
        abs_psi_squared = abs(psi(:, i)).^2;
        % 计算全频域积分
        integral_value(i) = trapz(f, abs_psi_squared);
    end
    
    % 计算 derta
    derta = zeros(length(a));
    for i = 1:length(integral_value)
        for j = 1:length(integral_value)
            derta(i,j) = 1/(a(i)^2) * integral_value(i)^2 * integral_value(j)^2;
        end
    end
end

function psi = morlet_wavelet(f, a, b, omega_0)
    % Morlet 小波函数表达式
    psi = 1/a^(1/2) * (pi^(-1/4)) * exp(1i * omega_0 * (- (f - b) / a)) .* exp(-((f - b).^2) / (2 * a));
end
