load trees
image = imread('test.png');
j1 = imresize(image,[672 644]);
imwrite(j1,'test1.png','png');
image = imread('test1.png');
index = 0;
flag = 0;
height = 112;
width = 92;
index = index + 1;
queryImage = imcrop(image, map, [6*width 5*height width height]);
imshow(queryImage);