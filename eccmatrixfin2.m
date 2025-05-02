% Define the original matrix
 clc;
B = imread('pout.tif');
B = imresize(B,[256,256]);
% Create a copy for the processed matrix
B1 = B;
% Get the number of rows and columns
[row, col] = size(B);
% Process the matrix
for c = 2:col
    % Shift each column downward by (c-1) positions
    B1(:, c) = circshift(B(:, c), c - 1);
end
load k.mat
k=k{:,:};
load val.mat
val=val{:,:};
% Initialize the output matrix
B2 = zeros(size(B1));
% Loop through each element of the input matrix
for i = 1:size(B1, 1)
    for j = 1:size(B1, 2)
        % Find the index of the current value in the keys array
        index = find(k== B1(i, j));
        
        % Map the value in input_matrix to the corresponding value in values
        B2(i, j) = val(index);
           B2=mod(B2,255);    
         end
end
save B2.mat
