function [character,val] = recognize(binaryImage,alphabet)
    
    %figure, imshow(binaryImage);
    binaryImage = imresize(binaryImage,[217,100]);
    
    letter = alphabet(1);
    maxm = -1;
    imgMax = '';
    for i=1:length(alphabet);
        cont = 1;
        filename = strcat('temp',strcat(alphabet(i),'1.png'));
        localMax = -1;
        imgLocal = '';
        while exist(filename,'file') == 2;
            template = rgb2gray(imread(filename));
            %template = preprocessing_template(imread(filename),217,100);
            template = imresize(template,[217,100]);
            temp = TemplateMatching(binaryImage,template);  
            
            if( temp > localMax );
                localMax = temp;
                imgLocal = template;
            end
            cont = cont + 1;
            filename = strcat('temp',strcat(alphabet(i),strcat(num2str(cont),'.png')));
        end
        if (localMax > maxm);
           letter = alphabet(i);
           maxm = localMax;
           imgMax = imgLocal;
        end 
    end
    character = letter;
    val = maxm;
    %figure, imshow(imgMax);
    %disp(strcat('recognize ',letter))
end