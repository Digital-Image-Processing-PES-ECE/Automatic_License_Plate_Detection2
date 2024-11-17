
img = imread(uigetfile('.jpg')); 
grayImg = rgb2gray(img);       % Convert to grayscale
 
denoisedImg = medfilt2(grayImg, [3, 3]); % Using a median filter to reduce noise

sharpenedImg = imsharpen(denoisedImg, 'Radius', 2, 'Amount', 1.5);% sharpening the image to make text clearer

contrastImg = adapthisteq(sharpenedImg, 'ClipLimit', 0.02);%  histogram equalization 

binaryImg = imbinarize(contrastImg, 'adaptive', 'Sensitivity', 0.5);% Converting the image to black and white 

cleanImg = imopen(binaryImg, strel('disk', 1)); % Remove small noise
cleanImg = imclose(cleanImg, strel('disk', 2)); % Fill small gaps

figure;
subplot(3, 3, 1), imshow(img), title('Original Image');
subplot(3, 3, 2), imshow(grayImg), title('Grayscale');
subplot(3, 3, 3), imshow(denoisedImg), title('Denoised');
subplot(3, 3, 4), imshow(sharpenedImg), title('Sharpened');
subplot(3, 3, 5), imshow(contrastImg), title('Contrast Enhanced');


edges = edge(contrastImg, 'Canny'); % Detect edges

filledEdges = imfill(edges, 'holes'); % Filling holes
[labeledImg, ~] = bwlabel(filledEdges); % Label regions
stats = regionprops(labeledImg, 'BoundingBox', 'Area');

[~, idx] = max([stats.Area]); % Getting index of largest region
boundingBox = stats(idx).BoundingBox; % Getting its bounding box
croppedPlate = imcrop(img, boundingBox); % Cropping the number plate

ocrResult = ocr(croppedPlate); % using OCR
licensePlateNumber = ocrResult.Text; % Extracting recognized text

subplot(3, 3, 6)
imshow(img), title('Original Image');
subplot(3, 3, 7)
imshow(croppedPlate), title('Cropped Number Plate');
subplot(3, 3, 8)
text(0.1, 0.5, ['License Plate: ', strtrim(licensePlateNumber)], ...
     'FontSize', 12, 'FontWeight', 'bold', 'Color', 'blue', 'Units', 'normalized');
axis off; 
