# Automatic License Plate Detection


### Project Description:
#### Summary - 
Automatic License Plate Detection is an innovative application of image processing and computer vision, designed to identify and extract license plates from vehicle images. Using MATLAB, this project leverages advanced techniques such as edge detection, region filtering, and Optical Character Recognition (OCR) to accurately locate and read license plate numbers. This technology has wide-ranging applications in traffic monitoring, security systems, and automated toll collection, streamlining processes and enhancing efficiency.
#### Course concepts used - 
1. Grayscale Conversion - Simplifies processing by reducing the image to intensity information.
2. Noise Reduction - Median filtering removes noise while preserving edges.
3. Image Sharpening - Enhances edges for better text clarity.
4. Contrast Enhancement - Adaptive histogram equalization improves local contrast.
5. 5.Binarization - Adaptive thresholding converts the image to black and white.
6. Morphological Processing - Opening removes noise, and closing fills gaps.
7. Edge Detection - Canny edge detection identifies prominent edges.

   
#### Additional concepts used -
1.Region Labeling and Analysis - Identifies and isolates the license plate region.

2.Optical Character Recognition (OCR) - Extracts text from the processed image.
   
#### Dataset - 
Link and/or Explanation if generated

#### Novelty - 
1. - Identifying and reading license plates under unfavorable weather conditons
2. -Enhanced Accuracy: The use of sharpening and morphological processing improves OCR accuracy, even in noisy or low-quality images.
   
### Contributors:
1.Tanavi V R (PES1UG22EC309)

2.Vallakki Vasisht (PES1UG22EE083)

3.Areeb Mohammed Khan (PES1UG22EC045)

### Steps:
1. Clone Repository
```git clone https://github.com/Digital-Image-Processing-PES-ECE/project-name.git ```

2. Install Dependencies
```pip install -r requirements.txt```

3. Run the Code
```python main.py (for eg.)```

### Outputs:
* Important intermediate steps
* Final output images 

### References:
1. - https://ieeexplore.ieee.org/document/7919542
2. - https://www.ripublication.com/ijcir17/ijcirv13n9_10.pdf
   
### Limitations and Future Work:

Limitations:
Lighting Sensitivity: Performance is affected by poor lighting or shadows, leading to partial or incorrect OCR results.
Image Quality: Low-resolution or blurry images reduce text recognition accuracy.
Complex Backgrounds: Busy backgrounds may interfere with edge detection and morphological processing.
Noise Sensitivity: Excessive noise can lead to false detections or poor segmentation.
Limited Font Recognition: Works best with standard fonts; decorative or worn-out license plates may pose challenges. 

Future work:
Advanced Preprocessing: Integrate deep learning models for better image enhancement and noise reduction.
Robust OCR Models: Use more sophisticated OCR tools like Tesseract with pre-trained models for better recognition.
Automated Detection: Implement machine learning algorithms for automatic license plate detection without manual parameter tuning.
Real-time Processing: Optimize the code for real-time video analysis for applications in traffic monitoring.
Multilingual Support: Extend the system to read plates in various languages and fonts for broader applicability. 



