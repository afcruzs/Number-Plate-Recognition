function [character,val] = recognize(binaryImage,alphabet)
    
    binaryImage = imresize(binaryImage,[217,100]);
    
    letter = alphabet(1);
    maxm = -1;
    
    for i=1:length(alphabet);
        cont = 1;
        mean = 0;
        filename = strcat('temp',strcat(alphabet(i),'1.png'));
        
        
        array = [];
        while exist(filename,'file') == 2;
            template = rgb2gray(imread(filename));
            %template = preprocessing_template(imread(filename),217,100);
            template = imresize(template,[217,100]);
            array(end + 1) = TemplateMatching(binaryImage,template);  
            %mean = mean + TemplateMatching(binaryImage,template); 
            cont = cont + 1;
            filename = strcat('temp',strcat(alphabet(i),strcat(num2str(cont),'.png')));
        end
        med = max(array);
        %mean = mean / ( cont-1 );
        if (med > maxm);
           letter = alphabet(i);
           maxm = med;
        end 
    end
    character = letter;
    val = maxm;
 
end