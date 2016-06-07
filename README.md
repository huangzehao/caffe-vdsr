# Caffe_VDSR
This is a implementation of ["Accurate Image Super-Resolution Using Very Deep Convolutional Networks"](http://arxiv.org/abs/1511.04587) (CVPR 2016 Oral Paper) in caffe.

## Instruction
VDSR (Very Deep network for Super-Resolution) is an end-to-end network with 20 convolution layers for single image super-resolution. The performance of VDSR is better than other state-of-the-art SISR methods, such as [SRCNN](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN.html), [A+](http://www.vision.ee.ethz.ch/~timofter/ACCV2014_ID820_SUPPLEMENTARY/) and [CSCN](http://www.ifp.illinois.edu/~dingliu2/iccv15/) ([My implementation of CSCN](https://github.com/huangzehao/SCN_Matlab)).

## Dependencies
### Train
- [Caffe](http://caffe.berkeleyvision.org/)

### Test
- [MatConvNet](http://www.vlfeat.org/matconvnet/)

## Usage
### Train

1. Place the "Train" folder into "($Caffe_Dir)/examples/", and rename "Train" to "VDSR"

2. Open MATLAB and direct to ($Caffe_Dir)/example/VDSR, run 
"generate_train.m" and "generate_test.m" to generate training and test data. (Code from SRCNN)

3. To train VDSR, run
./build/tools/caffe train --solver examples/VDSR/VDSR_solver.prototxt

4. Set clip_gradients in VDSR_solver.prototxt to solve gradient explosion problem, 0.1 or 1 is a good choice

5. Change the learning rate when the error plateaus

### Test

1. "Demo_SR_Conv.m" is a simple test code. Just run it and you will get the result.

2. "VDSR_170000.mat" is a model trained by myself.

## Different from original paper
Because of the limitation of hardware conditions，I didn't do completed training. So there are some differences between this implementation and original paper.
### Training Dataset
This implementation: 91 images (with data augumentation and only factor 2) 

Original paper: 291 images (with data augumentation and factor 2, 3 and 4)
### Multi scale
This implementation: Casade of 2x to generate 3x and 4x result

Original paper: Multi scale in one model
### Training Time of Final Model
This implementation: about 30 epoch

Original paper: about 80 epoch
## Performance in PSNR
### Factor 2
| DataSet        | Original          | This Implementation  |
| ------------- |:-------------:| -----:|
| Set5      | 37.53      | 37.46 |
| Set14     | 33.03      | 32.83|
| BSD100    | 31.90      | 31.65 |
### Factor 3
| DataSet        | Original          | This Implementation  |
| ------------- |:-------------:| -----:|
| Set5      | 33.66      | 33.52 |
| Set14     | 29.77      | 29.55 |
| BSD100    | 28.82      | 28.62 |
### Factor 4
| DataSet        | Original          | This Implementation  |
| ------------- |:-------------:| -----:|
| Set5      | 31.35      | 31.14 |
| Set14     | 28.01      | 27.81 |
| BSD100    | 27.29      | 27.13 |
## TODO
1. Add Super-resolution image results
2. Complete experiments

## References
Please cite [1] if you use this code in your work, thank you!

[1] Jiwon Kim, Jung Kwon Lee, Kyoung Mu Lee, Accurate Image Super-Resolution Using Very Deep Convolutional Networks, arXiv:1511.04587, 2015
