function [psnr,ssim_val]=compute_psnr(im1,im2,shave_border)
if size(im1, 3) == 3,
    im1 = rgb2ycbcr(im1);
    im1 = im1(:, :, 1);
end

if size(im2, 3) == 3,
    im2 = rgb2ycbcr(im2);
    im2 = im2(:, :, 1);
end

imdff = double(im1) - double(im2);
if shave_border > 0
    imdff = shave(imdff,[shave_border,shave_border]);
end
imdff = imdff(:);
im1 = shave(im1,[shave_border,shave_border]);
im2 = shave(im2,[shave_border,shave_border]);
ssim_val = ssim_index(im1,im2);
rmse = sqrt(mean(imdff.^2));
psnr = 20*log10(255/rmse);