function [LL LH HL HH]=wt2(a1,w)

%a=imread('1.jpg');
%a1=rgb2gray(a);

[m n]=size(a1);

[ld hd lr hr]=wfilters(w);


z=zeros(1,m-length(ld));
ld1=[ld z];
hd1=[hd z];

for x=1:m
   % for y=1:n
        temp=a1(x,:);
        temp1=cconv(temp,ld1,m);
        out(x,:)=temp1;
   % end
end

out1=dyaddown(out,'c');
out2=out1';

for x=1:m/2
   % for y=1:n
        temp=out2(x,:);
        temp1=cconv(temp,ld1,m);
        out3(x,:)=temp1;
   % end
end

out4=dyaddown(out3,'c');
LL=out4';




%b=imread('1.jpg');
%b1=rgb2gray(b);

[m1 n1]=size(a1);

[ld hd lr hr]=wfilters(w);


z=zeros(1,m1-length(ld));
ld2=[ld z];
hd2=[hd z];

for x=1:m1
   % for y=1:n1
        temp=a1(x,:);
        temp1=cconv(temp,ld2,m1);
        out_a(x,:)=temp1;
   % end
end

out1a=dyaddown(out_a,'c');
out2a=out1a';

for x=1:m1/2
   % for y=1:n1
        temp=out2a(x,:);
        temp1=cconv(temp,hd2,m1);
        out3a(x,:)=temp1;
   % end
end

out4a=dyaddown(out3a,'c');
LH=out4a';





%c=imread('1.jpg');
%c1=rgb2gray(c);

[m2 n2]=size(a1);

[ld hd lr hr]=wfilters(w);


z=zeros(1,m2-length(ld));   
ld3=[ld z];
hd3=[hd z];

for x=1:m2
   % for y=1:n2
        temp=a1(x,:);
        temp1=cconv(temp,hd3,m2);
        out_b(x,:)=temp1;
   % end
end

out1b=dyaddown(out_b,'c');
out2b=out1b';

for x=1:m2/2
   % for y=1:n2
        temp=out2b(x,:);
        temp1=cconv(temp,ld3,m2);
        out3b(x,:)=temp1;
   % end
end

out4b=dyaddown(out3b,'c');
HL=out4b';




%d=imread('1.jpg');
%d1=rgb2gray(d);

[m3 n3]=size(a1);

[ld hd lr hr]=wfilters(w);


z=zeros(1,m3-length(ld));
ld4=[ld z];
hd4=[hd z];

for x=1:m3
   % for y=1:n3
        temp=a1(x,:);
        temp1=cconv(temp,hd4,m3);
        out_c(x,:)=temp1;
   % end
end

out1c=dyaddown(out_c,'c');
out2c=out1c';

for x=1:m3/2
   % for y=1:n3
        temp=out2c(x,:);
        temp1=cconv(temp,hd4,m3);
        out3c(x,:)=temp1;
   % end
end

out4c=dyaddown(out3c,'c');
HH=out4c';



