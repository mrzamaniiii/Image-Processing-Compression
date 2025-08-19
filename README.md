# Image Quality Analysis

This repository provides a comprehensive framework for image preprocessing, compression, and quality evaluation. The core focus is on:

- Entropy-based texture analysis
- Histogram equalization
- Linear predictive modeling
- JPEG compression
- Downsampling and filtering
- Quality evaluation using SSIM (Structural Similarity Index) and PSNR (Peak Signal-to-Noise Ratio)

## Contents

- `project3.ipynb`: Python-based notebook for image processing and metric evaluation.
- `image_analysis.m`: MATLAB script that implements all image analysis stages step-by-step.
- Sample images (not included): `sunset_sparrow.jpg`, `sunset_sparrow.png`, `lakebuilding.bmp`.

## Key Techniques

- RGB to Grayscale conversion
- Histogram Equalization
- Entropy Calculation
- Linear Prediction Coefficients (AR Modeling)
- Downsampling via `imresize`
- JPEG Compression with variable quality factors
