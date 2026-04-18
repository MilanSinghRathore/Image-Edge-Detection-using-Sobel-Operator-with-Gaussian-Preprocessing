# Image Edge Detection using Sobel Operator with Gaussian Preprocessing

##  Overview

This project implements image edge detection using the Sobel operator with Gaussian preprocessing. The input image is first processed in MATLAB to generate pixel data, which is then stored in pixel memory. The design applies Gaussian filtering to reduce noise, followed by Sobel edge detection to extract edges. Finally, the processed pixel data is reconstructed into an output image.

---

##  Design Flow

1. Input image is processed using MATLAB
2. Pixel values are stored in memory
3. Gaussian filter is applied for noise reduction
4. Sobel operator detects edges (horizontal & vertical gradients)
5. Processed pixels are converted back into an image

---

##  Block Diagram

### Text Representation:

```id="bd1"
Input Image (MATLAB) 
        ↓
Pixel Memory
        ↓
Gaussian Filter
        ↓
Sobel Edge Detection
        ↓
Pixel to Image Conversion
        ↓
Output Edge Image
```

---


---

##  Features

* Noise reduction using Gaussian filtering
* Edge detection using Sobel operator
* Pixel-based processing suitable for hardware implementation
* MATLAB preprocessing and visualization

---

##  Tools Used

* MATLAB
* Verilog HDL
* Xilinx Vivado

---

##  Applications

* Computer Vision
* Object Detection
* Image Processing Systems
* Feature Extraction

---

##  Future Improvements

* Real-time FPGA implementation
* Use of advanced filters (Canny, Laplacian)
* Optimization for high-speed processing

---

##  Author

**Milan Singh Rathore**
