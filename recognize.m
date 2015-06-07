function [character,val] = recognize(binaryImage,alphabet)
    
    binaryImage = imresize(binaryImage,[217,100]);
    
    letter = alphabet(1);
    max = -1;
    dx = 3;
    
    for i=1:length(alphabet);
        filename = strcat('temp',strcat(alphabet(i),'1.png'));
        template = rgb2gray(imread(filename));
        template = imresize(template,[217,100]);
        mx = TemplateMatching(binaryImage,template,dx); 
        if (mx > max);
            letter = alphabet(i);
            max = mx;
        end
    end
    
    character = letter;
    val = max;
 
end