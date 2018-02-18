function [ h ] = predictforNN( D1,theta1 )
imageDir = dir('/Users/nikitlonari/Downloads/images/Test/*.pgm');
number_of_files = length(imageDir);
for i = 1:number_of_files
    filename = strcat('/Users/nikitlonari/Downloads/images/Test/',imageDir(i).name);
    image = imread(filename);
    image_resize = imresize(image,[15 16]);
    B(:,i) = image_resize(:);
end
test_X = im2double(B);
[n, m] = size(test_X);
test_X = [ones(1,m); test_X];
test_z2 = theta1*test_X;
test_a2 = sigmoid(test_z2);
[n,m] = size(test_a2);
test_a2 = [ones(1,m); test_a2]';
test_z3 = test_a2*D1;
h = sigmoid(test_z3);


end

