function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    dLTheta0 = 0;
    dLTheta1 = 0;
    theta0 = theta(1);
    theta1 = theta(2);

    for i = 1:m
        h = theta(1) * X(i, 1) + theta(2) * X(i, 2);
        dLTheta0 = dLTheta0 + (h - y(i)) * X(i, 1);
        dLTheta1 = dLTheta1 + (h - y(i)) * X(i, 2);
        
    end

    theta0 = theta0 - alpha * (1/m) * dLTheta0;
    theta1 = theta1 - alpha * (1/m) * dLTheta1;

    theta(1) = theta0;
    theta(2) = theta1;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
