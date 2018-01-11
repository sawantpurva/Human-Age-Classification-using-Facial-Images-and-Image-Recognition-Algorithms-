clc;
clear all;
tic
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
I= imresize(I2,[192,256]);
I = im2double(I);
T = dctmtx(8);
fun = @(block_struct) T .* block_struct.data .* T';
B = blockproc(I,[8 8],fun);
mask = [1   1   1   1   1   1   1   1
        1   1   1   1   1   1   1   1
        1   1   1   1   1   1   0   0
        1   1   1   1   1   0   0   0
        1   1   1   1   1   1   1   0
        1   1   1   0   1   1   0   0
        1   1   0   0   1   0   0   0
        1   1   0   0   0   0   0   0];
fun1= @(block_struct) mask .* block_struct.data;    
B2 = blockproc(B,[8 8],fun1);
fun2 = @(block_struct) T'.* block_struct.data .* T;
I2 = blockproc(B2,[8 8],fun2);
[a b] = size(B2);
 c=8;d=8;   %----------------- reshape it into 8*8

% 50 x 9 feature matrix extraction

%1st feature column
l=0;
m=0;
for i=1:c:a-7
  for j=1:d:b-7
    C=B2((i:i+7),(j:j+7));
    eval(['out_' num2str(l) '=C']);
    m=C(1,1)+m;
    l=l+1;
    end
end 
ans1=(m/788);
 
%2nd feature column 
l=0;
 	m1=0;
 for i=1:c:a-7
   for j=1:d:b-7
     C=B2((i:i+7),(j:j+7));
     eval(['out_' num2str(l) '=C']);
     m1=C(1,2)+C(2,1)+C(1,3)+C(2,2)+C(3,1)+m1;
     l=l+1;
    end
 end 
 ans2=(m1/788);
 
%3rd feature column
l=0;
m2=0;
for i=1:c:a-7
  for j=1:d:b-7
    C=B2((i:i+7),(j:j+7));
    eval(['out_' num2str(l) '=C']);
    m2=C(4,1)+C(3,2)+C(3,3)+C(4,2)+C(1,5)+C(1,4)+C(5,1)+C(2,3)+C(2,4)+m2;
    l=l+1;
    end
end 
ans3=(m2/788);
 
%4th feature column
l=0;
m3=0;
for i=1:c:a-7
  for j=1:d:b-7     
    C=B2((i:i+7),(j:j+7));
    eval(['out_' num2str(l) '=C']);    
    m3=C(7,1)+C(6,1)+C(6,2)+C(5,3)+C(4,3)+C(3,4)+C(4,4)+C(2,5)+C(1,6)+C(2,6)+C(5,2)+C(3,5)+C(1,7)+m3;  
    l=l+1;
  end
end 
ans4=(m3/788);
 
%5th feature column
 	l=0;
m4=0;
 for i=1:c:a-7
   for j=1:d:b-7     
   C=B2((i:i+7),(j:j+7));
   eval(['out_' num2str(l) '=C']);
   m4=C(2,1)+C(3,1)+C(4,1)+C(5,1)+C(6,1)+C(7,1)+C(8,1)+m4;
   l=l+1;
   end
 end 
 ans5=(m4/788);

%6th feature column
      l=0;
m5=0;
 for i=1:c:a-7
   for j=1:d:b-7   
     C=B2((i:i+7),(j:j+7));
     eval(['out_' num2str(l) '=C']);
     m5= C(3,2)+C(4,2)+C(5,2)+C(6,2)+C(7,2)+C(8,2)+m5;
     l=l+1;  
     end
 end 
ans6=(m5/788);
 

 %7th feature column
      l=0;
m6=0;
 for i=1:c:a-7
   for j=1:d:b-7    
     C=B2((i:i+7),(j:j+7));
     eval(['out_' num2str(l) '=C']);
     m6=C(1,2)+C(1,3)+C(1,4)+C(1,5)+C(1,6)+C(1,7)+C(1,8)+m6;
     l=l+1;
     end
 end 
 ans7=(m6/788);

 %8th feature column 
      l=0;
m7=0;
 for i=1:c:a-7
   for j=1:d:b-7   
     C=B2((i:i+7),(j:j+7));
     eval(['out_' num2str(l) '=C']);
     m7=C(2,3)+C(2,4)+C(2,5)+C(2,6)+C(2,7)+C(2,8)+m7;
     l=l+1; 
     end
 end 
 ans8=(m7/788);

 %9th feature column
      l=0;
m8=0;
 for i=1:c:a-7
   for j=1:d:b-7   
   C=B2((i:i+7),(j:j+7));
   eval(['out_' num2str(l) '=C']);
m8=C(2,2)+C(3,3)+C(3,4)+C(4,3)+C(4,4)+C(4,5)+C(5,4)+C(5,5)+C(5,6)+C(5,7)+C(6,5)+C(6,6)+C(7,5)+m8;
   l=l+1;
   end
 end 
 ans9=(m8/788);

% 50 x 10 feature matrix

 DB(img_count,1:9)=[(ans1*1e+2) (ans2*1e+1) (ans3*1e+1) (ans4*1e+1) (ans5*1e+1) (ans6*1e+1) (ans7*1e+1) (ans8*1e+1) (ans9*1e+1)]
 DB9(img_count,1:9)=round(DB(img_count,1:9));
end
 
 save 'DB9.mat';
toc
 

 
 

 
 

 
