function [ index, U,X,y,X1] = Bagging_q( Mushroom_training_data )
Int = randi([70 100],1,1);
sample = datasample(Mushroom_training_data,Int);
X = sample(:,2:5);
y = sample(:,1);
[rows_X columns_X] = size(X);
for c = 1:columns_X
    values_in_each_column = X(:,c);
    U = unique(values_in_each_column);
    [entropy(1,c) count] = Entropy(U,X,y,c); 
end
[minimum index] = min(entropy);
X1 = X;
X1(:,index) = [];
[rows_X1 columns_X1] = size(X1);
split_using_min_entropy = X(:,index);
U = unique(split_using_min_entropy);
[entropy1(1,1) count1] = Entropy(U,X,y,index);
%total_sum = zeros(2,length(U));
%for i=1:size(U)
%    a = 1;
%    
%    for j = 1:rows_X1
%        if(U{i}==X{j,index})
%            temp_X(a,:) = X1(j,:);
%            temp_y(a,:) = y(j,1);
%            a = a+1;
%        end
%   end
%    [rows_temp columns_temp] = size(temp_X);
%    for c = 1:columns_temp
%       values_in_each_column = temp_X(:,c); 
%       U2 = unique(values_in_each_column);
%       [entropy2(1,c) count2] = Entropy(U2,temp_X,temp_y,c); 
%        
%        
%    end
    
%end

end

