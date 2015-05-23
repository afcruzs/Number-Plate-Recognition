%images = {'695299.jpg' '998SWC.jpg' 'ABEKO01.jpg' 'BOSA-RSP.jpg' 'CAN-732.jpg' 'CBN612.jpg' 'UAQ305.jpg' 'XVD644.jpg' 'P1010001.jpg' 'P1010002.jpg' 'baza_slika\180902\P9190067.jpg'};
images = {'baza_slika\180902\P9190064.jpg'};
dirs = { 'baza_slika\210503\' 'baza_slika\180902\'
         'baza_slika\170902\' 'baza_slika\141002\'
         'baza_slika\141002\' 'baza_slika\070603\'
         'baza_slika\040603\' 'baza_slika\280503\'};
     
choosen_dirs = [6];
maxm = 7;
for j=1:length(choosen_dirs);
    dir_name = dirs(choosen_dirs(j));
    f = dir( dir_name{1} );
    for i=3:length(f);
        if i == (maxm+3); break; end
        name = f(i).name;
        name = strcat(dir_name,name);
        img = preprocessing( imread(name{1}) );
        figure, title('jeje'), imshow( img );
    end
end

