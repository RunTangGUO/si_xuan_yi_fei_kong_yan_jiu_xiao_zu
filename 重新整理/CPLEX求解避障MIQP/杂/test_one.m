% value:5 constraint:2   ���Թ滮
% max z=2x1+x2+4x3+3x4+x5
% 2x2+x3+4x4+2x5<=54
% 3x1+4x2+5x3-x4-x5<=62
% x1,x2<=0,x3<=3.32,x4<=0.678,x5<=2.57
f=-[2 1 4 3 1]';%Ŀ�꺯��ϵ�� ��ÿ���߶�Ӧ�ľ��룩
A=[0 2 1 4 2;3 4 5 -1 -1];%����ϵ��
B=[54;62];%Լ���Ҳ�ϵ��          %Ac<=B
xm=[0,0,3.32,0.678,2.57]';%����Լ��    P>=xm
P=intvar(5,1);%����m*n�������;��߱�������
g=f'*P;
set=[];
set=[set;A*P<=B;xm<=P];
options=sdpsettings('solver','cplex');
optimize(set,g);
P=double(P)% �鿴������ȡֵ
double(g)% �鿴Ŀ�꺯��