% Define the original matrix
clear all; close all; clc;
C = imread('yellowlily.jpg');
C=rgb2gray(C);
C = imresize(C,[256,256]);
% Create a copy for the processed matrix
C1 = C;
% Get the number of rows and columns
[row, col] = size(C);
% Process the matrix
for c = 2:col
    % Shift each column downward by (c-1) positions
    C1(:, c) = circshift(C(:, c), c - 1);
end
load k.mat
k=k{:,:};
load val.mat
val=val{:,:};
% Initialize the output matrix
A3 = zeros(size(C1));
% Loop through each element of the input matrix
for i = 1:size(C1, 1)
    for j = 1:size(C1, 2)
        % Find the index of the current value in the keys array
        index = find(k== C1(i, j));
        
        % Map the value in input_matrix to the corresponding value in values
        C2(i, j) = val(index);
        C2=mod(C2,255);
        end
end
save C2.mat
