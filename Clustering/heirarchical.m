%calculating the distance between each singleton
clear;
clc;
mydata = load('/Users/nikitlonari/Desktop/Lonari_homework_2/Q.4/seeds_dataset.txt');
data1 = mydata(1:50,1:7);
data2 = mydata(71:120,1:7);
data3 = mydata(141:190,1:7);
data = [data1;data2;data3];
matrix = zeros(length(data),length(data));
%% CALCULATION OF DISTANCE METRICS
for i = 1:length(data)
    for j = 1:length(data)
        if(i==j)
            matrix(i,j) = 10;   
        else
            matrix(i,j) = sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2+(data(i,3)-data(j,3))^2+(data(i,4)-data(j,4))^2+(data(i,5)-data(j,5))^2+(data(i,6)-data(j,6))^2+(data(i,7)-data(j,7))^2);
        end
    end
end
n = 0;
combo = zeros(150,3);
current_row = 0;
%while(current_row~=1)
%% FORMATION OF HIERARCHY
while(n~=149)

    [minValue,minIndex] = min(matrix(:));
    [row, column] = ind2sub(size(matrix), minIndex);
    if(row>column)
        temp = row;
        row = column;
        column = temp;
    end
    matrix(column,:) = 100;
    n = n+1;
    combo(n,1) = row;
    combo(n,2) = column;
    combo(n,3) = minValue;
    [current_row, current_columns] = size(matrix);
    for i=1:current_row
        if(matrix(i,row)==10 | matrix(i,column)==10)
            continue;
        %elseif(matrix(i,row)==0 | matrix(i,column)==0)
         %   continue;
        else
            if(matrix(i,row)>matrix(i,column))
                matrix(i,row) = matrix(i,column);
            end
        
        end
    end
    matrix(:,column) = 100;
end
%% Generating Cluster 
prompt = input('Enter number of cluster you want:');

T = clusterdata(data,prompt);
for l = 1:prompt
    n = 0;
    %cluster = 0;
    z = length(T);
    for k = 1:length(T)
        if(T(k,1) == l)
            n = n+1;
            cluster(n,:) = data(k,:);
        end
    end
    [rows,colum] = size(cluster);
    if(rows == 1)
        avg(l,:) = cluster(1,:);
    else
        avg(l,:) = mean(cluster);
    end
end
test1 = mydata(51:70,:);
test2 = mydata(121:140,:);
test3 = mydata(191:210,:);
test = [test1;test2;test3];
test(:,8) = [];
prediction = zeros(length(test),1);
%% Calculating nearest neighbor
for i = 1:length(test)
    [k,l] = size(avg);
    for j = 1:k
        nearest_cluster(1,j) = sqrt((test(i,1)-avg(j,1))^2+(test(i,2)-avg(j,2))^2+(test(i,3)-avg(j,3))^2+(test(i,4)-avg(j,4))^2+(test(i,5)-avg(j,5))^2+(test(i,6)-avg(j,6))^2+(test(i,7)-avg(j,7))^2); 
    end
    [value, classID] = min(nearest_cluster);
    %predicting the ClassId's on test_data
    prediction(i,1) = classID 
    
end

%dendrogram(cluster);
