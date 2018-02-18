data = load('project_data.csv');
x = data(:,1:2);
y = data(:,3);
m = length(y);
figure(1);
scatter3(x(:,1),x(:,2),y);
%calculating cost using gradient descent for order of 1
[x_norm,mu,sigma] = normalize_q1(x);
X = [ones(m,1) x_norm];
[rows columns] = size(X);
theta1 = zeros(columns,1);
alpha = 0.1;
num_of_iteration = 75;
[theta1, J_history,h] = gradientDescent1(X, y, theta1, alpha, num_of_iteration);
hold on;
f = fit([x(:,1),x(:,2)],y,'poly11');
plot(f,[x(:,1),x(:,2)],y);
%plot3(x(:,1),x(:,2),X*theta1,'-');

%calculating cost using gradient descent for order of 2
x1 = x(:,1).^2;
x2 = x(:,2).^2;
xx = x(:,1).*x(:,2);
x_order_of_2 = [x xx x1 x2];
[x_norm mu sigma] = normalize_q1(x_order_of_2);
X = [ones(m,1) x_norm];
[rows columns] = size(X);
theta2 = zeros(columns,1);
alpha = 0.3;
num_of_iteration = 550;
[theta2, J_history,h] = gradientDescent1(X, y, theta2, alpha, num_of_iteration);
figure(2);
%scatter3(x(:,1),x(:,2),y);
f = fit([x(:,1),x(:,2)],y,'poly23');
plot(f,[x(:,1),x(:,2)],y);



%calculating cost using gradient descent for order of 3
x1_sq_x2 = x1.*x(:,2);
x1_x2_sq = x2.*x(:,1);
x1_cube = x1.^3;
x2_cube = x2.^3;
x_order_of_3 = [x_order_of_2 x1_sq_x2 x1_x2_sq x1_cube x2_cube];
[x_norm mu sigma] = normalize_q1(x_order_of_3);
X = [ones(m,1) x_norm];
[rows columns] = size(X);
theta3 = zeros(columns,1);
alpha = 0.3;
num_of_iteration = 1750;
[theta3, J_history] = gradientDescent1(X, y, theta3, alpha, num_of_iteration);
figure(3);
%scatter3(x(:,1),x(:,2),y);
%hold on;
%plot3(x(:,1),x(:,2),X*theta3,'-');
f = fit([x(:,1),x(:,2)],y,'cubicinterp');
plot(f,[x(:,1),x(:,2)],y);

%calculating cost using gradient descent for order of 4
x1_sq_x2_sq = x1.*x2;
x1_cube_x2 = x1_cube.*x(:,2);
x2_cube_x1 = x2_cube.*x(:,1);
x1_4th_power = x1.^2;
x2_4th_power = x2.^2;
x_order_of_4 = [x_order_of_3 x1_sq_x2_sq x1_cube_x2 x2_cube_x1 x1_4th_power x2_4th_power];
[x_norm mu sigma] = normalize_q1(x_order_of_4);
X = [ones(m,1) x_norm];
[rows columns] = size(X);
theta4 = zeros(columns,1);
alpha = 0.1;
num_of_iteration = 2570;
[theta4, J_history] = gradientDescent1(X, y, theta4, alpha, num_of_iteration);
figure(4);
scatter3(x(:,1),x(:,2),y);
hold on;
fprintf('polynomial of order 4 overfits the data.\n Press enter to view the plot\n');

plot3(x(:,1),x(:,2),X*theta4,'-');
[h_test, test_y] = predict(mu,sigma,theta1,theta2,theta3,theta4);
%error comparison
compare(1,1) = sum((h_test(:,1)-test_y).^2);
compare(1,2) = sum((h_test(:,2)-test_y).^2);
compare(1,3) = sum((h_test(:,3)-test_y).^2);
compare(1,4) = sum((h_test(:,4)-test_y).^2);
[minimum_error,index] = min(compare);
fprintf('for the given test data, polynomial of order %f predicts with minimum error\n',index);