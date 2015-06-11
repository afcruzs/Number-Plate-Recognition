function img = otsu(imgname)
    I = imgname;
    dim = size(I);
    height = dim(1); width = dim(2);
    histogram = imhist(I); %Se calcula el histograma de la imagen

    T = find_optimal_threshold(histogram,height*width); %Se calcula el Threshold con algoritmo de Otsu.
    img = im2bw(I,T); %Se calcula la imagen binaria 
end

