function st = CCA(img)
    img = ~(img);
    CC = bwconncomp(img);
    st = regionprops(CC, 'BoundingBox' );
end
