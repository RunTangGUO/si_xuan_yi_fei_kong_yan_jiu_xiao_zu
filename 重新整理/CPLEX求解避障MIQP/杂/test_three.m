clear;
x=intvar(1,5);
f=[1 1 3 4 2]*(x'.^2)-[8 2 3 1 2]*x';
set=[0<=x;x<=99;[1 1 1 1 1]*x'<=400;[1 2 2 1 6]*x'<=800;2*x(1)+x(2)+6*x(3)<=800;x(3)+x(4)+5*x(5)<=200];
options=sdpsettings('solver','cplex');
optimize(set,-f);
%不知道为什么显示不出来
double(f)
double(x)