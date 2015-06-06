function y = TemplateMatching(image,template)
    
    %nc = normalized_correlation(image, template);
   % max(nc(:))
    %y = max(nc(:)) >= threshold;
    sz = size(image);
    t1 = sz(1); t2 = sz(2);
    k = (4 * 2) + 1;    
    sum1 = t1 * t2 * k;
    %sum1 = 1;
    C = sum(sum( ~xor(image , template) )) / (t1*t2);
    M = movingTemplate(image,template) / sum1;
    N = movingTemplate(template,image) / sum1;
    
    P1 = C/M;
    P2 = C/N;
    
    
    y = 0.4 * P1 + 0.6* P2;    
    %xd = city_block(image,template);
    %y = max(xd(:));
    
end



