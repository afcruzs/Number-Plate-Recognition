function character = recognize(binaryImage)
    THRESHOLD = 0.5;
    
    templates.('A') = {'tempA.png'};
    templates.('B') = {'tempB.png'};
    templates.('C') = {'tempC.png'};
    templates.('D') = {'tempD.png'};
    templates.('E') = {'tempE.png'};
    templates.('F') = {'tempF.png'};
    templates.('G') = {'tempG.png'};
    templates.('H') = {'tempH.png'};
    templates.('I') = {'tempI.png'};
    templates.('J') = {'tempJ.png'};
    templates.('K') = {'tempK.png'};
    templates.('L') = {'tempL.png'};
    templates.('M') = {'tempM.png'};
    templates.('N') = {'tempN.png'};
    templates.('O') = {'tempO.png'};
    templates.('P') = {'tempP.png'};
    templates.('Q') = {'tempQ.png'};
    templates.('R') = {'tempR.png'};
    templates.('S') = {'tempS.png'};
    templates.('T') = {'tempT.png'};
    templates.('U') = {'tempU.png'};
    templates.('V') = {'tempV.png'};
    templates.('W') = {'tempW.png'};
    templates.('X') = {'tempX.png'};
    templates.('Y') = {'tempY.png'};
    templates.('Z') = {'tempZ.png'};
    
    binaryImage = imresize(binaryImage,[100,100]);
    
    keys = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    character = -1;
    maxm = THRESHOLD;
    for i=1:length(keys);
        k = keys(i);
        tmp = templates.(k);
        for j=1:length( tmp );
            uu = tmp(j);
            template = rgb2gray(imread(uu{1}));
            template = imresize(template,[100,100]);
            corr = TemplateMatching(binaryImage,template);
            if corr > maxm; 
                character = k;
                maxm = corr;
            end                
        end
    end
    
  %  
end