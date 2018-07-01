% max z=4x1+6x2+2x3
% -x1+3x2<=8
% -x2+3x3<=10
% 5x1-x3<=8
% x1,x2,x3>=0且为整数
 
% 目标函数 决策变量，整数型：intvar 连续型：sdpvar 二值型：binvar
x=intvar(1,3);
f=[4 6 2]*x';
% 约束x1,x2,x3
set=[x>0;[-1 3 0]*x'<=8;[0 -1 3]*x'<=10;[5 0 -1]*x'<=8];
%在约束F下求目标函数f最大值
optimize(set,-f);
% 查看目标函数
double(f)
% 查看各变量取值
double(x)