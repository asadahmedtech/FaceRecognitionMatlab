clear all
clc
%% Load Image Information from ATT Face Database Dir ectory
faceDatabase = imageSet('facedata','recursive');

%% Split Database into Training & Test Sets
[training,test] = partition(faceDatabase,[0.8 0.2]);

%% Extract HOG Features for training set 
trainingFeatures = zeros(size(training,2)*training(1).Count,4680);
featureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        trainingFeatures(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabel{featureCount} = training(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = training(i).Description;
end
%% Create 40 class classifier using fitcecoc (40 = number of person)
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);

%% Test Images from Test Set 
person = 1;
queryImage = read(test(person),1);
queryFeatures = extractHOGFeatures(queryImage);
personLabel = predict(faceClassifier,queryFeatures);
% Map back to training set to find identity 
booleanIndex = strcmp(personLabel, personIndex);
integerIndex = find(booleanIndex);

% %% Predicting the location'
% queryImage = read(test(person),j);
%         queryFeatures = extractHOGFeatures(queryImage);
%         personLabel = predict(faceClassifier,queryFeatures);
%         % Map back to training set to find identity
%         booleanIndex = strcmp(personLabel, personIndex);
%         integerIndex = find(booleanIndex);

% %% Test First 5 People from Test Set
% figure;
% figureNum = 1;
% for person=1:5
%     for j = 1:test(person).Count
%         queryImage = read(test(person),j);
%         queryFeatures = extractHOGFeatures(queryImage);
%         personLabel = predict(faceClassifier,queryFeatures);
%         % Map back to training set to find identity
%         booleanIndex = strcmp(personLabel, personIndex);
%         integerIndex = find(booleanIndex);
%         subplot(2,2,figureNum);imshow(imresize(queryImage,3));title('Query Face');
%         subplot(2,2,figureNum+1);imshow(imresize(read(training(integerIndex),1),3));title('Matched Class');
%         figureNum = figureNum+2;
%         integerIndex
%     end
%     figure;
%     figureNum = 1;
% 
% end




%% Finding the index of person from database
personImage = imread('5.pgm');
personFeature = extractHOGFeatures(personImage);
personLabel = predict(faceClassifier,personFeature);
booleanIndex1 = strcmp(personLabel, personIndex);
integerindex = find(booleanIndex1);
mainIndex = find(booleanIndex1);
imshow(personImage);


%% Finding the index and checking from array image
load trees
image = imread('test1.png');
index = 0;
flag = 0;
height = 112;
width = 92;
for i = 0:5
    for j = 0:6
%         x = 1+(i)*width 
%         y = 1+(j)*height
        index = index+1;
        queryImage = imcrop(image, map, [(1+(j)*width) (1+(i)*height) width height]);
        imshow(queryImage);
        queryFeature = extractHOGFeatures(queryImage);
        personLabel = predict(faceClassifier,queryFeature);
        % Map back to training set to find identity
        booleanIndex = strcmp(personLabel, personIndex);
        integerIndex = find(booleanIndex);
        if(integerIndex == mainIndex)
            flag = 1;
            break;
        end
        
    end
    if(flag==1)
        break;
    end
end
index



