
clear;
mov1=VideoReader(['Fireworks_3.mp4']);
nframes = mov1.NumberOfFrames;
nframes=1200;
% image1=read(mov1,750);
% image2=read(mov1,751);
% 
% image1 = rgb2gray(image1);
% image2 = rgb2gray(image2);
% figure;
% imshow(image1)
% figure;
% imshow(image2)
h=waitbar(0,'waiting');
dx = zeros(1,nframes-1);
dy = zeros(1,nframes-1);

for i = 1:nframes-1
waitbar((i)/nframes)
image1=read(mov1,i);
image2=read(mov1,i+1);
image1 = rgb2gray(image1);
image2 = rgb2gray(image2);
image1 = image1(100:1000,500:1700);
image1 = imresize(image1,[100 100]);
image2 = image2(100:1000,500:1700);
image2 = imresize(image2,[100 100]);
cc = xcorr2(double(image1),double(image2));
sumx = 0;
sumy = 0;
sum = 0;
for k =1: 199
    for j = 1:199
        sumx = sumx +cc(k,j)*j;
        sumy = sumy +cc(k,j)*k;
        sum = sum + cc(k,j);
    end
end
dx(i) = sumx/sum-100;
dy(i) = sumy/sum-100;
end
close(h)

A=[dx;dy];
figure;
plot(1:nframes-2, dx(1:end-1))
hold on
plot(1:nframes-2, dy(1:end-1))

csvwrite('dxdy2.csv',A')



