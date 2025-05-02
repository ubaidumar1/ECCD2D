
% Define the original matrix
close all; clear all; clc;
A = imread('cameraman.tif');
% Create a copy for the processed matrix
A1 = A;
% Get the number of rows and columns
[row, col] = size(A);
% Process the matrix
for c = 2:col
    % Shift each column downward by (c-1) positions
    A1(:, c) = circshift(A(:, c), c - 1);
end
load k.mat
k=k{:,:};
load val.mat
val=val{:,:};
% Initialize the output matrix
A3 = zeros(size(A1));
% Loop through each element of the input matrix
for i = 1:size(A1, 1)
    for j = 1:size(A1, 2)
        % Find the index of the current value in the keys array
        index = find(k== A1(i, j));
        
        % Map the value in input_matrix to the corresponding value in values
        A3(i, j) = val(index);
    end
end





