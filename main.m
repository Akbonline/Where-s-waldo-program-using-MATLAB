%% Canny edge detection and Template matching
% Step 1: Creating horizontal and vertical Intensity Changes
% Step 2: Using Step1, calculating Gxy and Iangle
% Step 3: Suppressing Gxy 
% Step 4: Hysteresis and Edge Linking algorithm
clc
clear all
[FileName,FilePath]=uigetfile('*')
Image=imread(strcat(FilePath,FileName));
figure(1),imshow(uint8(Image))
title('Original image')
image=double(Image);
[rows,cols,n_c]=size(image);
Sigma=0.6;  %<==== Can be changed for 0.6, 0.8 and 1
Gaussian_kernel=Gaussian(Sigma);
Gaussian_Deriv_kernel = Gaussian_Deriv(Sigma);

%% Canny Edge Detection 
[magnitude,Gradient,horizontal,vertical,horizontal1, vertical1] = MagnitudeGradient(Gaussian_kernel,Gaussian_Deriv_kernel,image,rows,cols);
figure (2),imshow(uint8(magnitude))
title('Magnitude Image')
figure (3),imshow((vertical))
title('Vertical Image')
figure (4),imshow((horizontal))
title('Horizontal Image')
figure (5),imshow((Gradient))
title('Gradient Image')

for x=1:rows
    for y=1:cols
        if Gradient(x,y)<0
            Gradient(x,y)=Gradient(x,y)+pi;
            Gradient(x,y)=(180/pi)*Gradient(x,y);
        else 
             Gradient(x,y)=(180/pi)*Gradient(x,y);
        end
    end
end
[supress] = NonMaxSuppression(magnitude,Gradient,rows,cols);
figure (6),imshow(uint8(supress))
title('Supressed image')
[Hystersis,edge_matrix] = Hysteresis(supress,rows,cols,90);
figure (7),imshow((edge_matrix))
title('Edges image')
Chamfer=ChamferFunction(edge_matrix);
figure(8),imshow(Chamfer)
title('Original image Chamfer')
%% Template Matching 
x = input("Would you like to perform Template Matching: \n 1. Yes (1)\n 2. No (2)\n");
if x==1
    d1='Please select your image for template matching '
    [FileName,FilePath]=uigetfile('*')
    Image_temp=imread(strcat(FilePath,FileName));
    figure(9),imshow(uint8(Image_temp))
    title('Template image')
    Image_temp1=rgb2gray(Image_temp);
    image_temp=double(Image_temp1);
    [h,w,n_c1]=size(image_temp);
    [Magnitude1,Gradient1,Horizontal1,Vertical1] = MagnitudeGradient(Gaussian_kernel,Gaussian_Deriv_kernel,image_temp,h,w);
    figure (10),imshow((Horizontal1))
    title('Template horizontal image')
    figure (11),imshow((Vertical1))
    title('Template vertical image')
    figure (12),imshow(uint8(Magnitude1))
    title('Template magnitude image')
    figure (13),imshow((Gradient1))
    title('Template Gradient image')
    for x=1:h
        for y=1:w
            if Gradient1(x,y)<0
                Gradient1(x,y)=Gradient1(x,y)+pi;
                Gradient1(x,y)=(180/pi)*Gradient1(x,y);
            else 
                Gradient1(x,y)=(180/pi)*Gradient1(x,y);
            end
        end
    end
%% Sum of Squared Distance and Bounding the target with Red rectange
    [supress1] = NonMaxSuppression(Magnitude1,Gradient1,h,w); 
    figure (14),imshow(uint8(supress1))
    title('Template Supressed image')
    per=input('Please enter a percentage value:\n');       
    [Hystersis1,edge1_matrix] = Hysteresis(supress1,h,w,per);
    figure (15),imshow((edge1_matrix))
    title('Edges image') 
    Chamfer1=ChamferFunction(edge1_matrix);
    figure(16),imshow(Chamfer1)
    title('Template chamfer')
    [output1] = sum_of_squared_dist(Chamfer,Chamfer1);
    [min_val,idx]=min(output1(:));
    [row,col]=ind2sub(size(output1),idx);
    img = Image;
    pos = [col(1), row(1), w, h];    
    figure(17),imshow(img);
    hold on
    rectangle('Position',pos,'EdgeColor','r') %%<=========Drawing the Rectangle
    else 
        J='Oki Doki! Thanks for using the program! '
end