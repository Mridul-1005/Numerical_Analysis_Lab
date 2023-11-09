% Prompt the user to enter the values of matrix A
A = input('Enter the values of matrix A: ');

% Prompt the user to enter the values of matrix B
B = input('Enter the values of matrix B: ');

% Find the maximum value in matrix A
max_value = max(A);

% Print the maximum value
fprintf('The maximum value in matrix A is %d.\n', max_value);

% Check if the two matrices can be multiplied
if size(A, 2) ~= size(B, 1)
    % The two matrices cannot be multiplied
    fprintf('The two matrices cannot be multiplied.\n');
else
    % Multiply the two matrices
    C = A * B;

    % Print the result of the multiplication
    fprintf('The result of multiplying the two matrices is:\n');
    disp(C);
end