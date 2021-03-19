% M = neumann(10,1,6,4); 
% N = neumann_periodic(10,2,4,10); 
function result = neumann(n, k, init, last) 
    m=1; result = zeros(2,2*k*(k+1));  
        for i = 1:n 
            for j = 1:n 
                if m > 2*k*(k+1) 
                    return; 
                else if (abs(i-init)+abs(j-last)) <= k && (abs(i-init)+abs(j-last)) ~= 0 
                        result(1,m) = i; result(2,m) = j; 
                        m = m+1; 
                    end
                end
            end
        end
end

function result = neumann_periodic(n, k, init, last) 
    x=0; 
    y=0; 
    if (init+k) > n 
        x = init-k; 
    elseif (init-k) < 1 
        x = init+k; 
    else
        x = init; 
    end
    
    if (last+k) > n 
        y = last-k; 
    elseif (last-k) < 1 
        y = last+k; 
    else
        y = last;
    end
    
    m=1; 
    result = zeros(2,2*k*(k+1)); 
     
        for i = 1:n 
            for j = 1:n 
                if m > 2*k*(k+1) 
                    if (init+k) > n 
                        for l = 1:2*k*(k+1) 
                            if mod(result(1,l)+k,n) == 0 
                                result(1,l) = result(1,l)+k; 
                            else
                                result(1,l) = mod(result(1,l)+k,n);
                            end
                        end
                    elseif (init-k) < 1 
                        for l = 1:2*k*(k+1) 
                            if mod(result(1,l)+n-k,n) == 0 
                                result(1,l) = result(1,l)+n-k; 
                            else
                                result(1,l) = mod(result(1,l)+n-k,n); 
                            end
                        end
                    end
                    if (last+k) > n 
                        for l = 1:2*k*(k+1) 
                            if mod(result(2,l)+k,n) == 0 
                                result(2,l) = result(2,l)+k; 
                            else
                                result(2,l) = mod(result(2,l)+k,n); 
                            end
                        end
                    elseif (last-k) < 1 
                        for l = 1:2*k*(k+1) 
                            if mod(result(2,l)+n-k,n) == 0 
                                result(2,l) = result(2,l)+n-k; 
                            else
                                result(2,l) = mod(result(2,l)+n-k,n);
                            end
                        end
                    end
                    return; 
                else if (abs(i-x)+abs(j-y)) <= k && (abs(i-x)+abs(j-y))~= 0 
                        result(1,m) = i; 
                        result(2,m) = j; 
                        m = m+1; 
                    end
                end
            end
        end
end
