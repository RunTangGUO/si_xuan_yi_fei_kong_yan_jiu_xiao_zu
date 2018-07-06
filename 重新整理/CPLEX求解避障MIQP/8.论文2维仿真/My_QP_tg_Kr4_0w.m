clear all;
syms x;
syms T0;
syms T1;
syms T2;
n = 3;
t =2*(x-T0)/(T1-T0)-1;
p=sym(zeros(15,2));
for i=1:1:11
    a = shifted_legendre(t,i);
    a = int(int(int(int(a,x),x),x),x);
    p(i,1)=a;
end
for i=12:1:15
    p(i,1)=(x-T0)^(i-15+4-1);
end
syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;syms x110;syms x111;syms x112;syms x113;syms x114;syms x115;
syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;syms y110;syms y111;syms y112;syms y113;syms y114;syms y115;
rTp=[x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115;...
     y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115];
rT1=sym(zeros(2,1));
for i=1:1:15
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
end
min=int(subs(diff(rT1(1,1),4)^2+diff(rT1(2,1),4)^2,{'T0','T1'},{0,1}),x,0,1);
rT10x=subs(rT1(1,1),{'x','T0','T1'},{0,0,1});
rT10y=subs(rT1(2,1),{'x','T0','T1'},{0,0,1});
rT11x=subs(rT1(1,1),{'x','T0','T1'},{1,0,1});
rT11y=subs(rT1(2,1),{'x','T0','T1'},{1,0,1});
%测试数值为0在端点
dx10=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,0);
dx20=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),2),x,0);
dx30=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),3),x,0);
dx40=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),4),x,0);
dy10=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,0);
dy20=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),2),x,0);
dy30=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),3),x,0);
dy40=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),4),x,0);
dx11=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,1);
dx21=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),2),x,1);
dx31=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),3),x,1);
dx41=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),4),x,1);
dy11=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,1);
dy21=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),2),x,1);
dy31=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),3),x,1);
dy41=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),4),x,1);
Q=sym(zeros(30));
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115];
 for i=1:1:30
     for j=1:1:i
         if i==j
             Q(i,i)=min;
             for k=1:1:30
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
 H=sym(zeros(1,30));
 parfor i=1:1:30
     H(1,i)=min;
     for j=1:1:30
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i)/2,rTpL(1,i),1);
 end
STP=[rT10x rT10y rT11x rT11y dx10 dx20 dx30 dx40 dy10 dy20 dy30 dy40 dx11 dx21 dx31 dx41 dy11 dy21 dy31 dy41];
STA=[0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
coefficient=sym(zeros(20,30));
for i=1:1:20
    parfor j=1:1:30
        coefficient(i,j)=STP(i);
        for k=1:1:30
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
save QP_model