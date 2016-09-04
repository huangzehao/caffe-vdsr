function im_h_y = VDSR_Matconvnet(im_l_y,model,scale,use_cascade)
if use_cascade
    model_scale = 2;
else
    model_scale = scale;
end
iter_all = ceil(log(scale)/log(model_scale));
[lh,lw] = size(im_l_y);
weight = model.weight;
bias = model.bias;
layer_num = size(weight,2);
for iter = 1:iter_all
    fprintf('iter:%d\n',iter);
    im_y = single(imresize(im_l_y,model_scale,'bicubic'));
    convfea = vl_nnconv(im_y,weight{1},bias{1},'Pad',1);
    for i = 2:layer_num
        convfea = vl_nnrelu(convfea);
        convfea = vl_nnconv(convfea,weight{i},bias{i},'Pad',1);
    end
    im_h_y = convfea + im_y;
    im_l_y = im_h_y;
end
if size(im_h_y,1) > lh * scale
   im_h_y = gather(im_h_y);
   im_h_y = imresize(im_h_y,[lh * scale,lw * scale],'bicubic');
end
end