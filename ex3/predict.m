function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

X = [ones(size(X, 1), 1) X]; % m x n+1

%Theta1 -> 26 x n+1
%Theta2 -> 10 x 26

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


a2 = Theta1 * X.'; % 26 * m

for i = 1:size(a2, 1)
	for j = 1:size(a2, 2)

		a2(i, j) = sigmoid(a2(i, j));

	end
end	

a2 = [ones(1, size(a2, 2)); a2];

a3 = a2.' * Theta2.'; % m x 10

for i = 1:size(a3, 1)
	for j = 1:size(a3, 2)

		a3(i, j) = sigmoid(a3(i, j));

	end

	[x, ix] = max(a3(i, :));
	p(i) = ix;

end



% =========================================================================


end
