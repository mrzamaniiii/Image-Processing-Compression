# 📷 Image Processing in MATLAB

This project implements several core techniques in grayscale image processing using MATLAB, including:

- Entropy analysis  
- Histogram equalization  
- Linear image prediction  
- Multi-level low-pass filtering with downsampling  
- JPEG compression assessment using SSIM and PSNR  
- Visualization of SNR and SSIM vs. JPEG quality

---

## 🧪 Functional Overview

### 1. 🔍 Entropy Analysis
Calculates the entropy of multiple grayscale images to evaluate their information content before and after histogram equalization.

### 2. 🧰 Histogram Equalization
Applies `histeq()` to enhance contrast and observes changes in image histogram and entropy.

### 3. 🧠 Linear Prediction Modeling
Estimates current pixel values using previous neighbors with a 3-coefficient linear model. Computes entropy of the residual (prediction error).

### 4. 🔽 Multi-level Downsampling
Applies a 3x3 average filter followed by `imresize()` (downsampling) across three levels, computing entropy at each level and of the final transmitted image.

### 5. 🗜️ JPEG Compression Evaluation
Saves the image using different JPEG quality settings and evaluates the quality using:
- **SSIM (Structural Similarity Index)**
- **PSNR (Peak Signal-to-Noise Ratio)**

### 6. 📊 Quality Metric Visualization
Plots:
- **Quality vs. SNR**  
- **Quality vs. SSIM**  
For three different test images.

---

## 📁 Files Overview

| Section | Description |
|--------|-------------|
| `Section 1` | Reads and converts image to grayscale, computes initial entropy |
| `Section 2` | Performs histogram equalization and compares entropy |
| `Section 3` | Predicts pixel values using linear modeling and computes residual entropy |
| `Section 4` | Applies 3-level low-pass filtering with downsampling and computes entropy |
| `Section 5` | Saves compressed JPEG image and evaluates with SSIM/PSNR |
| `Section 6` | Plots SNR & SSIM against JPEG quality |

---

## ▶️ How to Run

1. Replace the file paths (`D:\sunset_sparrow.jpg`, etc.) with your own image paths.
2. Run the code in MATLAB section by section.
3. Observe results in the command window and plots.

> 📝 Required: Image Processing Toolbox

---

## 📊 Sample Output Metrics

| Image | Entropy | Entropy after Equalization |
|-------|---------|-----------------------------|
| Image 1 | 7.2783 | 5.9711 |
| Image 2 | 7.7249 | 5.9767 |
| Image 3 | 7.4978 | 5.9640 |

> ✅ SSIM increases with quality  
> ✅ Entropy decreases after equalization and downsampling  
> ✅ Linear prediction reduces redundancy in images
