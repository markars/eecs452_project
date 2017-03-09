% EECS 452 Letter Classification Algorithm
function eecs452_project_matlab1
close all 

tic

% Image Acquisition
image = imread('test.jpg');
figure; imshow(image); title('original');

% Feature Extraction
feature = extract_feature(image);

% Create and Train Neural Network
net = create_nn();

% Search Neural Network
search_neural_network(net, feature);

% Total time it took to run program
total_time = toc
end