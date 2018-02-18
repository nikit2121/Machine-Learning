person_info = csvread('/Users/nikitlonari/Desktop/data_for_2c.csv');
new_info = csvread('/Users/nikitlonari/Desktop/input_data_for_2c.csv');
[person_rows, person_columns] = size(person_info);

for j = 1:size(new_info) 
    for i = 1:size(person_info)
        distance(i,j) = sqrt((person_info(i,1)-new_info(j,1))^2+(person_info(i,2)-new_info(j,2))^2);
        %+(person_info(i,3)-new_info(j,3))^2);
    end
end
[rows, columns] = size(distance);
for i = 1:columns
    women_counter = 0;
    men_counter = 0;
    [order,indices] = sort(distance(:,i));
    prompt = 'enter the value for k :';
    k = input(prompt);
    for j = 1:k
        pointer = indices(j,1);
        value = person_info(pointer,person_columns);
        if value == 0
            women_counter = women_counter+1;
        else
            men_counter = men_counter+1;
        end 
    end
    if women_counter>men_counter
        x = 'details helps to predict as a women';
        disp(x);
    else
        x = 'details helps to predict as a men';
        disp(x);
    end

    
end
