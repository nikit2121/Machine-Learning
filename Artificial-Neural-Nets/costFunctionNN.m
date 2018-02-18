function [J] = costFunctionNN(a2,y,D)
    m = length(y);
    h= a2*D;
    for i = 1:m
        temp(i,1) = (-y(i,:)*log(h(i,:)))-(((1-y(i,:))*log(1-h(i,1))));
    end
    J = sum(temp)/m;
end

