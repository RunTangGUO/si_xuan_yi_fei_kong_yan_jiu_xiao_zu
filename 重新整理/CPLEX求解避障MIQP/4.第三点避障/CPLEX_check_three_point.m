clear;
load QP_model;
load ineq;
x1 = sdpvar(57,1);
x2 = binvar(4,1);
% x = [x1;x2];
Q = double(Q);
AIneq=double(AIneq);
% Q(28:63,:)=0;
% Q(:,28:63)=0;
obj=x1'*Q*x1;
% Aineq=double(A);
% Aineq1=Aineq(:,1:27);
%Aineq2=Aineq(:,28:51);
% STb=[-5 6 -2 3];
% bineq=STb';
Aeq=double(coefficient);
%STA=[1 3 1 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
STA=[1 3 1 0 0 0 0 0 0 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
beq=STA';
% bineq=[-2 3 -5 6 0 3];
bineq=[-2 2.7 -5.5 0 -5 -2 3];
Constraints=[];
for i=1:39
    Constraints=[Constraints,Aeq(i,1:57)*x1==beq(i)];
end
for i=1:7
    Constraints=[Constraints,AIneq(i,1:57)*x1+AIneq(i,58:61)*x2<=bineq(i)];
end
% for i=1:4
%     Constraints=[Constraints,Aineq1(i,:)*x1<=bineq(i)];%+Aineq2(i,:)*x2
% end
%Constraints=[Aeq*x==beq,Aineq*x<=bineq];%,integer(x(28:63)),0<=x(28:63)<=1
options=sdpsettings('solver','cplex');
sol=optimize(Constraints,obj,options);
X1= value(x1);
% X2=value(x2);
% X=[X1' X2'];
% X=X';
for i=1:1:6
     for j=1:1:9
         rTp(i,j)=subs(rTp(i,j),rTp(i,j),X1((i-1)*9+j,1));
     end
 end
 rTp=double(rTp);
 rT1=sym([0;0;0]);
 rT2=sym([0;0;0]);
for i=1:1:9
    rT1(1,1)=subs(rT1(1,1)+rTp(1,i)*p(i,1),{T0,T1},{0,1});
    rT1(2,1)=subs(rT1(2,1)+rTp(2,i)*p(i,1),{T0,T1},{0,1});
    rT1(3,1)=subs(rT1(3,1)+rTp(3,i)*p(i,1),{T0,T1},{0,1});
end
rT2=sym(zeros(3,1));
for i=1:1:9
    rT2(1,1)=subs(rT2(1,1)+rTp(4,i)*p(i,2),{T1,T2},{1,2});
    rT2(2,1)=subs(rT2(2,1)+rTp(5,i)*p(i,2),{T1,T2},{1,2});
    rT2(3,1)=subs(rT2(3,1)+rTp(6,i)*p(i,2),{T1,T2},{1,2});
end
hold on;
x0=zeros(1000,1);
y0=zeros(1000,1);
z0=zeros(1000,1);
for i=1:1000
    x0(i,1)=double(subs(rT1(1,1),'x',i/1000));
    y0(i,1)=double(subs(rT1(2,1),'x',i/1000));
    z0(i,1)=double(subs(rT1(3,1),'x',i/1000));
end
plot3(x0,y0,z0,'b');
x3=zeros(1000,1);
y3=zeros(1000,1);
z3=zeros(1000,1);
for i=1:1000
    x3(i,1)=double(subs(rT2(1,1),'x',(i+1000)/1000));
    y3(i,1)=double(subs(rT2(2,1),'x',(i+1000)/1000));
    z3(i,1)=double(subs(rT2(3,1),'x',(i+1000)/1000));
end
plot3(x3,y3,z3,'r');
rTx0=1;
rTy0=3;
rTz0=1;
plot3(rTx0,rTy0,rTz0,'o');
text(rTx0,rTy0,rTz0,'T0');
an=double(x1);
rTx1=an(55);
rTy1=an(56);
rTz1=an(57);
plot3(rTx1,rTy1,rTz1,'o');
text(rTx1,rTy1,rTz1,'T1');
rTx2=5;
rTy2=3;
rTz2=1;
plot3(rTx2,rTy2,rTz2,'o');
text(rTx2,rTy2,rTz2,'T2');
O=[2 0 0];
lx=1;
ly=5;
lz=5;
a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
plot3(a+O(1),b+O(2),c+O(3),'k');
xlabel('X��');
ylabel('Y��');
zlabel('Z��');
grid on;
axis([0 8 0 10 0 10]);
hold off;