clc
syms q1 q2 q3
syms F R P Jw Jv J
%R(:,:,1) = eye(3);
P(1:3,1,1) = [1 0 0;0 1 0;0 0 1]*[0 0 1]';
links = 3;
a = [0 2 2];
d = [0 0 0];
theta = [q1 q2 q3];
alpha = [sym(pi)/2 0 0];
for i = 1:1:links
    F(1:4,1:4,i+1) = fk_two(i,a,alpha,d,theta)
    R(1:3,1:3,i+1) = F(1:3,1:3,i+1);
    P(1:3,1,i+1) = R(1:3,1:3,i+1)*[0 0 1]';
end
for j = 1:1:links
    F(1:3,4,links+1)
    F(1:3,4,j)
    Pn(1:3,1,j) = F(1:3,4,links+1) - F(1:3,4,j)
end

Jw(1:3,1) = cross(P(1:3,1,1),Pn(1:3,1,1));
Jv(1:3,1) = P(1:3,1,1);
J(1:6,1) = [Jw(1:3,1) ;Jv(1:3,1)];

Jw(1:3,2) = cross(P(1:3,1,2),Pn(1:3,1,2));
Jv(1:3,2) = P(1:3,1,2);
J(1:6,2) = [Jw(1:3,2);Jv(1:3,2)];

Jw(1:3,3) = cross(P(1:3,1,3),Pn(1:3,1,3));
Jv(1:3,3) = P(1:3,1,2);
J(1:6,3) = [Jw(1:3,3);Jv(1:3,3)];
J