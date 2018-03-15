function psnr = PSNR(img1, img2)

img1 = double(max(min(img1(:),255),0));
img2 = double(max(min(img2(:),255),0));

psnr = 10*log10(255*255/mean((img1-img2).^2));