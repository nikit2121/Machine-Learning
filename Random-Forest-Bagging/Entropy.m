function [ entropy count ] = Entropy( U,X,y,c )
count = zeros(2,length(U));
entropy = 0;
for i=1:size(U)
    e = 0;
    p = 0;
    for j=1:size(X)
        if(U{i,1} == X{j,c})
            if(y{j,:}=='e')
                e = e+1;
                %pointer(i,)
            else
                p = p+1; 
            end
        end
    end
    count(1,i) = e;
    count(2,i) = p;
    if(count(1,i)==0 || count(2,i)==0)
        entropy_particular(1,i) = 0;
    else
       entropy_particular(1,i) = -(e/(e+p)*log2(e/(e+p))+p/(e+p)*log2(p/(e+p)));
    end
    entropy = entropy + ((e+p)/j)*entropy_particular(1,i);
end
end

