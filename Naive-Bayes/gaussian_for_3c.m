person_info = csvread('/Users/nikitlonari/Desktop/data_for_3c.csv');
new_info = csvread('/Users/nikitlonari/Desktop/input_data_for_3c.csv');
[person_rows, person_columns] = size(person_info);
[new_info_rows, new_info_columns] = size(new_info);
% prior probability of men and women 
W = 0.5;
M = 0.5;

%initialize 
height_of_women = 0;
women_height_counter = 0;
height_of_men = 0;
men_height_counter = 0;

weight_of_women = 0;
women_weight_counter = 0;
weight_of_men = 0;
men_weight_counter = 0;

%age_of_women = 0;
%women_age_counter = 0;
%age_of_men = 0;
%men_age_counter = 0;

%calculating the mean for height, weight and age of women and men
%respectively
for i = 1:person_rows
    j = 1;
    if person_info(i,person_columns)==0
        height_of_women = height_of_women+person_info(i,j);
        women_height_counter = women_height_counter+1;
        j = j+1;
        weight_of_women = weight_of_women+person_info(i,j);
        women_weight_counter = women_weight_counter+1;
        j = j+1;
        %age_of_women = age_of_women+person_info(i,j);
       % women_age_counter = women_age_counter+1;
       % j = j+1;
    else
        height_of_men = height_of_men+person_info(i,j);
        men_height_counter = men_height_counter+1;
        j = j+1;
        weight_of_men = weight_of_men+person_info(i,j);
        men_weight_counter = men_weight_counter+1;
        j = j+1;
       % age_of_men = age_of_men+person_info(i,j);
       % men_age_counter = men_age_counter+1;
       % j = j+1;
    end
end
mean_of_women_height = height_of_women/women_height_counter;
mean_of_men_height = height_of_men/men_height_counter;
mean_of_women_weight = weight_of_women/women_weight_counter;
mean_of_men_weight = weight_of_men/men_weight_counter;
%mean_of_women_age = age_of_women/women_age_counter;
%mean_of_men_age = age_of_men/men_age_counter;

%calculating the variance for height, weight and age of women and men respectively 
variance_for_women_height = 0;
variance_for_women_weight = 0;
variance_for_women_age = 0;
variance_for_men_height = 0;
variance_for_men_weight = 0;
variance_for_men_age = 0;
for i = 1:person_rows
    j = 1;
    if person_info(i,person_columns)==0
        variance_for_women_height = variance_for_women_height+((person_info(i,j)-mean_of_women_height)^2);
         j = j+1;
        variance_for_women_weight = variance_for_women_weight+(person_info(i,j)-mean_of_women_weight)^2;
        j = j+1;
       % variance_for_women_age = variance_for_women_age+(person_info(i,j)-mean_of_women_age)^2;
    else
        variance_for_men_height = variance_for_men_height+(person_info(i,j)-mean_of_men_height)^2;
        j = j+1;
        variance_for_men_weight = variance_for_men_weight+(person_info(i,j)-mean_of_men_weight)^2;
        j = j+1;
        %variance_for_men_age = variance_for_men_age+(person_info(i,j)-mean_of_men_age)^2;
    end
end
variance_for_women_height = variance_for_women_height/(women_height_counter-1);
variance_for_women_weight = variance_for_women_weight/(women_weight_counter-1);
%variance_for_women_age = variance_for_women_age/(women_age_counter-1);
variance_for_men_height = variance_for_men_height/(men_height_counter-1);
variance_for_men_weight = variance_for_men_weight/(men_weight_counter-1);
%variance_for_men_age = variance_for_men_age/(men_age_counter-1);

for i = 1:size(new_info)
    h_W(i,1) = (1/sqrt(2*3.14*variance_for_women_height))*exp(-(((new_info(i,1)-mean_of_women_height)^2)/(2*variance_for_women_height)));
    w_W(i,1) = (1/sqrt(2*3.14*variance_for_women_weight))*exp(-(((new_info(i,2)-mean_of_women_weight)^2)/(2*variance_for_women_weight)));  
    %a_W(i,1) = (1/sqrt(2*3.14*variance_for_women_age))*exp(-(((new_info(i,3)-mean_of_women_age)^2)/(2*variance_for_women_age)));
    h_M(i,1) = (1/sqrt(2*3.14*variance_for_men_height))*exp(-(((new_info(i,1)-mean_of_men_height)^2)/(2*variance_for_men_height)));
    w_M(i,1) = (1/sqrt(2*3.14*variance_for_men_weight))*exp(-(((new_info(i,2)-mean_of_men_weight)^2)/(2*variance_for_men_weight)));
    %a_M(i,1) = (1/sqrt(2*3.14*variance_for_men_age))*exp(-(((new_info(i,3)-mean_of_men_age)^2)/(2*variance_for_men_age)));
    
% calculating probability of any testing point x given that class is known
    x_W(i,1) = h_W(i,1)*w_W(i,1);
    x_M(i,1) = h_M(i,1)*w_M(i,1);
    W_x(i,1) = (x_W(i,1)*W)/((x_W(i,1)*W)+(x_M(i,1)*M));
    M_x(i,1) = (x_M(i,1)*M)/((x_W(i,1)*W)+(x_M(i,1)*M));
    if W_x(i,1)>M_x(i,1)
        z = 'Women';
        disp(z);
    elseif M_x(i,1)>W_x(i,1)
        z = 'Men';
        disp(z);
    else
        z = 'X can be either Men or Women';
        disp(x);
    end
end





