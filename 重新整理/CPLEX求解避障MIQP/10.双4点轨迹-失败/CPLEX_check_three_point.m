clear;
load QP_model;
x1 = sdpvar(108,1);
%x2 = binvar(24,1);
% x = [x1;x2];
Q = double(Q);
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
% STA=[0 0 0 5 5 5 5 5 5 10 5 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
beq=STA';
Constraints=[];
for i=1:57
    Constraints=[Constraints,Aeq(i,:)*x1==beq(i)];
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
for i=1:1:12
     for j=1:1:9
         rTp(i,j)=subs(rTp(i,j),rTp(i,j),X1((i-1)*9+j,1));
     end
 end
 rTp=double(rTp);
 rT1=sym([0;0;0]);
 rT2=sym([0;0;0]);
for i=1:1:9
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
    rT1(3,1)=rT1(3,1)+rTp(3,i)*p(i,1);
end
for i=1:1:9
    rT2(1,1)=rT2(1,1)+rTp(4,i)*p(i,2);
    rT2(2,1)=rT2(2,1)+rTp(5,i)*p(i,2);
    rT2(3,1)=rT2(3,1)+rTp(6,i)*p(i,2);
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
rTy0=5;
rTz0=1;
plot3(rTx0,rTy0,rTz0,'o');
text(rTx0,rTy0,rTz0,'T0');
an=double(x1);
rTx1=3;
rTy1=7;
rTz1=3;
plot3(rTx1,rTy1,rTz1,'o');
text(rTx1,rTy1,rTz1,'T1');
rTx2=6.5;
rTy2=4.5;
rTz2=5.5;
plot3(rTx2,rTy2,rTz2,'o');
text(rTx2,rTy2,rTz2,'T2');
% O=[3 0 0];
% lx=1;
% ly=5;
% lz=5;
% a=[0 lx lx 0  0 0  0  0  0 0  0  lx lx lx lx lx lx lx 0];
% b=[0 0  0  0  0 0  ly ly 0 ly ly ly ly 0  0  ly ly ly ly];
% c=[0 0  lz lz 0 lz lz 0  0 0  lz lz 0  0  lz lz 0  0  0];
% plot3(a+O(1),b+O(2),c+O(3),'k');
%%%%%%%%%%%%%%
 rT3=sym([0;0;0]);
 rT4=sym([0;0;0]);
for i=1:1:9
    rT3(1,1)=rT3(1,1)+rTp(7,i)*p(i,3);
    rT3(2,1)=rT3(2,1)+rTp(8,i)*p(i,3);
    rT3(3,1)=rT3(3,1)+rTp(9,i)*p(i,3);
end
for i=1:1:9
    rT4(1,1)=rT4(1,1)+rTp(10,i)*p(i,4);
    rT4(2,1)=rT4(2,1)+rTp(11,i)*p(i,4);
    rT4(3,1)=rT4(3,1)+rTp(12,i)*p(i,4);
end
hold on;
x0=zeros(1000,1);
y0=zeros(1000,1);
z0=zeros(1000,1);
for i=1:1000
    x0(i,1)=double(subs(rT3(1,1),'x',(i+2000)/1000));
    y0(i,1)=double(subs(rT3(2,1),'x',(i+2000)/1000));
    z0(i,1)=double(subs(rT3(3,1),'x',(i+2000)/1000));
end
plot3(x0,y0,z0,'g');
% x3=zeros(1000,1);
% y3=zeros(1000,1);
% z3=zeros(1000,1);
% for i=1:1000
%     x3(i,1)=double(subs(rT4(1,1),'x',(i+3000)/1000));
%     y3(i,1)=double(subs(rT4(2,1),'x',(i+3000)/1000));
%     z3(i,1)=double(subs(rT4(3,1),'x',(i+3000)/1000));
% end
plot3(x3,y3,z3,'m');
rTx0=9;
rTy0=3;
rTz0=8;
plot3(rTx0,rTy0,rTz0,'o');
text(rTx0,rTy0,rTz0,'T3');
an=double(x1);
rTx1=11;
rTy1=5;
rTz1=9;
plot3(rTx1,rTy1,rTz1,'o');
text(rTx1,rTy1,rTz1,'T4');
rTx2=9;
rTy2=7;
rTz2=8;
plot3(rTx2,rTy2,rTz2,'o');
text(rTx2,rTy2,rTz2,'T5');
%  rT5=sym([0;0;0]);
%  rT6=sym([0;0;0]);
% for i=1:1:9
%     rT5(1,1)=rT5(1,1)+rTp(13,i)*p(i,5);
%     rT5(2,1)=rT5(2,1)+rTp(14,i)*p(i,5);
%     rT5(3,1)=rT5(3,1)+rTp(15,i)*p(i,5);
% end
% rT2=sym(zeros(3,1));
% for i=1:1:9
%     rT6(1,1)=rT6(1,1)+rTp(16,i)*p(i,6);
%     rT6(2,1)=rT6(2,1)+rTp(17,i)*p(i,6);
%     rT6(3,1)=rT6(3,1)+rTp(18,i)*p(i,6);
% end
% hold on;
% x0=zeros(1000,1);
% y0=zeros(1000,1);
% z0=zeros(1000,1);
% for i=1:1000
%     x0(i,1)=double(subs(rT5(1,1),'x',(i+4000)/1000));
%     y0(i,1)=double(subs(rT5(2,1),'x',(i+4000)/1000));
%     z0(i,1)=double(subs(rT5(3,1),'x',(i+4000)/1000));
% end
% plot3(x0,y0,z0,'b');
% x3=zeros(1000,1);
% y3=zeros(1000,1);
% z3=zeros(1000,1);
% for i=1:1000
%     x3(i,1)=double(subs(rT6(1,1),'x',(i+5000)/1000));
%     y3(i,1)=double(subs(rT6(2,1),'x',(i+5000)/1000));
%     z3(i,1)=double(subs(rT6(3,1),'x',(i+5000)/1000));
% end
% plot3(x3,y3,z3,'r');
% rTx0=6.5;
% rTy0=5.5;
% rTz0=5.5;
% plot3(rTx0,rTy0,rTz0,'o');
% text(rTx0,rTy0,rTz0,'T6');
% an=double(x1);
% rTx1=2;
% rTy1=3;
% rTz1=3;
% plot3(rTx1,rTy1,rTz1,'o');
% text(rTx1,rTy1,rTz1,'T7');
% rTx2=1;
% rTy2=5;
% rTz2=1;
% plot3(rTx2,rTy2,rTz2,'o');
% text(rTx2,rTy2,rTz2,'T8');
% x0=zeros(1000,1);
% y0=zeros(1000,1);
% z0=zeros(1000,1);
%  rT7=sym([0;0;0]);
%  rT8=sym([0;0;0]);
% for i=1:1000
%     x0(i,1)=double(subs(rT7(1,1),'x',(i+6000)/1000));
%     y0(i,1)=double(subs(rT7(2,1),'x',(i+6000)/1000));
%     z0(i,1)=double(subs(rT7(3,1),'x',(i+6000)/1000));
% end
% plot3(x0,y0,z0,'g');
% x3=zeros(1000,1);
% y3=zeros(1000,1);
% z3=zeros(1000,1);
% for i=1:1000
%     x3(i,1)=double(subs(rT8(1,1),'x',(i+7000)/1000));
%     y3(i,1)=double(subs(rT8(2,1),'x',(i+7000)/1000));
%     z3(i,1)=double(subs(rT8(3,1),'x',(i+7000)/1000));
% end
% plot3(x3,y3,z3,'m');
xlabel('XÖá');
ylabel('YÖá');
zlabel('ZÖá');
% axis([0 8 0 10 0 10]);
hold off;