clear alll
clc

det = vision.CascadeObjectDetector;
% select the image montage
img = imread('test1.png');

bb = step(det, img);

figure;
imshow(img);hold on

for i = 1:size(bb,1)
    rectangle('Position',bb(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
    j = imcrop(img,bb(i,:));
    imwrite(j,strcat(num2str(i),'.png'),'png');
end

hold off;
