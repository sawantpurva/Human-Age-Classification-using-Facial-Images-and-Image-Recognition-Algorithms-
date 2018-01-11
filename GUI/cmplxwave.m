%main code

clear all;
clc;
clc;clear all;
%Taking images and doing block processingfor 
for img_count=1:200     
temp=(num2str(img_count));
img=[temp '.jpg'];
I1 = imread(img);
I2=(double(I1));
[rows columns numberOfColorChannels] = size(I2);
if numberOfColorChannels > 1
  I3 = rgb2gray(I2);
else
  I3 = I2; % It's already gray.
end



%s=rgb2gray(double(imread('abc.png')));

I= imresize(I3,[256,256]);




[af, sf] = dualfilt1;
[Faf, Fsf] = FSfarras;

w = cplxdual2D(I, 1, Faf, af);

b1=w{1,1}{1,1}{1,1}{1,1};
[m1 n1]=size(b1);
b2=w{1,1}{1,1}{1,1}{1,2};
[m2 n2]=size(b2);
b3=w{1,1}{1,1}{1,1}{1,3};
[m3 n3]=size(b3);
b4=w{1,1}{1,1}{1,2}{1,1};
[m4 n4]=size(b4);
b5=w{1,1}{1,1}{1,2}{1,2};
[m5 n5]=size(b5);
b6=w{1,1}{1,1}{1,2}{1,3};
[m6 n6]=size(b6);
b7=w{1,1}{1,2}{1,1}{1,1};
[m7 n7]=size(b7);
b8=w{1,1}{1,2}{1,1}{1,2};
[m8 n8]=size(b8);
b9=w{1,1}{1,2}{1,1}{1,3};
[m9 n9]=size(b9);
b10=w{1,1}{1,2}{1,2}{1,1};
[m10 n10]=size(b10);
b11=w{1,1}{1,2}{1,2}{1,2};
[m11 n11]=size(b11);
b12=w{1,1}{1,2}{1,2}{1,3};

[m12 n12]=size(b12);
d1=w{1,2}{1,1}{1,1};
[m13 n13]=size(d1);
d2=w{1,2}{1,1}{1,2};
[m14 n14]=size(d2);
d3=w{1,2}{1,2}{1,1};
[m15 n15]=size(d3);
d4=w{1,2}{1,2}{1,2};
[m16 n16]=size(d4);

s1=abs((1/(m1*n1))*sum(sum(b1)));
s2=abs((1/(m2*n2))*sum(sum(b2)));
s3=abs((1/(m3*n3))*sum(sum(b3)));

s4=abs((1/(m4*n4))*sum(sum(b4)));
s5=abs((1/(m5*n5))*sum(sum(b5)));
s6=abs((1/(m6*n6))*sum(sum(b6)));

s7=abs((1/(m7*n7))*sum(sum(b7)));
s8=abs((1/(m8*n8))*sum(sum(b8)));
s9=abs((1/(m9*n9))*sum(sum(b9)));

s10=abs((1/(m10*n10))*sum(sum(b10)));
s11=abs((1/(m11*n11))*sum(sum(b11)));
s12=abs((1/(m12*n12))*sum(sum(b12)));

s13=abs((1/(m13*n13))*sum(sum(d1)));
s14=abs((1/(m14*n14))*sum(sum(d2)));
s15=abs((1/(m15*n15))*sum(sum(d3)));
s16=abs((1/(m16*n16))*sum(sum(d4)));


DB(img_count,1:16)=[s1 s2 s3 s4  s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16];

end
save 'DB.mat';