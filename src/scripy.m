out3=[];
err=0;
for j=size(in,1)-9:size(in,1)
        input = in(j,:);
        output = out(j,:);
        [layer_input, layer_output, error,out4] = forward_prop(input,n_neurons,...
            n_layer,input_weight,hidden_weight,output_weight,output);
        err = error^2+err;
        out3 = [out3; out4 output error];
end
err=err/(10*2)