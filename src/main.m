% prompt = 'Number of input ';
% n_input = input(prompt);
% 
% prompt = 'Number of neurons in hidden layer? ';
% n_neurons = input(prompt);
% 
% prompt = 'Number of hidden layer? ';
% n_layer = input(prompt);
% 
% prompt = 'Number of output? ';
% n_output = input(prompt);

n_input =1;
n_neurons =3;
n_layer =2;
n_output =1;

% initilization
input_weight = rand(n_input+1,n_neurons);
% input_weight = [0.15 0.25;0.2 0.30;0.35 0.35];
hidden_weight = [];
for i =1:n_layer-1
    hidden_weight(:,:,i)=rand(n_neurons+1,n_neurons);
end
output_weight = rand(n_neurons+1,n_output)/100;
% output_weight = [0.4 0.5;0.45 0.55;0.6 0.6];
% in= [0.05 0.10 1];
% out = [0.01 0.99];
in = 0.01:0.01:0.9;
out = (exp(-in))';
in = [in' -ones(90,1)];
% a = csvread('data.csv');
% in = (a(:,1:10));
% out = (a(:,11));
% in = (a(:,1)-min(a(:,1)))/(max(a(:,1))-min(a(:,1)));
% 
% out = (a(:,2)-min(a(:,2)))/(max(a(:,2))-min(a(:,2)));
% in = [in -ones(size((in),1),1)];




for i=1:5000
    deltaI = 0*input_weight;
    deltaH = 0*hidden_weight;
    deltaO = 0*output_weight;
    err = 0;
    out2=[];
    
    for j=1:size(in,1)-10
        input = in(j,:);
        output = out(j,:);
        [layer_input, layer_output, error,out1] = forward_prop(input,n_neurons,...
            n_layer,input_weight,hidden_weight,output_weight,output);

        [delta_input_weight,delta_hidden_weight,delta_output_weight] = back_prop(input,...
            n_layer,hidden_weight,output_weight,error,layer_output,out1);
        
        deltaI = deltaI + delta_input_weight;
        deltaH = deltaH + delta_hidden_weight;
        deltaO = deltaO + delta_output_weight; 
        err = err+error^2;
%         out2 = [out2 ;out1];
        
    end
    err
    plot(i,err,'.');
    hold on
    
    output_weight = output_weight-(.3/size(in,1))*deltaO;
    input_weight = input_weight-(.3/size(in,1))*deltaI;
    hidden_weight = hidden_weight-(.3/size(in,1))*deltaH;

end
err/(2*size(in,1))







