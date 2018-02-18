%% Train_data
fileId = fopen('/Users/nikitlonari/Desktop/MushroomTrain.txt','r');
data = textscan(fileId,'%s','delimiter','\n');
new_data = data{1,1};
for i=1:size(new_data)
    Mushroom_training_data(i,:) = strsplit(new_data{i},',');
end
train_X = Mushroom_training_data(:,2:5);
train_y = Mushroom_training_data(:,1);
%% Test_data
fileId1 = fopen('/Users/nikitlonari/Desktop/MushroomTest.txt','r');
data1 = textscan(fileId1,'%s','delimiter','\n');
new_data1 = data1{1,1};
for i=1:size(new_data1)
    Mushroom_test_data(i,:) = strsplit(new_data1{i},',');
end
test_X = Mushroom_test_data(:,2:5);
test_y = Mushroom_test_data(:,1);
tuple = cell(1,4);
prompt = input('How Many classifiers 10, 50 or 100:');
for m = 1:size(test_X)%change here to test on train data
    count_e = 0;
    count_p = 0;
    count_c = 0;
    %p = cell(1,prompt);
    z = zeros(1,prompt);
    for o = 1:prompt
        flag=0;
        % Call Bagging get the index to split for the first node
        [index, U,X,y,X1] = Bagging_q(Mushroom_training_data);
        for t=1:size(U)
            if(U{t}==test_X{m,index})%change here to test on train data
                tuple(1,:) = test_X(m,:);%change here to test on train data 
                z(1,o) = second_level_split(index, U,X,y,tuple,X1,t);
                flag =1;
                break;
            end
        end
        if(flag==0)
            z(1,o)=-1;
        end
    end
    for indices=1:length(z)
        if(z(:,indices)==1)
            count_e = count_e+1;
        elseif(z(:,indices)==2)
            count_p = count_p+1;
        else
            count_c = count_c+1;
        end
    end
    if(count_e>count_p)
        predict(m,1)=1;
    elseif(count_p>count_e)
        predict(m,1)=2;
    else
        predict(m,1)=-1;
    end
    
    
end
predict
