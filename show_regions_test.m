images = {'695299.jpg' '998SWC.jpg' 'ABEKO01.jpg' 'BOSA-RSP.jpg' 'CAN-732.jpg' 'CBN612.jpg' 'UAQ305.jpg' 'XVD644.jpg' 'P1010001.jpg' 'P1010002.jpg' 'baza_slika\180902\P9190067.jpg'};
for i=1:length(images);
    name = images(i);
    name = name{1};
    img = imread(name);
    prep = preprocessing(img);
    show_regions(prep);
end