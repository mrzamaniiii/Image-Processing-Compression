clc
close all
clear all

%% 1

Q=imread('D:\sunset_sparrow.jpg'); 
I = rgb2gray(Q);
Z = im2double(I);
% ent = entropy(Z)
% imshow(I,[]),title('Image 1')
% imshow(Z,[]),title('Gray Image 3')
% subplot(1,2,1);imshow(I,[]),title('Gray Image 3')
% subplot(1,2,2);imhist(I),title('Histogram Of Image 3')
% ent = entropy(I)


%% 2

% Q=imread('D:\sunset_sparrow.png'); 
% I = rgb2gray(Q);
% histogram_equalization = histeq(I);
% ent = entropy(histogram_equalization)
% subplot(2,2,1);imshow(I,[]),title('Gray Image 3') 
% subplot(2,2,2);imshow(histogram_equalization,[]),title('Equalized Gray Image 3')
% subplot(2,2,3);imhist(I),title('Histogram Of Gray Image 3')
% subplot(2,2,4);imhist(histogram_equalization),title('Histogram Of Equalized Image 3')

%% 3

f=Z;
R11 = mean(mean(f.^2));
g = f(:,2:end); R12 = mean(mean(f(:,1:end-1).*g));
g1 = f(2:end,2:end); R13 = mean(mean(f(1:end-1,1:end-1).*g1));
g2 = f(2:end,:); R14 = mean(mean(f(1:end-1,:).*g2));
g3 = f(1:end-1,2:end); R24 = mean(mean(f(2:end,1:end-1).*g3));

R22=R11;R33=R22;R44=R33;R23=R14;R34=R12;R32=R23;R43=R34;R42=R24;

R=[R22,R23,R24;R32,R33,R34;R42,R43,R44];
P=[R12;R13;R14];
A=(inv(R))*P;
a='f^(m,n) = ';
a1=' f(m,n-1)';
a2=' f(m-1,n-1)';
a3=' f(m-1,n)';
a4='+';

disp([a,num2str(A(1)),a1,num2str(A(2)),a2,a4,num2str(A(3)),a3])

%% 3
[satr,soton] = size(f);
for m=2:satr
    for n=2:soton
        
f1(m,n) =(0.68904)*f(m,n-1)+(-0.38581)*f(m-1,n-1)+(0.69392)*f(m-1,n);
    end
end
e = (f-f1); % f : Tasvir asli ast  e : Error
% f1 = (f1+e);
% e = (f-f1);
entropy = entropy(e)


%% 4

f = ones(3,3)/9;
i=filter2(f,Z);
% n = downsample(i,2);
n = imresize(i,0.5);
h = (Z-i);
ent1 = entropy(h)
subplot(1,2,1);imshow(n),title('Gray Image 1')
subplot(1,2,2);imhist(n),title('Histogram Of Image 1')

%% 4

f1 = ones(3,3)/9;
i1=filter2(f1,n);
% n1 = downsample(i1,2);
n1 = imresize(i1,0.5);
h1 = (n1-i1);
ent2 = entropy(h1)
subplot(1,2,1);imshow(n1),title('Gray Image 1')
subplot(1,2,2);imhist(n1),title('Histogram Of Image 1')


%% 4

f2 = ones(3,3)/9;
i2=filter2(f2,n1);
% n2 = downsample(i2,2);
n2 = imresize(i2,0.5);
h2 = (n2-i2);
ent3 = entropy(h2)
ent4 = entropy(n2)
subplot(1,2,1);imshow(n2),title('Gray Image 1')
subplot(1,2,2);imhist(n2),title('Histogram Of Image 1')


%% 4 calculate

m  = (7.4978)*(512^2)
m1 = (2.5315)*(512^2)
m2 = (2.0598)*(256*512)
m3 = (2.3688)*(128*512)
M = (m+m1+m2+m3)
average = (M/(1028*1028))

%% 5


imwrite(I,'D:\sunset_sparrow.jpg','quality',3);


%% 5

B=imread('D:\sunset_sparrow.jpg'); 
imshow(B,[]),title('Image 3 compression with Quality 3') 

%% 5

ssim_value = ssim(I,B)
[peaksnr, snr] = psnr(I,B);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);

%% 6  SNR

x=[10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85]; %tasvir 1
y=[22.9029 24.3176 25.2063 25.8662 26.3854 26.8233 27.1615 27.5078 27.8047 28.1014 28.4312 28.8052 29.2780 29.7964 30.3584 31.8941];

v=[10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85]; %tasvir 2
d=[23.2618 24.7170 25.7104 26.4955 27.1589 27.7427 28.2229 28.7061 29.1268 29.5548 30.0451 30.6183 31.3210 32.1257 33.2443 34.7502];

k=[10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85]; %tasvir 3
j=[21.4104 22.8688 23.8541 24.6131 25.2704 25.8257 26.2894 26.7493 27.1443 27.5511 28.0200 28.5538 29.2229 29.9707 31.0103 32.3557];

hold on
title('Quality & SNR')
plot(x,y,'g')
plot(v,d,'r')
plot(k,j,'k')
xlabel('Quality') 
ylabel('SNR')
legend('Image 1','Image 2','Image 3')

%% 6 SSIM

x=[10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85];
y=[0.7866 0.8208 0.8424 0.8581 0.8700 0.8798 0.8871 0.8944 0.9005 0.9061 0.9120 0.9187 0.9263 0.9332 0.9405 0.9599];

v=[10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85];
d=[0.8493 0.8845 0.9055 0.9192 0.9294 0.9374 0.9429 0.9481 0.9521 0.9556 0.9596 0.9637 0.9679 0.9719 0.9765 0.9814];

k=[10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85];
j=[0.7973 0.8370 0.8567 0.8708 0.8817 0.8913 0.8975 0.9034 0.9083 0.9127 0.9184 0.9238 0.9306 0.9371 0.9452 0.9548];

hold on
title('Quality & SSIM')
plot(x,y,'g')
plot(v,d,'r')
plot(k,j,'k')
xlabel('Quality') 
ylabel('SSIM')
legend('Image 1','Image 2','Image 3')


%%   3+
Q=imread('D:\sunset_sparrow.jpg'); 
I = rgb2gray(Q);
Z = im2double(I);

%%   3+

Q1=imread('D:\lakebuilding.bmp'); 
I1 = rgb2gray(Q1);
Z1 = im2double(I1);


%%    3+
Q2=imread('D:\sunset_sparrow.png'); 
I2 = rgb2gray(Q2);
Z2 = im2double(I2);

%%     3+

subplot(1,3,1);imshow(Z,[]),title('Gray Image 1') 
subplot(1,3,2);imshow(Z1,[]),title('Gray Image 2')
subplot(1,3,3);imshow(Z2,[]),title('Gray Image 3')
