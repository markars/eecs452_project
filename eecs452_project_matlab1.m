% EECS 452 Letter Classification Algorithm
function eecs452_project_matlab1
close all 

tic
% % % m = matfile('letters_skel.mat');
% % % [n b] = size(m, 'matA1')

% Image Acquisition
image = imread('test.jpg');
% figure; imshow(image); title('original');

% Feature Extraction
feature = extract_feature(image);

% Create and Train Neural Network
net = create_nn();

% Search Neural Network
%letter = search_nn(net, feature);

% Total time it took to run program
total_time = toc
end

% NOTES

% letter_skel is a matlab file that holds five class of each alphabet
% letter --> processing applied to images
% 
% target.mat is a file that holds the target array to identify which
% alphabet corresponds to a letter
% size is 650 columns of row length 26
% 