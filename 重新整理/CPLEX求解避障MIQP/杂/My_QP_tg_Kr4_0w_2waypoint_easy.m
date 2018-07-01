clear all;
syms x;
syms T0;
syms T1;
syms T2;
n = 3;
t =2*(x-T0)/(T1-T0)-1;
p=sym(zeros(9,2));
%障碍物的x,y,z范围参数
Obstacle=[2 3;0 5;0 5];
Obs_n1=[1 0 0];
Obs_n2=[-1 0 0];
Obs_n3=[0 1 0];
Obs_n4=[0 -1 0];
Obs_n5=[0 0 1];
Obs_n6=[0 0 -1];
F=6;
K=5;
N=1;%障碍的个数
M=1000;
for i=0:N-1
    for j=1:F
        for k=0:K
            eval(['syms ' 'b',num2str(i),num2str(j),num2str(k)]); 
        end
    end
end
for i=1:1:5
    a = shifted_legendre(t,i);
    a = int(int(int(int(a,x),x),x),x);
    p(i,1)=a;
end
for i=6:1:9
    p(i,1)=(x-T0)^(i-9+4-1);
end
% t=2*(x-T1)/(T2-T1)-1;
% for i=1:1:5
%     a = shifted_legendre(t,i);
%     a = int(int(int(int(a,x),x),x),x);
%     p(i,2)=a;
% end
% for i=6:1:9
%     p(i,2)=(x-T1)^(i-9+4-1);
% end
syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;
syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;
syms z11;syms z12;syms z13;syms z14;syms z15;syms z16;syms z17;syms z18;syms z19;
% syms x21;syms x22;syms x23;syms x24;syms x25;syms x26;syms x27;syms x28;syms x29;
% syms y21;syms y22;syms y23;syms y24;syms y25;syms y26;syms y27;syms y28;syms y29;
% syms z21;syms z22;syms z23;syms z24;syms z25;syms z26;syms z27;syms z28;syms z29;
rTp=[x11 x12 x13 x14 x15 x16 x17 x18 x19;...
     y11 y12 y13 y14 y15 y16 y17 y18 y19;...
     z11 z12 z13 z14 z15 z16 z17 z18 z19];
rT1=sym(zeros(3,1));
for i=1:1:9
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
    rT1(3,1)=rT1(3,1)+rTp(3,i)*p(i,1);
end
min=int(subs(rT1(1,1)^2+rT1(2,1)^2+rT1(3,1)^2,{'T0','T1'},{0,1}),x,0,1);
rT10x=subs(rT1(1,1),{'x','T0','T1'},{0,0,1});
rT10y=subs(rT1(2,1),{'x','T0','T1'},{0,0,1});
rT10z=subs(rT1(3,1),{'x','T0','T1'},{0,0,1});
rT11x=subs(rT1(1,1),{'x','T0','T1'},{1,0,1});
rT11y=subs(rT1(2,1),{'x','T0','T1'},{1,0,1});
rT11z=subs(rT1(3,1),{'x','T0','T1'},{1,0,1});
%测试数值为0在端点
dx11=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,0);
dx21=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),2),x,0);
dx31=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),3),x,0);
dx41=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),4),x,0);
dy11=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,0);
dy21=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),2),x,0);
dy31=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),3),x,0);
dy41=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),4),x,0);
dz11=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),1),x,0);
dz21=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),2),x,0);
dz31=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),3),x,0);
dz41=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),4),x,0);
dx12=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,1);
dx22=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),2),x,1);
dx32=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),3),x,1);
dx42=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),4),x,1);
dy12=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,1);
dy22=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),2),x,1);
dy32=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),3),x,1);
dy42=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),4),x,1);
dz12=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),1),x,1);
dz22=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),2),x,1);
dz32=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),3),x,1);
dz42=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),4),x,1);
% N010=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n1(1,3)+M*b010);
% N011=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n1(1,3)+M*b011);
% N012=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n1(1,3)+M*b012);
% N013=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n1(1,3)+M*b013);
% N014=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n1(1,3)+M*b014);
% N015=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n1(1,3)+M*b015);
% N030=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n3(1,3)+M*b030);
% N031=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n3(1,3)+M*b031);
% N032=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n3(1,3)+M*b032);
% N033=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n3(1,3)+M*b033);
% N034=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n3(1,3)+M*b034);
% N035=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n3(1,3)+M*b035);
% N050=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n5(1,3)+M*b050);
% N051=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n5(1,3)+M*b051);
% N052=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n5(1,3)+M*b052);
% N053=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n5(1,3)+M*b053);
% N054=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n5(1,3)+M*b054);
% N055=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n5(1,3)+M*b055);
% N020=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n2(1,3))-M*b020;
% N021=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n2(1,3))-M*b021;
% N022=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n2(1,3))-M*b022;
% N023=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n2(1,3))-M*b023;
% N024=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n2(1,3))-M*b024;
% N025=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n2(1,3))-M*b025;
% N040=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n4(1,3))-M*b040;
% N041=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n4(1,3))-M*b041;
% N042=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n4(1,3))-M*b042;
% N043=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n4(1,3))-M*b043;
% N044=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n4(1,3))-M*b044;
% N045=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n4(1,3))-M*b045;
% N060=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n6(1,3))-M*b060;
% N061=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n6(1,3))-M*b061;
% N062=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n6(1,3))-M*b062;
% N063=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n6(1,3))-M*b063;
% N064=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n6(1,3))-M*b064;
% N065=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n6(1,3))-M*b065;
N010=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n1(1,3)+M*b010);
N011=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n1(1,3)+M*b011);
N012=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n1(1,3)+M*b012);
N013=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n1(1,3)+M*b013);
N014=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n1(1,3)+M*b014);
N015=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n1(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n1(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n1(1,3)+M*b015);
N030=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n3(1,3)+M*b030);
N031=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n3(1,3)+M*b031);
N032=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n3(1,3)+M*b032);
N033=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n3(1,3)+M*b033);
N034=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n3(1,3)+M*b034);
N035=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n3(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n3(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n3(1,3)+M*b035);
N050=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n5(1,3)+M*b050);
N051=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n5(1,3)+M*b051);
N052=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n5(1,3)+M*b052);
N053=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n5(1,3)+M*b053);
N054=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n5(1,3)+M*b054);
N055=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n5(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n5(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n5(1,3)+M*b055);
N020=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n2(1,3))-M*b020;
N021=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n2(1,3))-M*b021;
N022=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n2(1,3))-M*b022;
N023=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n2(1,3))-M*b023;
N024=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n2(1,3))-M*b024;
N025=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n2(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n2(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n2(1,3))-M*b025;
N040=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n4(1,3))-M*b040;
N041=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n4(1,3))-M*b041;
N042=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n4(1,3))-M*b042;
N043=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n4(1,3))-M*b043;
N044=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n4(1,3))-M*b044;
N045=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n4(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n4(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n4(1,3))-M*b045;
N060=-(subs(rT1(1,1),{'x',T0,T1},{0,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0,0,1})*Obs_n6(1,3))-M*b060;
N061=-(subs(rT1(1,1),{'x',T0,T1},{0.2,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.2,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.2,0,1})*Obs_n6(1,3))-M*b061;
N062=-(subs(rT1(1,1),{'x',T0,T1},{0.4,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.4,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.4,0,1})*Obs_n6(1,3))-M*b062;
N063=-(subs(rT1(1,1),{'x',T0,T1},{0.6,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.6,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.6,0,1})*Obs_n6(1,3))-M*b063;
N064=-(subs(rT1(1,1),{'x',T0,T1},{0.8,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{0.8,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{0.8,0,1})*Obs_n6(1,3))-M*b064;
N065=-(subs(rT1(1,1),{'x',T0,T1},{1,0,1})*Obs_n6(1,1)+subs(rT1(2,1),{'x',T0,T1},{1,0,1})*Obs_n6(1,2)+subs(rT1(3,1),{'x',T0,T1},{1,0,1})*Obs_n6(1,3))-M*b065;
%关于障碍物的约束
% for i=0:N-1
%     for j=1:F
%         for k=0:K
%             if rem(k,2)==1
%                 eval(['N',num2str(i),num2str(j),num2str(k),'=-(','Obs_n',num2str(j),'(1)','*','subs(subs(subs(rT1(1,1),x,0.2*k),T0,0),T1,1)','+','Obs_n',num2str(j),'(2)','*','subs(subs(subs(rT1(2,1),x,0.2*k),T0,0),T1,1)','+','Obs_n',num2str(j),'(3)','*','subs(subs(subs(rT1(3,1),x,0.2*k),T0,0),T1,1)','+','M','*','b',num2str(i),num2str(j),num2str(k),')']);
%             else
%                 eval(['N',num2str(i),num2str(j),num2str(k),'=','Obs_n',num2str(j),'(1)','*','subs(subs(subs(rT1(1,1),x,0.2*k),T0,0),T1,1)','+','Obs_n',num2str(j),'(2)','*','subs(subs(subs(rT1(2,1),x,0.2*k),T0,0),T1,1)','+','Obs_n',num2str(j),'(3)','*','subs(subs(subs(rT1(3,1),x,0.2*k),T0,0),T1,1)','-','M','*','b',num2str(i),num2str(j),num2str(k)]);
%             end
%         end
%     end
% end
for i=0:K
    eval(['EB',num2str(i),'=b',num2str(0),num2str(1),num2str(i),'+b',num2str(0),num2str(2),num2str(i),'+b',num2str(0),num2str(3),num2str(i),'+b',num2str(0),num2str(4),num2str(i),'+b',num2str(0),num2str(5),num2str(i),'+b',num2str(0),num2str(6),num2str(i)])
end
% %转折点处导数连续
% dx1x2=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),1),x,1);
% dy1y2=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),1),x,1);
% dz1z2=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),1),x,1);
Q=sym(zeros(27));
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19,...
     z11 z12 z13 z14 z15 z16 z17 z18 z19,...
     b010 b020 b030 b040 b050 b060,...
     b011 b021 b031 b041 b051 b061,...
     b012 b022 b032 b042 b052 b062,...
     b013 b023 b033 b043 b053 b063,...
     b014 b024 b034 b044 b054 b064,...
     b015 b025 b035 b045 b055 b065];
 for i=1:1:27
     for j=1:1:i
         if i==j
             Q(i,i)=min;
             for k=1:1:27
                 if k~=i
                     Q(i,i)=subs(Q(i,i),rTpL(k),0);
                 end
             end
             Q(i,i)=2*Q(i,i)/rTpL(i)^2;
         else
             Q(i,j)=diff(diff(min,rTpL(1,i),1),rTpL(1,j),1);
             Q(j,i)=Q(i,j);
         end
     end
 end
 H=sym(zeros(1,27));
 for i=1:1:27
     H(1,i)=min;
     for j=1:1:27
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i)/2,rTpL(1,i),1);
 end
STP=[rT10x rT10y rT10z rT11x rT11y rT11z dx11 dx21 dx31 dx41 dy11 dy21 dy31 dy41 dz11 dz21 dz31 dz41 dx12 dx22 dx32 dx42 dy12 dy22 dy32 dy42 dz12 dz22 dz32 dz42];
STA=[1 3 1 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
STa=[ N010 N020 N030 N040 N050 N060 N011 N021 N031 N041 N051 N061 N012 N022 N032 N042 N052 N062 N013 N023 N033 N043 N053 N063 N014 N024 N034 N044 N054 N064 N015 N025 N035 N045 N055 N065 EB0 EB1 EB2 EB3 EB4 EB5];
STb=[-Obstacle(1,1) Obstacle(1,2) -Obstacle(2,1) Obstacle(2,2) -Obstacle(3,1) Obstacle(3,2) -Obstacle(1,1) Obstacle(1,2) -Obstacle(2,1) Obstacle(2,2) -Obstacle(3,1) Obstacle(3,2) -Obstacle(1,1) Obstacle(1,2) -Obstacle(2,1) Obstacle(2,2) -Obstacle(3,1) Obstacle(3,2) -Obstacle(1,1) Obstacle(1,2) -Obstacle(2,1) Obstacle(2,2) -Obstacle(3,1) Obstacle(3,2) -Obstacle(1,1) Obstacle(1,2) -Obstacle(2,1) Obstacle(2,2) -Obstacle(3,1) Obstacle(3,2) -Obstacle(1,1) Obstacle(1,2) -Obstacle(2,1) Obstacle(2,2) -Obstacle(3,1) Obstacle(3,2) 5 5 5 5 5 5];
coefficient=sym(zeros(30,27));
%rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19 y11 y12 y13 y14 y15 y16 y17 y18 y19 z11 z12 z13 z14 z15 z16 z17 z18 z19 b010 b011 b012 b013 b014 b015 b020 b021 b022 b023 b024 b025 b030 b031 b032 b033 b034 b035 b040 b041 b042 b043 b044 b045 b050 b051 b052 b053 b054 b055 b060 b061 b062 b063 b064 b065 EB0 EB1 EB2 EB3 EB4 EB5];
a=eye(63);
for i=1:1:6
    parfor j=1:1:27+36
        coefficient(i,j)=STP(i);
%         rTpL=a(:,j);
%         coefficient(i,j)=subs(coefficient(i,j))
        for k=1:1:27+36
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0)
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
%逐位计算等式约束中的系数矩阵
for i=7:1:30
    parfor j=1:1:27+36
        coefficient(i,j)=STP(i);
%         rTpL=a(:,j);
%         coefficient(i,j)=subs(coefficient(i,j))
        for k=1:1:27+36
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
%计算A的系数矩阵
[~,I]=size(STa);
A=sym(zeros(I,27));
for i=1:1:I
    parfor j=1:1:27+36
        A(i,j)=STa(i);
%         rTpL=a(j,:);
%         A(i,j)=subs(A(i,j));
        for k=1:1:27+36
            if k~=j
                A(i,j)=subs(A(i,j),rTpL(k),0);
            end
        end
        A(i,j)=A(i,j)/rTpL(j);
    end
end
save QP_model_2wayponit_&_Obstacle