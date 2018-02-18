function [ h ] = sigmoid( z )
m = length(z);
for i=1:m
    h(i,1) = 1/(1+exp(-z(i,1)));
end
end

