function [theta, J_history,h] = gradientDescent1(X, y, theta, alpha, num_of_iteration)
m = length(y);
for i=1:num_of_iteration
    h = X*theta;    
    error = h-y;
    theta_change = (X'*error)*(alpha/m);
    theta = theta-theta_change;
    J_history(i,1) = ComputeCost(X,y,theta);
end
end




