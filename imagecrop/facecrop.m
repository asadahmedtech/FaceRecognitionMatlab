clear all
clc

fd = imageSet('imagetocrop');

for i = 1:12
    img = read(fd(1),i);
%     img1 = imrotate(img2,-90);
     j = rgb2gray(img);

    j1 = imresize(j,[112 92]);
    imwrite(j1,strcat(num2str(i),'.png'),'png');
    
end
