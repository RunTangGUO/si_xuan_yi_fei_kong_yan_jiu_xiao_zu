clear;
load QP_model_2wayponit_&_Obstacle;
x1 = sdpvar(27,1);
x2 = binvar(36,1);
% x = [x1;x2];
Q = double(Q);
% Q(28:63,:)=0;
% Q(:,28:63)=0;
obj=x1'*Q*x1;
Aineq=double(A);
Aineq1=Aineq(:,1:27);
Aineq2=Aineq(:,28:63);
STb=[3 2 5 0 5 0 3 2 5 0 5 0 3 2 5 0 5 0 3 2 5 0 5 0 3 2 5 0 5 0 3 2 5 0 5 0 5 5 5 5 5 5];
bineq=STb';
Aeq=double(coefficient);
STA=[1 3 1 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
beq=STA';
Constraints=[];
for i=1:30
    Constraints=[Constraints,Aeq(i,1:27)*x1==beq(i)];
end
% for i=1:42
%     Constraints=[Constraints,Aineq1(i,:)*x1+Aineq2(i,:)*x2<=bineq(i)];
% end
%Constraints=[Aeq*x==beq,Aineq*x<=bineq];%,integer(x(28:63)),0<=x(28:63)<=1
options=sdpsettings('solver','cplex');
sol=optimize(Constraints,obj,options);
X1= value(x1);
X2=value(x2);
X=[X1' X2'];
X=X';
for i=1:1:3
     for j=1:1:9
         rTp(i,j)=subs(rTp(i,j),rTp(i,j),X((i-1)*9+j,1));
     end
 end
 rTp=double(rTp);
 rT1=sym([0;0;0]);
%  rT2=sym([0;0;0]);
for i=1:1:9
    rT1(1,1)=subs(rT1(1,1)+rTp(1,i)*p(i,1),{T0,T1},{0,1});
    rT1(2,1)=subs(rT1(2,1)+rTp(2,i)*p(i,1),{T0,T1},{0,1});
    rT1(3,1)=subs(rT1(3,1)+rTp(3,i)*p(i,1),{T0,T1},{0,1});
end
% rT2=sym(zeros(3,1));
% for i=1:1:9
%     rT2(1,1)=subs(rT2(1,1)+rTp(4,i)*p(i,2),{T1,T2},{1,2});
%     rT2(2,1)=subs(rT2(2,1)+rTp(5,i)*p(i,2),{T1,T2},{1,2});
%     rT2(3,1)=subs(rT2(3,1)+rTp(6,i)*p(i,2),{T1,T2},{1,2});
% end
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
% x1=zeros(1000,1);
% y1=zeros(1000,1);
% z1=zeros(1000,1);
% for i=1:1000
%     x1(i,1)=double(subs(rT2(1,1),'x',(i+1000)/1000));
%     y1(i,1)=double(subs(rT2(2,1),'x',(i+1000)/1000));
%     z1(i,1)=double(subs(rT2(3,1),'x',(i+1000)/1000));
% end
% plot3(x1,y1,z1,'b');
x=1;
y=3;
z=1;
plot3(x,y,z,'o');
text(x,y,z,'T0');
x=5;
y=3;
z=1;
plot3(x,y,z,'o');
text(x,y,z,'T1');
% x=7;
% y=1;
% z=9;
% plot3(x,y,z,'o');
% text(x,y,z,'T2');
O=[2 0 0];
lx=1;
ly=5;
lz=5;
a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
plot3(a+O(1),b+O(2),c+O(3),'k');
xlabel('XÖá');
ylabel('YÖá');
zlabel('ZÖá');
axis([0 8 0 10 0 10]);
hold off;