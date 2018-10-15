function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
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
    %       of the cost function (computeCostMulti) and gradient here.
    %

    rows = @(x) size(x,1); 
    cols = @(x) size(x,2);

    features = cols(X);

    % Derivatives matrix for all thetas
    dLTheta = zeros(features, 1);

    tempTheta = theta;

    for k = 1 : features

        for i = 1 : m

            h = theta' * X(i, :)';    % h = θT * x

            % h = 0;

            % for j = 1 : features
            %     h = h + theta(j) * X(i, j);
            % end

            dLTheta(k) = dLTheta(k) + (h - y(i)) * X(i, k);

        end

    end

    for i = 1 : features
        tempTheta(i) = tempTheta(i) - alpha * (1/m) * dLTheta(i);
    end    

    theta = tempTheta;


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end
end
