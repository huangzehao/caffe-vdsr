# Caffe_VDSR
This is a implementation of (["Accurate Image Super-Resolution Using Very Deep Convolutional Networks"](http://arxiv.org/abs/1511.04587)) (CVPR 2016 Oral Paper) in caffe.

# Instruction
VDSR (Very Deep network for Super-Resolution) is an end-to-end network with 20 convolution layers for single image super-resolution. The performance of VDSR is better than other state-of-the-art SISR methods, such as ([SRCNN](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN.html)), ([A+](http://www.vision.ee.ethz.ch/~timofter/ACCV2014_ID820_SUPPLEMENTARY/)) and ([CSCN](http://www.ifp.illinois.edu/~dingliu2/iccv15/)) ([My implementation](https://github.com/huangzehao/SCN_Matlab)).

# Dependencies
Train: Caffe

Test: Matconvnet

# Usage
Train:

1. Place the "Train" folder into "($Caffe_Dir)/examples/", and rename "Train" to "VDSR"

2. Open MATLAB and direct to ($Caffe_Dir)/example/VDSR, run 
"generate_train.m" and "generate_test.m" to generate training and test data.

3. To train VDSR, run
./build/tools/caffe train --solver examples/VDSR/VDSR_solver.prototxt

4. Set clip_gradients in VDSR_solver.prototxt to solve gradient explosion problem

5. Change the learning rate when the error plateaus

Test:


# Performance
