function [ x_norm, mu, sigma ] = normalize( x1 )
m = length(x1);
[rows, columns] = size(x1);
mu = zeros(1,columns);
sigma = zeros(1,columns);
x_norm = x1;
mu = mean(x_norm);
sigma = std(x_norm);
for j = 1:columns
    for i = 1:m
        x_norm(i,j) = (x1(i,j)-mu(:,j))/sigma(:,j);
    end
end



end

