function [ p ] = second_level_split( index, U,X,y,tuple,X1,t )
%X1 = X;
%X1(:,index) = [];
[rows_X1 columns_X1] = size(X1);
%split_using_min_entropy = X(:,index);
%U = unique(split_using_min_entropy);
%[entropy1(1,1) count1] = Entropy(U,X,y,index);
%total_sum = zeros(2,length(U));
a = 1;
for j = 1:rows_X1
    if(U{t}==X{j,index})
        temp_X(a,:) = X1(j,:);
        temp_y(a,:) = y(j,1);
        a = a+1;
    end
end
[rows_temp columns_temp] = size(temp_X);
for c = 1:columns_temp
    %flag = 0;
    values_in_each_column = temp_X(:,c); 
    U2 = unique(values_in_each_column);
    [entropy2(1,c) count2] = Entropy(U2,temp_X,temp_y,c); 
    for k = 1:length(U2)
        if(U2{k}==tuple{1,c})
            e = count2(1,k)/(count2(1,k)+count2(2,k));
            p = count2(2,k)/(count2(1,k)+count2(2,k));
            if(e>p)
                p = 1;
                return;
            elseif(e<p)
                p = 2;
                return;
            elseif(e>=0.4 & e<=0.6)
                p = -1;
                return;
            end
        end
    
        
        
    end
    if(c==columns_temp)
        p = 'c';
                
    end
    
end


end

