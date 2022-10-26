clc;
clear all;
close all;
img=imread("G:\Matlab\1.jpeg");
[row,col,color]=size(img);
figure()
imshow(img)
title('Original image');
[b]=imresize(img,[1024 1024])
[b1]=rgb2gray(b);
figure();
subplot(3,4,1);
imshow(b)
title('Resized image');
subplot(3,4,2);
imshow(b1)
title('gray scale image');
d=imsharpen(b,'radius',2,'amount',2);
subplot(3,4,3);
imshow(d);
title('sharped image');
e=histeq(b);
subplot(3,4,4);
imshow(e);
title('histogram equalization');
subplot(3,4,5);
imhist(b);
title('histogram plot of gray');
subplot(3,4,6);
imhist(e);
title('histogram plot');
[Red,Green,Blue]=imsplit(b);
z=zeros(size(b,1));
R= cat(3,Red,z,z);
G=cat(3,z,Green,z);
B=cat(3,z,z,Blue);
subplot(3,4,7)
montage({R,G,B},'Size',[1 3])
title('Scale converted image');
f=edge(b1,'sobel');
subplot(3,4,8);
imshow(f)
title('Edge detected image');
J = imnoise(b1,'gaussian',0.02);
f1 = ordfilt2(J,1,ones(3,3),'symmetric');
f2 = ordfilt2(J,2*2,ones(2,2),'symmetric');
R = imlincomb(0.65,f1,0.65,f2);
subplot(3,4,9)
montage({J,R},'Size',[1 2])
title('Noise image   Filtered Image');