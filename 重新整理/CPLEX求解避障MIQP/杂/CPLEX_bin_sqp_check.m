clear;
x = sdpvar(2,1);
y=  binvar(2,1);
Q=[1 0;0 4];
a=[1 1000 0 0;0 0 1 1000];
b=[3;5];
obj=x'*Q*x;
% c=[x y];
Constraints=[x(1)<=3,x(2)<=4,a*[x;y]<=b,sum(y)<=1];
options=sdpsettings('solver','cplex');
sol=optimize(Constraints,obj,options);
X= value(x)
Y= value(y)