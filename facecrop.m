fd = imageSet('1');

for i = 1:8
    img2 = read(fd(1),i);
    img1 = imrotate(img2,-90);
    img = rgb2gray(img1);
    facedetect = vision.CascadeObjectDetector;
    bb = step(facedetect, img);

    for i = 1:size(bb,1)
        j = imcrop(img,bb(1,:));
    end

    j1 = imresize(j,[112 92]);
    imwrite(j1,strcat(num2str(i),'.png'),'png');
    i

end