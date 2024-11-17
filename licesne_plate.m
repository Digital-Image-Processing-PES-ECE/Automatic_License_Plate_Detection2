% Step 1: Read and preprocess the image
img = imread(uigetfile('.jpg')); % Replace with your image
grayImg = rgb2gray(img);       % Convert to grayscale
% Step 2: Denoise the Image
% Use a median filter to reduce noise
denoisedImg = medfilt2(grayImg, [3, 3]); 

% Step 3: Sharpen the Image
% Enhance the edges to make text clearer
sharpenedImg = imsharpen(denoisedImg, 'Radius', 2, 'Amount', 1.5);

% Step 4: Improve Contrast
% Adaptive histogram equalization for better local contrast
contrastImg = adapthisteq(sharpenedImg, 'ClipLimit', 0.02);

% Step 5: Binarize the Image
% Convert the image to black and white using adaptive thresholding
binaryImg = imbinarize(contrastImg, 'adaptive', 'Sensitivity', 0.5);

% Step 6: Morphological Processing
% Remove small noise and fill gaps in the text
cleanImg = imopen(binaryImg, strel('disk', 1)); % Remove small noise
cleanImg = imclose(cleanImg, strel('disk', 2)); % Fill small gaps

% Step 7: Display the Results
figure;
subplot(3, 3, 1), imshow(img), title('Original Image');
subplot(3, 3, 2), imshow(grayImg), title('Grayscale');
subplot(3, 3, 3), imshow(denoisedImg), title('Denoised');
subplot(3, 3, 4), imshow(sharpenedImg), title('Sharpened');
subplot(3, 3, 5), imshow(contrastImg), title('Contrast Enhanced');


  % Step 2: Detect edges
edges = edge(contrastImg, 'Canny'); % Detect edges

% Step 3: Fill gaps and find regions
filledEdges = imfill(edges, 'holes'); % Fill holes
[labeledImg, ~] = bwlabel(filledEdges); % Label regions
stats = regionprops(labeledImg, 'BoundingBox', 'Area');

% Step 4: Find and crop the largest region
[~, idx] = max([stats.Area]); % Get index of largest region
boundingBox = stats(idx).BoundingBox; % Get its bounding box
croppedPlate = imcrop(img, boundingBox); % Crop the number plate

% Step 5: Perform OCR to extract text from the cropped plate
ocrResult = ocr(croppedPlate); % Perform Optical Character Recognition
licensePlateNumber = ocrResult.Text; % Extract recognized text

% Step 6: Display results
subplot(3, 3, 6)
imshow(img), title('Original Image');
subplot(3, 3, 7)
imshow(croppedPlate), title('Cropped Number Plate');
subplot(3, 3, 8)
text(0.1, 0.5, ['License Plate: ', strtrim(licensePlateNumber)], ...
     'FontSize', 12, 'FontWeight', 'bold', 'Color', 'blue', 'Units', 'normalized');
axis off; % Turn off axis