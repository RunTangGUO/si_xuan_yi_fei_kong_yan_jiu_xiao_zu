clear;
load QP_model;
load ineq;
x1 = sdpvar(45,1);
x2 = binvar(54,1);
x = [x1;x2];
A = double(Q);
B=A(1:45,1:45);
AIneq1=double(AIneq);
% Q(28:63,:)=0;
% Q(:,28:63)=0;
obj=x1'*B*x1;
% Aineq=double(A);
% Aineq1=Aineq(:,1:27);
%Aineq2=Aineq(:,28:51);
% STb=[-5 6 -2 3];
% bineq=STb';
Aeq=double(coefficient(1:30,1:45));
%STA=[1 3 1 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
% STA=[0 0 0 5 5 5 5 5 5 10 5 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
STA=[1 3 1 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
% bineq=[-3 4 -5 0 -5 0 5 -3 4 -5 0 -5 0 5,...
%     -3 4 -5 0 -5 0 5 -3 4 -5 0 -5 0 5,...
%     -3 4 -5 0 -5 0 5 -3 4 -5 0 -5 0 5,...
%     -3 4 -5 0 -5 0 5 -3 4 -5 0 -5 0 5,...
%     -3 4 -5 0 -5 0 5 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3];
beq=STA';
Constraints=[];
Constraints=[Constraints,Aeq*x1==beq];
for i=1:79
    Constraints=[Constraints,AIneq1(i,:)*x<=bineq(1,i)];%+Aineq2(i,:)*x2
end
%Constraints=[Aeq*x==beq,Aineq*x<=bineq];%,integer(x(28:63)),0<=x(28:63)<=1
options=sdpsettings('solver','cplex');
sol=optimize(Constraints,obj,options);
X1= value(x);
% X2=value(x2);
% X=[X1' X2'];
% X=X';
for i=1:1:3
     for j=1:1:15
         rTp(i,j)=subs(rTp(i,j),rTp(i,j),X1((i-1)*15+j,1));
     end
 end
 rTp=double(rTp);
 rT1=sym([0;0;0]);
%  rT2=sym([0;0;0]);
for i=1:1:15
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
lx=0.45;ly=0.45;lz=0.25;
PeachPuff=[1 0.8549 0.72549];
BlanchedAlmond=[1 0.92157 0.80392];
Linen=[0.98039 0.94118 0.90196];
Maroon=[0.6902 0.18824 0.37647];
Red=[1 0 0];
DarkOrange=[1 0.54902 0];
x0=zeros(100,1);
y0=zeros(100,1);
z0=zeros(100,1);
for i=1:1000
    x0(i,1)=double(subs(rT1(1,1),'x',i/1000));
    y0(i,1)=double(subs(rT1(2,1),'x',i/1000));
    z0(i,1)=double(subs(rT1(3,1),'x',i/1000));
end
plot3(x0,y0,z0);
% x1=zeros(100,1);
% y1=zeros(100,1);
% z1=zeros(100,1);
% for i=1:100
%     x1(i,1)=double(subs(rT2(1,1),'x',(i+100)/100));
%     y1(i,1)=double(subs(rT2(2,1),'x',(i+100)/100));
%     z1(i,1)=double(subs(rT2(3,1),'x',(i+100)/100));
% end
% plot3(x1,y1,z1,'-.sr');
x=1;
y=3;
z=1;
plot3(x,y,z,'o');
text(x,y,z,'T0');
O=[x-0.225 y-0.225 z-0.175];
a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
plot3(a+O(1),b+O(2),c+O(3),'k');
hold on;fill3([0+O(1) 0+O(1) 0+O(1) 0+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[0+O(3) 0+O(3) lz+O(3) lz+O(3)],Maroon);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[ly+O(2) ly+O(2) ly+O(2) ly+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],Maroon);
hold on;fill3([lx+O(1) lx+O(1) lx+O(1) lx+O(1) ],[ly+O(2) ly+O(2) 0+O(2) 0+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],Maroon);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) 0+O(2) 0+O(2) 0+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],Maroon);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[lz+O(3) lz+O(3) lz+O(3) lz+O(3)],Maroon);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[0+O(3) 0+O(3) 0+O(3) 0+O(3)],Maroon);
x=5;
y=3;
z=1;
plot3(x,y,z,'o');
text(x,y,z,'T1');
O=[x-0.225 y-0.225 z-0.175];
a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
plot3(a+O(1),b+O(2),c+O(3),'k');
hold on;fill3([0+O(1) 0+O(1) 0+O(1) 0+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[0+O(3) 0+O(3) lz+O(3) lz+O(3)],Red);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[ly+O(2) ly+O(2) ly+O(2) ly+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],Red);
hold on;fill3([lx+O(1) lx+O(1) lx+O(1) lx+O(1) ],[ly+O(2) ly+O(2) 0+O(2) 0+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],Red);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) 0+O(2) 0+O(2) 0+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],Red);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[lz+O(3) lz+O(3) lz+O(3) lz+O(3)],Red);
hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[0+O(3) 0+O(3) 0+O(3) 0+O(3)],Red);
% x=10;
% y=5;
% z=5;
% plot3(x,y,z,'o');
% text(x,y,z,'T2');
% O=[x-0.225 y-0.225 z-0.175];
% a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
% b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
% c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
% plot3(a+O(1),b+O(2),c+O(3),'k');
% hold on;fill3([0+O(1) 0+O(1) 0+O(1) 0+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[0+O(3) 0+O(3) lz+O(3) lz+O(3)],DarkOrange);
% hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[ly+O(2) ly+O(2) ly+O(2) ly+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],DarkOrange);
% hold on;fill3([lx+O(1) lx+O(1) lx+O(1) lx+O(1) ],[ly+O(2) ly+O(2) 0+O(2) 0+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],DarkOrange);
% hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) 0+O(2) 0+O(2) 0+O(2)],[0+O(3) lz+O(3) lz+O(3) 0+O(3)],DarkOrange);
% hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[lz+O(3) lz+O(3) lz+O(3) lz+O(3)],DarkOrange);
% hold on;fill3([0+O(1) 0+O(1) lx+O(1) lx+O(1) ],[0+O(2) ly+O(2) ly+O(2) 0+O(2)],[0+O(3) 0+O(3) 0+O(3) 0+O(3)],DarkOrange);
% O=[2 0 0];
% lx=1;
% ly=5;
% lz=5;
% a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
% b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
% c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
% plot3(a+O(1),b+O(2),c+O(3),'k');
xlabel('X��');
ylabel('Y��');
zlabel('Z��');
grid on;
grid minor;
axis([0 8 0 10 0 10]);
hold off;