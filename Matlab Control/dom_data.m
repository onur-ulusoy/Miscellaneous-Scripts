function [m,zeta,wn,stable]=dom_data(pcs)

    syms s;
    r = root(pcs);
    len = length(r);
    
    for i=1:1:len
        if (double(real(r(i))) >= 0)
            stable = false;
            
            m = [];
            zeta = [];
            wn = [];
            return
        end
    end
    
    
    stable = true;
    for i=1:1:len
        if (i==1)
            max_ = r(i);
            index_ = i;
            continue;
        end
    
        if (vpa(real(r(i))) > vpa(real(max_)))
            max_ = vpa(r(i));
            index_ = i;
        end  
       
    end
    
    
    
    rnondom = [];
    t = 1;
    
    for i=1:1:len
    
        if (i == index_)
            continue;
        else
            
            rnondom(t, 1) = vpa(r(i));
            t = t+1;
            
        end
       
    end
    
    len2 = length(rnondom);
    for i=1:1:len2
        if (i==1)
            max2_ = rnondom(i);
            index_ = i;
            continue;
        end
    
        if (real(rnondom(i)) > real(max2_))
            max2_ = vpa(rnondom(i));
            index_ = i;
        end  
       
    end
    
    rnondom2 = [];
    t = 1;
    
    
    
    for i=1:1:len2
    
        if (i == index_)
            continue;
        else
            
            rnondom2(t, 1) = vpa(rnondom(i));
            t = t+1;
            
        end
       
    end
    
    
    dominantPoly = (s-max_)*(s-max2_);
    co = coeffs(dominantPoly,s,"all");
    co = real(co);
    
    wn = sqrt(co(3));
    zeta = co(2)/2/wn;
    
    len3 = length(rnondom2);
    for i=1:1:len3
        if (i==1)
            max_ = rnondom2(i);
            continue;
        end
    
        if (vpa(real(rnondom2(i))) > vpa(real(max_)))
            max_ = vpa(rnondom2(i));
        end  
       
    end
    
    sigma = (-zeta*wn);
    m = real(max_)/sigma;

end