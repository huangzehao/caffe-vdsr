Caffe_VDSR
==============
This is an implementation of ["Accurate Image Super-Resolution Using Very Deep Convolutional Networks"](http://cv.snu.ac.kr/research/VDSR/) (CVPR 2016 Oral Paper) in caffe.

Instruction
-------
VDSR (Very Deep network for Super-Resolution) is an end-to-end network with 20 convolutional layers for single image super-resolution. The performance of VDSR is better than other state-of-the-art SISR methods, such as [SRCNN](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN.html), [A+](http://www.vision.ee.ethz.ch/~timofter/ACCV2014_ID820_SUPPLEMENTARY/) and [CSCN](http://www.ifp.illinois.edu/~dingliu2/iccv15/) ([My implementation of CSCN](https://github.com/huangzehao/SCN_Matlab)).

Update
-------
### Multi-Scale Training
Add multi-scale implementation (you can test different scales super-resolution in only one model). The model trained by myself yields similar performances with original paper!
### Data Augumentation
Add codes of data augumentation.
### Solver Setting
Use Adam instead of SGD. 80 epochs is enough.
### VDSR Official Model
Recommend to use "VDSR_Official.mat" if you just want to do some test.

Dependencies
-------
### Train
- [Caffe](http://caffe.berkeleyvision.org/)

### Test
- [MatConvNet](http://www.vlfeat.org/matconvnet/)

Usage
-------
### Train

1. Place the "Train" folder into "($Caffe_Dir)/examples/", and rename "Train" to "VDSR"

2. Download training data from [291](http://cv.snu.ac.kr/research/VDSR/train_data.zip) 

3. Open MATLAB and direct to ($Caffe_Dir)/example/VDSR, run "data_aug.m" to do data augumentation, 
and then run "generate_train.m" and "generate_test.m" to generate training and test data (Code from SRCNN)

4. To train VDSR, run
./build/tools/caffe train --solver examples/VDSR/VDSR_solver.prototxt

5. After training, run "caffemodel2mat.m" to convert caffemodel to mat for testing (matcaffe is required)

### Test

1. "Demo_SR_Conv.m" is a simple test code. Just run it and you will get the result

2. "VDSR_Adam.mat" is a model trained by myself

3. "VDSR_Official.mat" is an official model converted from [Official Test Code](http://cv.snu.ac.kr/research/VDSR/)

Performance in PSNR
-------
### Factor 2
| DataSet        | VDSR_Official          | VDSR_Adam |
| ------------- |:-------------:| -----:|
| Set5      | 37.53      | 37.58 |
| Set14     | 33.03      | 33.00|
| BSD100    | 31.90      | 31.87 |
### Factor 3
| DataSet        | VDSR_Official          | VDSR_Adam |
| ------------- |:-------------:| -----:|
| Set5      | 33.66      | 33.68 |
| Set14     | 29.77      | 29.75 |
| BSD100    | 28.82      | 28.80 |
### Factor 4
| DataSet        | VDSR_Official          | VDSR_Adam |
| ------------- |:-------------:| -----:|
| Set5      | 31.35      | 31.33 |
| Set14     | 28.01      | 27.95 |
| BSD100    | 27.29      | 27.24 |

References
-------
Please cite [1] and this repository if you use this code in your work, thank you!

[1] Jiwon Kim, Jung Kwon Lee and Kyoung Mu Lee, "Accurate Image Super-Resolution Using Very Deep Convolutional Networks", Proc. of IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2016
