function [layer_input, layer_output, error,out] = forward_prop(input,n_neurons,...
    n_layer,input_weight,hidden_weight,output_weight,output)

layer_input = [];
layer_output = [];

layer_input(1,:) = input*input_weight;
layer_output(1,:) = [tanh(layer_input(1,:)) -1];

for i = 1:n_layer-1

    layer_input(i+1,:) = layer_output(i,:)*hidden_weight(:,:,i);
    layer_output(i+1,:) = [tanh(layer_input(i+1,:)) -1];
end

in = layer_output(n_layer,:)*output_weight;
out = (in);

error = out-output;



end
