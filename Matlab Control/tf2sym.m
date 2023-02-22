%% ONLY UPLOAD THIS FILE
%% DO NOT CHANGE THE NAME OF THE FUNCTION
function Gss=tf2sym(Gs)
    %% IMPLEMENTATION GOES HERE
    syms s;
    Size = double(size(Gs));

    for i=1:Size(1)
        for j=1:Size(2)
            
            Nums = Gs(i,j).Numerator{:};
            Dens = Gs(i,j).Denominator{:};
            
            Numss = 0;
            Denss = 0;
            
            len = length(Dens);
            for k=1:len
                Numss = Numss + Nums(k) * s^(len-k);
                Denss = Denss + Dens(k) * s^(len-k);
            end

            Gss(i,j) = Numss/Denss;
            
        end
    end


end