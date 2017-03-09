function net = create_nn()
% create feedforward neural network
% Background: feedforwardnet() consists of a series of layers where the first layer
% has a connection to the network input and then each subsequent layer
% is connected to the previous layer.
layers = 2; % row of vectors of hidden network layers
trainFn = ;
%net = feedforwardnet(layers, trainFn);

load('targets.mat'); % every column value with a 1 represents the letter the image corresponds to
net = patternnet(layers);

[net,tr] = train(net,inputs,targets);
outputs = net(inputs);

end
