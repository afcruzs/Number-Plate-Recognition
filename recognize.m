function [character,val] = recognize(binaryImage,alphabet)
    
    binaryImage = imresize(binaryImage,[217,100]);
    
    letter = alphabet(1);
    max = -1;
    
    for i=1:length(alphabet);
        cont = 1;
        mean = 0;
        filename = strcat('temp',strcat(alphabet(i),'1.png'));
        while exist(filename,'file') == 2;
            template = rgb2gray(imread(filename));
            template = imresize(template,[217,100]);
            mean = mean + TemplateMatching(binaryImage,template); 
            cont = cont + 1;
            filename = strcat('temp',strcat(alphabet(i),strcat(num2str(cont),'.png')));
        end
        mean = mean / ( cont-1 );
        if (mean > max);
           letter = alphabet(i);
           max = mean;
        end 
    end
    character = letter;
    val = max;
 
end