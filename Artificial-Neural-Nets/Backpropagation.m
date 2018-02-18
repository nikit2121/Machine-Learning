function [ J_history,D ] = Backpropagation( theta1,theta2,z2,a2,z3,a3,y )
    m = length(y);
    cap_delta = 0;
    for i = 1:1
        delta3 = a3-y;
        delta2 = (delta3*theta2').*(a2.*(1-a2));
        %delta2_2 = (delta3*theta2(2,:)).*(a2(:,2).*(1-a2(:,2)));
        %delta2_3 = (delta3*theta2(3,:)).*(a2(:,3).*(1-a2(:,3)));
        %delta2_4 = (delta3*theta2(4,:)).*(a2(:,4).*(1-a2(:,4)));
        %delta2_5 = (delta3*theta2(5,:)).*(a2(:,5).*(1-a2(:,5)));
        %delta2 = [delta2_2 delta2_3 delta2_4 delta2_5];
        cap_delta = cap_delta+(a2'*delta3);
        D = cap_delta/m;
        J_history(i,1) = costFunctionNN(a2,y,D);
    end
    
    
end

