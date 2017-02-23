%% Problem 1.2b
clc
A=[4,4,1;2,2,1;4,0,1;0,-2,-1;0,0,-1;-2,0,-1];
b=[1,1,1,1,1,1]';
f=@(X)0.5*(X(1)^2+X(2)^2);
sol=fmincon(f,[0,0,0]',A,-b)

%% Problem 1.2d
X=[4,4;2,2;4,0;0,2;2,0;0,0]';
t=[1,1,1,-1,-1,-1];
A=zeros(6,6);
%loopkungen 
for i=1:6
    for j=1:6
        A(i,j)=(X(:,i)'*X(:,j))*(t(i)*t(j));
    end
end
vect=[1,1,1,1,1,1]';
f=@(alpha)-(vect'*alpha-0.5*alpha'*(A*alpha))
initial=rand(6,1)*0.1;
sol=fmincon(f,initial,-eye(6),zeros(6,1),t,0)
w=zeros(2,1);
for i=1:6
    w=w+sol(i)*t(i)*X(:,i);
end
b=t(5)-w'*X(:,5);
w
b