function [ X_norm,mu,sigma] = normalize_q1( X )
[rows, columns] = size(X);
mu = zeros(1,columns);
sigma = zeros(1,columns);
mu = mean(X);
sigma = std(X);
for j=1:columns
    for i=1:rows
        X_norm(i,j) = (X(i,j)-mu(1,j))/sigma(1,j);
    end
end

end

