function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    ss1 = [];
    ss2 = [];
    for i = 1:1:m
        h = sum(theta' .* X(i,:));
        ss1(i) = (h- y(i));
        ss2(i) = (h- y(i))* X(i,:)(2);
    end
    dtheta1 = alpha * (sum(ss1)/m);
    dtheta2 = alpha * (sum(ss2)/ m);
    
    theta(1) = theta(1) - dtheta1;
    theta(2) = theta(2) - dtheta2;
    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
