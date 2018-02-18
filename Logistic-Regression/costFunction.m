function [ J ] = costFunction( X,y,theta,h )
m = length(X);
J = 0;
%z = X*theta;

%h = sigmoid(z);
for i=1:m
    temp(i,1) = ((-y(i,1)*log(h(i,1)))-((1-y(i,1))*log(1-h(i,1))));
end
J = sum(temp)/m;


end

