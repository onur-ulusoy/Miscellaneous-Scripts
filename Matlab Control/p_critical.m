function [kc, Tc] = p_critical(Gss)

    syms k real;
    syms s w j1;
    assume(w >= 0)
    
    Ts = k*Gss/(1+k*Gss);
    [~,den] = numden(Ts);
    
    den = subs(den ,s , j1*w);
    
    
    
    coef = coeffs(den,j1,"all");
    
    coef = fliplr(coef);
    real_ = 0;
    imag_ = 0;
    u = 0;
    
    for i = 1:length(coef)    
        
        if u == 0
            real_ = real_ + coef(i);
            
        elseif u == 1
            imag_ = imag_ + coef(i);
        
        elseif u == 2
            real_ = real_ - coef(i);
            
        elseif u == 3
            imag_ = imag_ - coef(i);
            u = -1;
        
        end
        
        u = u+1;
        
    end
    
    eqns = [real_== 0, imag_ == 0];
    S = solve(eqns,[w k]);
    
    
    kc = S.k;
    
    Tc = 2*pi./S.w;


end