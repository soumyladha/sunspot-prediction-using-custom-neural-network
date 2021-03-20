function [delta_input_weight,delta_hidden_weight,delta_output_weight] = back_prop(input,...
    n_layer,hidden_weight,output_weight,error,layer_output,~)

hidden_weight_delta=[];

delta = error';
delta_out_weight = (delta*layer_output(n_layer,:))';


if n_layer>1
    

    delta =(output_weight*delta).*(1-layer_output(n_layer,:).^2)';
    hidden_weight_delta(:,:,n_layer-1)=(delta((1:end-1),:)*layer_output(n_layer-1,:))';

    for i=n_layer-1:-1:2
    
        delta =(hidden_weight(:,:,i)*(delta(1:end-1,:))).*(1-layer_output(i,:).^2)';
        hidden_weight_delta(:,:,i-1) = ((delta(1:end-1,:))*layer_output(i-1,:))';
    end
    
    
    delta =(hidden_weight(:,:,1)*(delta(1:end-1,:))).*(1-layer_output(1,:).^2)';
    delta_input_weight= ((delta(1:end-1,:))*input)';
    
elseif n_layer==1

    delta =(output_weight*delta).*(1-layer_output(1,:).^2)';
    delta_input_weight= ((delta(1:end-1,:))*input)';

end

delta_output_weight = delta_out_weight;
delta_hidden_weight = hidden_weight_delta;

end