function [ theta, J_history,h ] = gradientdescent2( X,y,theta,alpha )
m = length(X);
%for i=1:m
 %   h = X*theta;
  %theta3 = theta(3,1)-(alpha*(h(i,1)-y(i,1))*X(i,3));
   % theta4 = theta(4,1)-(alpha*(h(i,1)-y(i,1))*X(i,4));
    %theta = [theta1;theta2;theta3;theta4];
    %J_history(i,1) = costFunction(X,y,theta);
%end
for i=1:m
    z=X*theta;
    h = sigmoid(z);
    error = h-y;
    theta_change = X'*error;
    theta = theta-theta_change;
    J_history(i,1) = costFunction(X,y,theta,h);
end
end

