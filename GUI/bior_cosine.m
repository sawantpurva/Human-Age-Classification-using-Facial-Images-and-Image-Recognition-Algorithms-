clc;
clear all;

%taking query image
 img1=1;   
temp1=(num2str(img1));
img2=[temp1 '.jpg'];
I1 = imread(img2);
[rows columns numberOfColorChannels] = size(I1);
if numberOfColorChannels > 1
  I2 = rgb2gray(I1);
else
  I2 = I1; % It's already gray.
end
%I2= rgb2gray(I1);
I=imresize(I2,[256,256]);
%I=gau(I3);
%[m n]=size(I3);

%Wavelet transform

[ca ch cv cd]=wt2(I,'bior1.1');
[m n]=size(ch);
[ca1 ch1 cv1 cd1]=wt2(ca,'bior1.1');
[m1 n1]=size(ch1);
[ca2 ch2 cv2 cd2]=wt2(ca1,'bior1.1');
[m2 n2]=size(ch2);
[ca3 ch3 cv3 cd3]=wt2(ca2,'bior1.1');
[m3 n3]=size(ch3);
[ca4 ch4 cv4 cd4]=wt2(ca3,'bior1.1');
[m4 n4]=size(ch4);
[ca5 ch5 cv5 cd5]=wt2(ca4,'bior1.1');
[m5 n5]=size(ch5);
[ca6 ch6 cv6 cd6]=wt2(ca5,'bior1.1');
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

Q1_gau(img1,1:22)=[(dc/1e+1) (b1/1e+3) (b2/1e+3) (b3/1e+2) (b4/1e+2) (b5/1e+3) (b6/1e+2) (b7/1e+2) (b8/1e+2) (b9/1e+1) (b10/1e+1) (b11/1e+1) (b12/1) (b13/1) (b14/1) (b15/1e-1) (b16/1e-1) (b17/1e-1) (b18/1e-2) (b19/1e-2) (b20/1e-2) (b21/1e-3)];
Q1(img1,1:22)=round(Q1_gau(img1,1:22));
%Taking mean of age groups

load ('FM52.mat');
c1=round((1/40)*(sum(FM52(1:40,:))));
c2=round((1/40)*(sum(FM52(41:80,:))));
c3=round((1/40)*(sum(FM52(81:120,:))));
c4=round((1/40)*(sum(FM52(121:160,:))));
c5=round((1/40)*(sum(FM52(161:200,:))));
c6=[c1;
    c2;
    c3;
    c4;
    c5];
%classifier
count1=0;
count2=0;
count3=0;
count4=0;
count5=0;

counter1=0;
counter2=0;
counter3=0;
counter4=0;
counter5=0;
 a=Q1(1,1:22);
 b={ 'Child' ;
        'Teen';
        'Young';
        'Middle aged';
        'Old aged'};
 Age3=knnclassify(a,c6,b,1,'cosine');