function M = movingTemplate(image,template, t)
    M  = 0;
    sz = size(image);
    h = sz(1);
    w = sz(2);
    dxx = t;
    dyy = t;
    for dx = -dxx:1:dxx;
        for dy = -dyy:dyy;
            for i=1:h;
                for j=1:w;
                    x = i+dx;
                    y = j+dy;
                    if( x <= h && y <= w && x >= 1 && y >= 1);
                        M  = M + ~xor(template(x,y) , image(i,j) );
                    end
                
                end
            end
        end
    end
    
    
end