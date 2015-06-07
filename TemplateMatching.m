function y = TemplateMatching(image,template, dx)
    
    nc = normalized_correlation(image, template);
   % max(nc(:))
    %y = max(nc(:)) >= threshold;
    %sz = size(image);
    %t1 = sz(1); t2 = sz(2);
    %k = (dx * 2) + 1;    
    %sum1 = t1 * t2 * k;
    %sum1 = 1;
    %C = sum(sum( ~xor(image , template) )) / (t1*t2);
    %M = movingTemplate(image,template,dx);
    %N = movingTemplate(template,image,dx);
    
    %P1 = M;
    %P2 = N;
    
    
    %y = 0.4 * P1 + 0.6* P2;    
    %y = M;
    %xd = city_block(image,template);
    y = max(nc(:));
    
end



