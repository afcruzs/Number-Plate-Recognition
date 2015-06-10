function ret = fix_ilumination(I)
    background = imopen(I,strel('disk',70)); 
    I2 = I - background;
    I3 = imadjust(I2);
    level = graythresh(I3);
    bw = im2bw(I3,level);
    bw = bwareaopen(bw, 50);
    ret = bw;
end