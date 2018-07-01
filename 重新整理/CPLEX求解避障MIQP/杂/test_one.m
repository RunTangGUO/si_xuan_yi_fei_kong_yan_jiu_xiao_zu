% value:5 constraint:2   线性规划
% max z=2x1+x2+4x3+3x4+x5
% 2x2+x3+4x4+2x5<=54
% 3x1+4x2+5x3-x4-x5<=62
% x1,x2<=0,x3<=3.32,x4<=0.678,x5<=2.57
f=-[2 1 4 3 1]';%目标函数系数 （每条边对应的距离）
A=[0 2 1 4 2;3 4 5 -1 -1];%变量系数
B=[54;62];%约束右侧系数          %Ac<=B
xm=[0,0,3.32,0.678,2.57]';%变量约束    P>=xm
P=intvar(5,1);%创建m*n的连续型决策变量矩阵
g=f'*P;
set=[];
set=[set;A*P<=B;xm<=P];
options=sdpsettings('solver','cplex');
optimize(set,g);
P=double(P)% 查看各变量取值
double(g)% 查看目标函数