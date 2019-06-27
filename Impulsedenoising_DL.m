close all
clear all
clc
%%
% Read Data

X1 = imread('barbara.png');  % Read Image

X = imresize(X1,0.5);  % Resize to 50%

X = im2double(X);  % Convert to Double

X_noisy = imnoise(X,'salt & pepper',0.1);   % ADD NOISE

RX = imgpatch(X_noisy);   % TAKE PATCHES


%%
% Initialize Parameters

numOfAtoms = 10;
iterations = 20;
thres = 0.1;

%%
%initialization

[D,Z] =  Dict_Learning (RX, numOfAtoms, iterations);

A = (RX - D*Z);
Y = wthresh(A,'s',thres);
x_out = RX- Y;
%    
%%

for i = 1 : 20
%P1
    [D,Z] =  Dict_Learning (x_out, numOfAtoms, iterations);

    A = (RX - D*Z);
    Y = wthresh(A,'s',thres);
    x_out = RX- Y;
%             norm(Y,'fro');
end


x_out1 = imback(x_out);   % Convert back to Image


%%
% Visualize Image

imshow(X);
title('Original Image');
figure;

imshow(X_noisy)
title('Noisy Image');
figure;

imshow(x_out1);
title('Recovered Image');


%%
err = immse(X, x_out1);  % mean square error

psnr_recon = psnr(X,abs(x_out1));  % Peak signal to noise ratio
psnr_noisy = psnr(X, X_noisy);

ssim_recon = ssim(X,abs(x_out1));  % structural similarity
ssim_noisy = ssim(X, X_noisy);

fprintf('error is %f',(norm(X-x_out1)/norm(X)));

fprintf('\n psnr of reconstructed image is %f', psnr_recon);
fprintf('\n psnr of noisy image is %f', psnr_noisy);

fprintf('\n ssim of reconstructed image is %f', ssim_recon);
fprintf('\n ssim of noisy image is %f', ssim_noisy);


   