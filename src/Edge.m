function k = Edge(a_scales,b,omega,e)
    derta = morlet_integral_correct(a_scales,b,omega);
    k = derta.' * e;
end