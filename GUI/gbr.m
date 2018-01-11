clc;
clear all;
close all;
tic
for img1=1:200;  
temp1=(num2str(img1));
img2=[temp1 '.jpg'];
I1 = imread(img2);
[rows columns numberOfColorChannels] = size(I1);
if numberOfColorChannels > 1
  I2 = rgb2gray(I1);
else
  I2 = I1; % It's already gray.
end

I=imresize(I2,[256,256]);
 gaborArray = gaborFilterBank(5,8,39,39);
 featureVector = gaborFeatures(I,gaborArray,4,4);
 FV(:,img1)= abs(featureVector);
 
end

save 'FV.mat';
toc