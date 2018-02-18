function [h_all_order, test_y ] = predict( mu,sigma,theta1,theta2,theta3,theta4 )
test_data = load('PolyTest.txt');
test_y = test_data(:,3);
test_data_xx = test_data(:,1).*test_data(:,2);
test_data_x1_sq = test_data(:,1).^2;
test_data_x2_sq = test_data(:,2).^2;
test_data_x1_sq_x2 = test_data_x1_sq.*test_data(:,2);
test_data_x2_sq_x1 = test_data_x2_sq.*test_data(:,1);
test_data_x1_cube = test_data(:,1).^3;
test_data_x2_cube = test_data(:,2).^3;
test_data_x1x2 = test_data_x1_sq.*test_data_x2_sq;
test_data_x1_cube_x2 = test_data_x1_cube.*test_data(:,2);
test_data_x2_cube_x1 = test_data_x2_cube.*test_data(:,1);
test_data_x1_4_power = test_data_x1_sq.^2;
test_data_x2_4_power = test_data_x2_sq.^2;
test_data_x = [test_data test_data_xx test_data_x1_sq test_data_x2_sq test_data_x1_sq_x2 test_data_x2_sq_x1 test_data_x1_cube test_data_x2_cube test_data_x1x2 test_data_x1_cube_x2 test_data_x2_cube_x1 test_data_x1_4_power test_data_x2_4_power];
m = length(test_data);
for i=1:m
    normalized_test_data(i,:) = [(test_data(i,1)-mu(:,1))/sigma(:,1) (test_data(i,2)-mu(:,2))/sigma(:,2) (test_data_xx(i,:)-mu(:,3))/sigma(:,3) (test_data_x1_sq(i,:)-mu(:,4))/sigma(:,4) (test_data_x2_sq(i,:)-mu(:,5))/sigma(:,5) (test_data_x1_sq_x2(i,:)-mu(:,6))/sigma(:,6) (test_data_x2_sq_x1(i,:)-mu(:,7))/sigma(:,7) (test_data_x1_cube(i,:)-mu(:,8))/sigma(:,8) (test_data_x2_cube(i,:)-mu(:,9))/sigma(:,9) (test_data_x1x2(i,:)-mu(:,10))/sigma(:,10) (test_data_x1_cube_x2(i,:)-mu(:,11))/sigma(:,11) (test_data_x2_cube_x1(i,:)-mu(:,12))/sigma(:,12) (test_data_x1_4_power(i,:)-mu(:,13))/sigma(:,13) (test_data_x2_4_power(i,:)-mu(:,14))/sigma(:,14)];
end
final_normalize_test_data = [ones(m,1) normalized_test_data];
for i=1:m
    h_all_order(i,1) = final_normalize_test_data(i,1:3)*theta1;
    h_all_order(i,2) = final_normalize_test_data(i,1:6)*theta2;
    h_all_order(i,3) = final_normalize_test_data(i,1:10)*theta3;
    h_all_order(i,4) = final_normalize_test_data(i,:)*theta4;
end
end

