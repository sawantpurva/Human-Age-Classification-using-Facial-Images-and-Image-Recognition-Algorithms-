
function i=gaus(f)




%f1=imread('lena.bmp');
%f=rgb2gray(f1);
[m n]=size(f);

% pre
for x=1:m
    for y=1:n
        f2(x,y)=(((-1)^(x+y))*f(x,y));
    end
end

F=fft2(f2);
p=2;
D0=50;
for u=1:m
    for v=1:n
        D(u,v)=sqrt(((u-(m/2))^2)+((v-(m/2))^2));
        H(u,v)=exp(-((D(u,v)^2)/(2*D0^2)));
    end
end
Y=F.*H;

y1=ifft2(Y);

for x=1:m
    for y=1:n
        y2(x,y)=((-1)^(x+y))*real(y1(x,y));
    end
end

%Pr=(1/(m*n))*(sum(sum(real(F.^2))))
%Pt=(1/(m*n))* sum(sum(real(Y.^2)))

%subplot(3,2,1);
%imshow(f);

%subplot(3,2,2);
%imshow(y1,[]);

%subplot(3,2,3);
%imshow(log(1+abs(F)),[]);

%subplot(3,2,4);
%imshow(H,[]);

%subplot(3,2,5);
%imshow(log(1+abs(Y)),[]);

%subplot(3,2,6);
%imshow(y2,[]);



