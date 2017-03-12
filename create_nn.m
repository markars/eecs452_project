function net = create_nn()
% create feedforward neural network
layers = 2; % row of vectors of hidden network layers
%trainFn = ;
%net = feedforwardnet(layers, trainFn);

targets = matfile('targets.mat'); % every column value with a 1 represents the letter the image corresponds to
net = patternnet(layers);

fred = matfile('letters_skel.mat');

[net,tr] = train(net,fred,targets);
% outputs = net(inputs);
net = 0;
end
