clc;
clear;
train_data = load('C:\Users\Aditya\Downloads\Data Mining\DataMiningProject1\ATNT200\ATNT200\trainDataXY.txt');
test_data = load('C:\Users\Aditya\Downloads\Data Mining\DataMiningProject1\ATNT200\ATNT200\testDataX.txt');
label = train_data(1,:);
values = unique(label);
label_count = hist(label,values);
[row,col] = size(values);
no_cols_test = size(test_data,2);
m = 0;
n = 0;
for i = 1:col
    no_of_images = label_count(i);
    for j = 1:no_of_images
        m = m+1;
        if train_data(1,m) == values(i)
            temp(:,m) = train_data(2:end,m);
        end
    end
    for k = 1:no_of_images
        n = n+1;
        slice(:,k) = temp(:,n);
        add(:,i) = sum(slice,2);
        average(:,i) = add(:,i)./no_of_images;
    end
end
no_cols_average = size(average,2);
for p = 1:no_cols_test
    for q = 1:no_cols_average
        difference(:,q) = test_data(:,p)-average(:,q);
    end
    square = difference.^2;
    summation = sum(square);
    sq_root = summation.^(1/2);
    [M,I] = sort(sq_root);
    solution(1,p) = values(I(1));
end