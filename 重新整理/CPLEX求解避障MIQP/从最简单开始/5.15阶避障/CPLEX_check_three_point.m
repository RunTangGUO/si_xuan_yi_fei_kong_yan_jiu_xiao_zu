clear;
load QP_model;
load ineq;
x1 = sdpvar(40,1);
x2 = binvar(8,1);
x = [x1;x2];
Q = double(Q);
% Q(28:63,:)=0;
% Q(:,28:63)=0;
obj=x1'*Q*x1;
AIneq=double(AIneq);
% Aineq1=Aineq(:,1:27);
%Aineq2=Aineq(:,28:51);
% STb=[-5 6 -2 3];
% bineq=STb';
Aeq=double(coefficient);
%STA=[1 3 1 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
%STA=[0 0 0 5 5 5 5 5 5 10 5 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
%STA=[1 1 5 5];
%STA=[1 1 5 1 0 0 0 0 0 0];
% STA=[1 1 5 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
beq=STA';
Constraints=[];
for i=1:8
    Constraints=[Constraints,Aeq(i,:)*x1==beq(i)];
end
% Constraints=[Constraints,AIneq*x1==bineq];
for i=1:16
    Constraints=[Constraints,AIneq(i,:)*x<=bineq(i)];%+Aineq2(i,:)*x2
end
%Constraints=[Aeq*x==beq,Aineq*x<=bineq];%,integer(x(28:63)),0<=x(28:63)<=1
options=sdpsettings('solver','cplex','verbose',2);
sol=optimize(Constraints,obj,options);
X1= value(x1);
double(x)
% X2=value(x2);
% X=[X1' X2'];
% X=X';
for i=1:1:2
     for j=1:1:20
         rTp(i,j)=subs(rTp(i,j),rTp(i,j),X1((i-1)*20+j,1));
     end
 end
 rTp=double(rTp);
 rT1=sym([0;0]);
for i=1:1:20
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
end
x0=zeros(100,1);
y0=zeros(100,1);
z0=zeros(100,1);
for i=1:100
    x0(i,1)=double(subs(rT1(1,1),'x',i/100));
    y0(i,1)=double(subs(rT1(2,1),'x',i/100));
end
plot(x0,y0,'-.sr');
hold on;
x=1;
y=1;
plot(x,y,'o');
text(x,y,'T0');
x=5;
y=1;
plot(x,y,'o');
text(x,y,'T1');
ax = 2;
ay = 0;
%ÉèÖÃ¾ØÐÎ³¤¿í
l = 2;
w = 2;
x = [ax,ax+l,ax+l,ax,ax];
y = [ay,ay,ay+w,ay+w,ay];
%»æÍ¼
line(x,y)
ax = double(subs(rT1(1,1),'x',0.33))-0.225;
ay = double(subs(rT1(2,1),'x',0.33))-0.225;
%ÉèÖÃ¾ØÐÎ³¤¿í
l = 0.45;
w = 0.45;
x = [ax,ax+l,ax+l,ax,ax];
y = [ay,ay,ay+w,ay+w,ay];
%»æÍ¼
line(x,y)
ax = double(subs(rT1(1,1),'x',0.66))-0.225;
ay = double(subs(rT1(2,1),'x',0.66))-0.225;
%ÉèÖÃ¾ØÐÎ³¤¿í
l = 0.45;
w = 0.45;
x = [ax,ax+l,ax+l,ax,ax];
y = [ay,ay,ay+w,ay+w,ay];
%»æÍ¼
line(x,y)
xlabel('XÖá');
ylabel('YÖá');
grid on;
grid minor;
% axis([-5 8 -5 6]);
hold off;