caffe.reset_all();
clear all;close all;
addpath './matlab'
caffe.set_mode_gpu();
caffe.set_device(0);
modelpath = 'examples/VDSR/Model/_iter_170000.caffemodel';
modelsave = 'VDSR_170000.mat';
model_prototxt = 'examples/VDSR/VDSR_net_deploy.prototxt';

net = caffe.Net(model_prototxt,modelpath,'test');
for ii = 1:20
  model.weight{ii} = net.layers(['conv',num2str(ii)]).params(1).get_data();
  model.bias{ii} = net.layers(['conv',num2str(ii)]).params(2).get_data();
end

save(modelsave,'model');
caffe.reset_all();
