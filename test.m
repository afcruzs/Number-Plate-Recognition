
image = imresize( rgb2gray(imread('tempA.png')), [50 50] );
template = imresize( rgb2gray(imread('tempL.png')), [50 50] );
TemplateMatching(image,template)