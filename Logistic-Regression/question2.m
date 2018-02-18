data = load('data.csv');
X = data(:,1:3);
y = data(:,4);
pos = find(y==1); 
neg = find(y == 0);
plot3(X(pos, 1), X(pos, 2),X(pos,3), 'k+','LineWidth', 2, ...
    'MarkerSize', 7);
hold on;
plot3(X(neg, 1), X(neg, 2),X(neg,3), 'ko','MarkerFaceColor', 'y', ...
    'MarkerSize', 7);
xlabel('height');
ylabel('weight');
zlabel('age');
[rows columns] = size(X);
[X_norm] = normalize(X);
alpha = 0.1;
X = [ones(rows,1),X_norm];
theta = zeros(columns+1,1);
[theta, J_history,h] = gradientdescent2(X,y,theta,alpha);
test = load('test_data.csv');
test_norm = normalize(test);
l = length(test);
test = [ones(l,1) test_norm];
p = zeros(l,1);
z = test*theta;
p = sigmoid(z);
count = length(p);
S = 'Test data is predicted as:';
disp(S);
for i=1:count
    if p(i,:)<0.5
        S = 'Women';
        disp(S);
    else
        S = 'Men';
        disp(S);
    end
end