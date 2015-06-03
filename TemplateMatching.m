function y = TemplateMatching(image,template)
    
    %nc = normalized_correlation(image, template);
   % max(nc(:))
    %y = max(nc(:)) >= threshold;
    xd = city_block(image,template);
    y = max(xd(:));
    
end



