function Sageti(II)


I = rgb2gray(II);
%imshow(I);
se = strel('disk',55);  
% Estimarea valorii aproximative a pixelilor din fundal 
background = imopen(I,se);                                                  
% Se folosește open pentru eliminarea obiectelor din imagine
%figure, imshow(background);


I2 = imsubtract(I,background);                                              
% Crearea unei imagini cu fundal uniform
%figure, imshow(I2);



I3 = imadjust(I2, stretchlim(I2), []);                                      
% Ajustarea contrastului imaginii
%figure, imshow(I3); 


level = graythresh(I3);                                                     
% Binarizarea imaginii
bw = imbinarize(I3,level); 
%figure, imshow(bw);


[labeled,numObjects] = bwlabel(bw,8);     % Determinarea numarului de obiecte din imagine si etichetarea regiunilor
%numObjects    

arrowdata = regionprops(labeled,'all');   % Afisarea numarului de obiecte 

a=0;
b=0;
for i=1:numObjects
    if(arrowdata(i).Orientation>-10 && arrowdata(i).Orientation <10)        % Selectarea doar sagetilor care fac un unghi cuprins intre -10 si 10 g cu axa X
    if(arrowdata(i).Extrema(4,2)-arrowdata(i).Extrema(3,2)>-3 && arrowdata(i).Extrema(4,2)-arrowdata(i).Extrema(3,2)<3) % Algoritmul de detectie a sagetilor indreptate spre dreapta
        r=rectangle('Position', arrowdata(i).BoundingBox);                  % Introducerea intr-un dreptunghi a sagetilor indreptate spre dreapta
        set(r,'edgecolor','r')                                              % Schimbarea conturului dreptunghiurilor in rosu
        a=a+1;                                                              % Numararea sagetilor indreptate spre dreapta
        hold on
    end
    end
end

for i=1:numObjects
    if(arrowdata(i).Orientation>-10 && arrowdata(i).Orientation <10)        % Selectarea doar sagetilor care fac un unghi cuprins intre -10 si 10 g cu axa X
    if(arrowdata(i).Extrema(7,2)-arrowdata(i).Extrema(8,2)>-3 && arrowdata(i).Extrema(7,2)-arrowdata(i).Extrema(8,2)<3) % Algoritmul de detectie a sagetilor indreptate spre stanga
        r=rectangle('Position', arrowdata(i).BoundingBox);                  % Introducerea intr-un dreptunghi a sagetilor indreptate spre dreapta
        set(r,'edgecolor','b')                                              % Schimbarea conturului dreptunghiurilor in rosu
        b=b+1;                                                              % Numararea sagetilor indreptate spre dreapta
        hold on
    end
    end
end

end


