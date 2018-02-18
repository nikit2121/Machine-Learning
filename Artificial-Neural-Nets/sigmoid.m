function [ h ] = sigmoid( z )
[n m] = size(z);
for j=1:n
    for i=1:m
    h(j,i) = 1/(1+exp(-z(j,i)));
    end
end
end

