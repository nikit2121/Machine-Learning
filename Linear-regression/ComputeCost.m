function J = ComputeCost(X,y,theta)
m = length(y);
h = X*theta;
J = sum((h-y).^2);
J = J/(2*m);
end



%for i=1:4
    %J = sum((h-y).^2);
   % J= J/80;
%end