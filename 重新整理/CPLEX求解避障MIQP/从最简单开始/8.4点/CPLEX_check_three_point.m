clear;
load QP_model;
load ineq;
x1 = sdpvar(60,1);
x2 = binvar(12,1);
x=[x1;x2];
Q = double(Q);
% Q=A(1:40,1:40);
obj=x1'*Q*x1;
Aeq=double(coefficient);
% Aeq=aeq(:,1:52);
AIneq=double(AIneq);
%bineq=[-4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 3 3 3 3];
bineq=[-4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 1 1 1 1 1 1 1 1 3 3 3];
beq=STA';
Constraints=[];
Constraints=[Constraints,Aeq*x1==beq];
% for i=1:23
%     Constraints=[Constraints,AIneq(i,:)*x<=bineq(i)];
% end
% for i=27:30
%     Constraints=[Constraints,AIneq(i,:)*x==bineq(i)];
% end
options=sdpsettings('solver','cplex','verbose',2);
sol=optimize(Constraints,obj,options);
X1= value(x1);
double(x1)
for i=1:1:6
     for j=1:1:10
         rTp(i,j)=subs(rTp(i,j),rTp(i,j),X1((i-1)*10+j,1));
     end
 end
 rTp=double(rTp);
 rT1=sym([0;0]);
 rT2=sym([0;0]);
 rT3=sym([0;0]);
for i=1:1:10
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
    rT2(1,1)=rT2(1,1)+rTp(3,i)*p(i,1);
    rT2(2,1)=rT2(2,1)+rTp(4,i)*p(i,1);
    rT3(1,1)=rT3(1,1)+rTp(5,i)*p(i,1);
    rT3(2,1)=rT3(2,1)+rTp(6,i)*p(i,1);
end
x0=zeros(100,1);
y0=zeros(100,1);
for i=1:100
    x0(i,1)=double(subs(rT1(1,1),'x',i/100));
    y0(i,1)=double(subs(rT1(2,1),'x',i/100));
end
plot(x0,y0,'-.sr');
hold on;
x0=zeros(100,1);
y0=zeros(100,1);
for i=1:100
    x0(i,1)=double(subs(rT2(1,1),'x',i/100));
    y0(i,1)=double(subs(rT2(2,1),'x',i/100));
end
plot(x0,y0,'-.sr');
hold on;
x0=zeros(100,1);
y0=zeros(100,1);
for i=1:100
    x0(i,1)=double(subs(rT3(1,1),'x',i/100));
    y0(i,1)=double(subs(rT3(2,1),'x',i/100));
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
ax = double(subs(rT1(1,1),'x',1))-0.225;
ay = double(subs(rT1(2,1),'x',1))-0.225;
%ÉèÖÃ¾ØÐÎ³¤¿í
l = 0.45;
w = 0.45;
x = [ax,ax+l,ax+l,ax,ax];
y = [ay,ay,ay+w,ay+w,ay];
%»æÍ¼
line(x,y)
ax = double(subs(rT2(1,1),'x',1))-0.225;
ay = double(subs(rT2(2,1),'x',1))-0.225;
%ÉèÖÃ¾ØÐÎ³¤¿í
l = 0.45;
w = 0.45;
x = [ax,ax+l,ax+l,ax,ax];
y = [ay,ay,ay+w,ay+w,ay];
%»æÍ¼
line(x,y)
ax = double(subs(rT2(1,1),'x',0.5))-0.225;
ay = double(subs(rT2(2,1),'x',0.5))-0.225;
%ÉèÖÃ¾ØÐÎ³¤¿í
l = 0.45;
w = 0.45;
x = [ax,ax+l,ax+l,ax,ax];
y = [ay,ay,ay+w,ay+w,ay];
%»æÍ¼
% line(x,y)
xlabel('XÖá');
ylabel('YÖá');
grid on;
grid minor;
% axis([-5 8 -5 6]);
hold off;