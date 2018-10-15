function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

rows = @(x) size(x,1); 
cols = @(x) size(x,2);

for i = 1:rows(z)

	for j = 1:cols(z)

		g(i, j) = 1/(1 + 2.7183^(-z(i, j)));

	end	

end

return

% =============================================================

end
