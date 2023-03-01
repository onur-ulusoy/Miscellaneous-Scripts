%% UPLOAD ONLY THIS FILE
function  [y,t]=step_response(Gs,method)
        sys = ss(Gs);
        h = .1;
        A = sys.A; B = sys.B; C = sys.C; D = sys.D;

        switch(method)
        %% default
        % default implementation goes here
            case "default"
            [y,t] = step(Gs);
            
        %% midpoint
        % midpoint implementation goes here
            case "midpoint"
                x = [0;0];
                index = 1;
                y(1) = 0;
                t(1) = 0;
                for i=0:h:100
                    
                    if (index > 1)
                        if ( abs(y(index,1) - y(index-1,1)) < 0.0000001)
                            break;
                        end
                    end
                    
                    k1 = A*x + B;
                    k2 = A*(x+(k1*h/2)) + B;

                    x = x + k2*h;

                    index = index + 1;
                    y(index, 1) = C*x+D;
                    t(index, 1) = i+h;

                end
               

        %% heun
        % heun implementation goes here
            case "heun"
                x = [0;0];
                index = 1;
                y(1) = 0;
                t(1) = 0;
                for i=0:h:100
                    
                    if (index > 1)
                        if ( abs(y(index,1) - y(index-1,1)) < 0.0000001)
                            break;
                        end
                    end
                    
                    k1 = A*x + B;
                    k2 = A*(x+(k1*h)) + B;

                    x = x + k1*h/2 + k2*h/2;

                    index = index + 1;
                    y(index, 1) = C*x+D;
                    t(index, 1) = i+h;

                end

        %% rkutta4
        % rkutta4 implementation goes here
            case "rkutta4"
                x = [0;0];
                index = 1;
                y(1) = 0;
                t(1) = 0;
                for i=0:h:100
                    
                    if (index > 1)
                        if ( abs(y(index,1) - y(index-1,1)) < 0.0000001)
                            break;
                        end
                    end
                    
                    k1 = A*x + B;
                    k2 = A*(x+(k1*h/2)) + B;
                    k3 = A*(x+(k2*h/2)) + B;
                    k4 = A*(x+k3*h) + B;
                    
                    x = x + h*(k1+2*k2+2*k3+k4)/6;

                    index = index + 1;
                    y(index, 1) = C*x+D;
                    t(index, 1) = i+h;

                end
        end
        % plotting goes here
        plot(t,y);
        % return of the result for given method method

        
end
%% Which method performs the best and why?
% response goes here
% Since by using it closest response to the step() function is achieved, I
% think rkutta4 performs the best. In the background, rkutta4 provides the
% best error order so that we can achieve better solution using same step
% size or achieve same solution using higher step size. That is why rkutta4
% method performs best. Error order is related with how much step size is
% needed to get an error level of 10^-8. 