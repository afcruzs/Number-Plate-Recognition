function T = find_optimal_threshold(histogram,N);
    weight_sum = 0;
    for i=1:length(histogram);
        weight_sum = weight_sum + (i-1)*histogram(i);
    end
    sum_b = 0;
    W_b = 0;
    W_f = 0;
    T = 0;
    
    maxm = 0;
    for i=1:length(histogram);
        W_b = W_b + histogram(i);
        if W_b == 0; 
            continue 
        end
        W_f = N - W_b;
        if W_f == 0; 
            continue 
        end
        
        sum_b = sum_b + (i-1)*histogram(i);
        mean_b = sum_b / W_b;
        mean_f = (weight_sum-sum_b)/W_f;
        
        variance = W_b*W_f*((mean_b-mean_f)^2);
        if variance > maxm;
            maxm = variance;
            T = (i-1);
        end
        
    end
    T = T/length(histogram);
end