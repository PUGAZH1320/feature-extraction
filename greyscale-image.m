img=imread('G:\Matlab\1.jpeg');
[row,col,color]=size(img);
figure()
imshow(img)
title('original image')
[b]=imresize(img,[1024 1024])
[b1]=rgb2gray(b);
figure();
subplot(3,4,1);
imshow(b)
title('Resized image');
subplot(3,4,2);
imshow(b1)
title('Grayscale image');
