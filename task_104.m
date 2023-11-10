% Define the function
f = @(x) x.^3 - 2*x - 4;

% Define the derivative of the function
df = @(x) 3*x.^2 - 2;

% Initial guess
x0 = 1;

% Set the tolerance for convergence
tolerance = 1e-6;

% Initialize matrices to store root and iteration information
roots = [];
iterations = [];

% Newton-Raphson method
while abs(f(x0)) > tolerance
    roots = [roots; x0];  % Store the root
    iterations = [iterations; abs(f(x0))];  % Store the function value at the root
    
    % Calculate the next guess using the Newton-Raphson formula
    x0 = x0 - f(x0) / df(x0);
end

% Display the final root
fprintf('Approximate root: %f\n', x0);

% Plot the function and tangent lines
x = linspace(min(roots) - 1, max(roots) + 1, 1000);
y = f(x);

figure;
plot(x, y, 'b-', roots, zeros(size(roots)), 'ro');
hold on;

% Plot tangent lines
for i = 1:length(roots)
    tangent_line = f(roots(i)) + df(roots(i)) * (x - roots(i));
    plot(x, tangent_line, '--', 'Color', [0.8, 0.8, 0.8]);
end

xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method Root-Finding');
legend('f(x)', 'Roots', 'Tangent Lines');
grid on;
hold off;
