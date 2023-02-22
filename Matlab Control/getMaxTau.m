function tau=getMaxTau(mag,phase,w)

    len = length(mag);
    min = 324;
    
    tauvar = false;
    for i=1:len
        if (mag(len-i+1) > 1)
            tauvar = true;
        end
    
    end
    
    if (tauvar)
    
    for i=1:len
        %abs(mag(len-i+1) - 1)
        %min
    
        
        if (abs(mag(len-i+1) - 1) < min)
            min = abs(mag(len-i+1) - 1);
            indx = len-i+1;
        end
       
        if (mag(len-i+1) > 1.1)
            break;
        end
    
    end
    
    else
        tau = NaN;
    end
    
    if (tauvar)
        phase(indx);
        pm = 180+phase(indx);
        while (pm<0)
            pm=pm+360;
        end
        wgc = w(indx);
        
        tau = pm/wgc * pi / 180;
    end

end