imageDir = dir('/Users/nikitlonari/Downloads/images/Training/*.pgm');
number_of_files = length(imageDir);
for i = 1:number_of_files
    filename = strcat('/Users/nikitlonari/Downloads/images/Training/',imageDir(i).name);
    image = imread(filename);
    image_resize = imresize(image,[15 16]);
    A(:,i) = image_resize(:);
    
end
X = im2double(A);
[rows_X, columns_X] = size(X);
y = zeros(columns_X,1);
for i = 1:columns_X
    if(i<=20)
        y(i,1) = 0;
    else
        y(i,1) = 1;
    end
end
%[x_norm, mu, sigma] = normalize(X);
X = [ones(1,columns_X); X];
prompt = input('enter number of activation units (4,8,12) for hidden layer:');
%feedforward for 4 units in layer 2;
theta1 = rand(prompt,rows_X+1);
%gradientDescentforNN(X,y,theta1);
z2 = theta1*X;
a2 = sigmoid(z2);
a2 = [ones(1,columns_X); a2]';
[rows columns] = size(a2);
theta2 = rand(columns,1);
z3 = a2*theta2;
a3 = sigmoid(z3);
[J,D1] = Backpropagation( theta1,theta2,z2,a2,z3,a3,y );
prompt = 'predicting h(x) for units 4,8,12 in hidden layers as:';
display(prompt);
h = predictforNN(D1,theta1)


