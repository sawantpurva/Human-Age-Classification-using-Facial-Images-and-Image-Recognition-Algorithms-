clc;
clear all;
%Taking images 
for img_count=1:200      
temp=(num2str(img_count));
img=[temp '.jpg'];
I1 = imread(img);
[rows columns numberOfColorChannels] = size(I1);
if numberOfColorChannels > 1
  I2 = rgb2gray(I1);
else
  I2 = I1; % It's already gray.
end
%I2= rgb2gray(I1);
I=imresize(I2,[256,256]);

%Wavelet transform
[ca ch cv cd]=wt2(I,'rbio1.1');
[m n]=size(ch);
[ca1 ch1 cv1 cd1]=wt2(ca,'rbio1.1');
[m1 n1]=size(ch1);
[ca2 ch2 cv2 cd2]=wt2(ca1,'rbio1.1');
[m2 n2]=size(ch2);
[ca3 ch3 cv3 cd3]=wt2(ca2,'rbio1.1');
[m3 n3]=size(ch3);
[ca4 ch4 cv4 cd4]=wt2(ca3,'rbio1.1');
[m4 n4]=size(ch4);
[ca5 ch5 cv5 cd5]=wt2(ca4,'rbio1.1');
[m5 n5]=size(ch5);
[ca6 ch6 cv6 cd6]=wt2(ca5,'rbio1.1');
[m6 n6]=size(ch6);

%Feature extraction
dc=ca6(1,1);
b1=(1/(m6*n6))*sum(sum(ch6.^2));
b2=(1/(m6*n6))*sum(sum(cv6.^2));
b3=(1/(m6*n6))*sum(sum(cd6.^2));

b4=(1/(m5*n5))*sum(sum(ch5.^2));
b5=(1/(m5*n5))*sum(sum(cv5.^2));
b6=(1/(m5*n5))*sum(sum(cd5.^2));

b7=(1/(m4*n4))*sum(sum(ch4.^2));
b8=(1/(m4*n4))*sum(sum(cv4.^2));
b9=(1/(m4*n4))*sum(sum(cd4.^2));

b10=(1/(m3*n3))*sum(sum(ch3.^2));
b11=(1/(m3*n3))*sum(sum(cv3.^2));
b12=(1/(m3*n3))*sum(sum(cd3.^2));

b13=(1/(m2*n2))*sum(sum(ch2.^2));
b14=(1/(m2*n2))*sum(sum(cv2.^2));
b15=(1/(m2*n2))*sum(sum(cd2.^2));

b16=(1/(m1*n1))*sum(sum(ch1.^2));
b17=(1/(m1*n1))*sum(sum(cv1.^2));
b18=(1/(m1*n1))*sum(sum(cd1.^2));

b19=(1/(m*n))*sum(sum(ch.^2));
b20=(1/(m*n))*sum(sum(cv.^2));
b21=(1/(m*n))*sum(sum(cd.^2));




FM67_norm(img_count,1:22)=[(dc/1e+3) (b1/1e+4) (b2/1e+5) (b3/1e+4) (b4/1e+4) (b5/1e+4) (b6/1e+3) (b7/1e+3) (b8/1e+3) (b9/1e+2) (b10/1e+2) (b11/1e+2) (b12/1e+1) (b13/1e+1) (b14/1e+1) (b15/1e+0) (b16/1e+0) (b17/1e+0) (b18/1e-1) (b19/1e-1) (b20/1e-1) (b21)];
FM67(img_count,1:22)=round(FM67_norm(img_count,1:22));
end

save 'FM67.mat';

%Taking mean of age groups




    
