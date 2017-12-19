img1 = imread('StereoBildPaareFuerKorrelation/1/im0.png');
img2 = imread('StereoBildPaareFuerKorrelation/1/im1.png');
%imshow(image1);

ImageGrey1 = rgb2gray(img1);
ImageGrey2 = rgb2gray(img2);

imshowpair(img1,img2,'montage');

red = img1(:,:,1); % Red channel
green = img1(:,:,2); % Green channel
blue = img1(:,:,3); % Blue channel
a = zeros(size(img1, 1), size(img1, 2));
just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);

%figure, imshow(img1), title('Original image')
%figure, imshow(just_red), title('Red channel')
%figure, imshow(just_green), title('Green channel')
%figure, imshow(just_blue), title('Blue channel')

 x = double(just_green(:));  
      m = mean(x);  
      s = std(x);
      x = (x - m) / s; 
% imshow(x);

normalizedImage1 = mat2gray(ImageGrey1);
%figure,imshow(normalizedImage1);
normalizedImage2 = mat2gray(ImageGrey2);
CropedImaged2 = imcrop(ImageGrey2,[1000 1000 1300 1300]);
%figure,imshow(normalizedImage2);



c = normxcorr2(CropedImaged2,ImageGrey1);
%figure, surf(c), shading flat

[ypeak, xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(CropedImaged2,1);
xoffSet = xpeak-size(CropedImaged2,2);

figure
%imshow(ImageGrey1);
%imrect(gca, [xoffSet+1, yoffSet+1, size(CropedImaged2,2), size(CropedImaged2,1)]);