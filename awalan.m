gambar = imread('D:\MateriPoltek\pcd\1.jpg');
% EKSTRAKSI FITUR WARNA
% RGB
red = gambar (:,:,1);
green = gambar (:,:,2);
blue = gambar (:,:,3);
% HSV
hsv = rgb2hsv(gambar);
hue = hsv (:,:,1);
saturation = hsv (:,:,2);
value = hsv (:,:,3);
gray = rgb2gray(gambar);
% YCbCr
YCBCR = rgb2ycbcr(gambar);
% bw = edge(gray,'sobel');

subplot(3,4,1),imshow(gambar),title('original image');
subplot(3,4,2),imshow(red),title('red');
subplot(3,4,3),imshow(green),title('green');
subplot(3,4,4),imshow(blue),title('blue');
subplot(3,4,5),imshow(hue),title('hue');
subplot(3,4,6),imshow(saturation),title('saturation');
subplot(3,4,7),imshow(value),title('value');
subplot(3,4,8),imshow(gray),title('gray');
subplot(3,4,9),imshow(YCBCR),title('YCBCR');