function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

rows = @(x) size(x,1); 
cols = @(x) size(x,2);

numCols = cols(X);
numRows = rows(X);

for i = 1 : numCols

	meani = mean(X(:, i));
	stdi = std(X(:, i));

	mu(1, i) = meani;
	sigma(1, i) = stdi;

	for j = 1 : numRows

		X_norm(j, i) = (X_norm(j, i) - meani) / stdi;

	end
end

% ============================================================

end

