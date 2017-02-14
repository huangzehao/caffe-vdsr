close all;
clear all;

run matconvnet/matlab/vl_setupnn;

addpath('utils')

load('VDSR_Official.mat');
%load('VDSR_Adam.mat');
use_cascade = 0;

use_gpu = 0;
up_scale = 3;
shave = 1;

im_gt = imread('./Data/Set5/butterfly_GT.bmp');

if use_gpu
    for i = 1:20
        model.weight{i} = gpuArray(model.weight{i});
        model.bias{i} = gpuArray(model.bias{i});
    end
end

im_gt = modcrop(im_gt,up_scale);
im_l = imresize(im_gt,1/up_scale,'bicubic');
im_gt = double(im_gt);
im_l  = double(im_l) / 255.0;

[H,W,C] = size(im_l);
if C == 3
    im_l_ycbcr = rgb2ycbcr(im_l);
else
    im_l_ycbcr = im_l;
end
im_l_y = im_l_ycbcr(:,:,1);
if use_gpu
    im_l_y = gpuArray(im_l_y);
end
tic;
im_h_y = VDSR_Matconvnet(im_l_y, model,up_scale,use_cascade);
toc;
if use_gpu
    im_h_y = gather(im_h_y);
end
im_h_y = im_h_y * 255;
im_h_ycbcr = imresize(im_l_ycbcr,up_scale,'bicubic');
if C == 3
    im_b = ycbcr2rgb(im_h_ycbcr) * 255.0;
    im_h_ycbcr(:,:,1) = im_h_y / 255.0;
    im_h  = ycbcr2rgb(im_h_ycbcr) * 255.0;
else
    im_h = im_h_y;
    im_b = im_y_cbcr * 255.0;
end

figure;imshow(uint8(im_b));title('Bicubic Interpolation');
figure;imshow(uint8(im_h));title('SR Reconstruction');
figure;imshow(uint8(im_gt));title('Origin');

if shave == 1;
    shave_border = round(up_scale);
else
    shave_border = 0;
end

sr_psnr = compute_psnr(im_h,im_gt,shave_border);
bi_psnr = compute_psnr(im_b,im_gt,shave_border);
fprintf('sr_psnr: %f dB\n',sr_psnr);
fprintf('bi_psnr: %f dB\n',bi_psnr);
