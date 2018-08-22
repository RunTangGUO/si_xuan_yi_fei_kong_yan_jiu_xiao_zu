clear all;
syms x;
p=sym(zeros(18,1));
for i=1:1:16
    a = shifted_legendre(x,i);
    a = int(int(int(int(a,x),x),x),x);
    p(i+4,1)=a;
end
% for i=6:1:9
%     p(i,1)=(x-T0)^(i-9+4-1);
% end
for i=1:1:4
    p(i,1)=x^(i-1);
end
syms x01;syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;syms x110;syms x111;syms x112;syms x113;syms x114;syms x115;syms x116;syms x117;syms x118;syms x119;
syms y01;syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;syms y110;syms y111;syms y112;syms y113;syms y114;syms y115;syms y116;syms y117;syms y118;syms y119;
rTp=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115 x116 x117 x118 x119;...
     y01 y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115 y116 y117 y118 y119];
rT1=sym(zeros(2,1));
for i=1:1:20
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
end
min=int(diff(rT1(1,1),2)^2+diff(rT1(2,1),2)^2,'x',0,1);
rT10x=subs(rT1(1,1),{'x'},{0});
rT10y=subs(rT1(2,1),{'x'},{0});
rT11x=subs(rT1(1,1),{'x'},{1});
rT11y=subs(rT1(2,1),{'x'},{1});
%������ֵΪ0�ڶ˵�
dx11=limit(diff(rT1(1,1),1),x,0);
dx21=limit(diff(rT1(1,1),1),x,1);
dy11=limit(diff(rT1(2,1),1),x,0);
dy21=limit(diff(rT1(2,1),1),x,1);
dx12=limit(diff(rT1(1,1),2),x,0);
dx22=limit(diff(rT1(1,1),2),x,1);
dy12=limit(diff(rT1(2,1),2),x,0);
dy22=limit(diff(rT1(2,1),2),x,1);
dy13=limit(diff(rT1(2,1),3),x,0);
dy23=limit(diff(rT1(2,1),3),x,1);
dx13=limit(diff(rT1(1,1),3),x,0);
dx23=limit(diff(rT1(1,1),3),x,1);
dy14=limit(diff(rT1(2,1),4),x,0);
dy24=limit(diff(rT1(2,1),4),x,1);
dx14=limit(diff(rT1(1,1),4),x,0);
dx24=limit(diff(rT1(1,1),4),x,1);
%ת�۵㴦��������
% dx1x2=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),1),x,1);
% dy1y2=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),1),x,1);
% dz1z2=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),1),x,1);
Q=sym(zeros(22));
rTpL=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115 x116 x117 x118 x119,...
     y01 y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115 y116 y117 y118 y119];
 for i=1:1:40
     for j=1:1:i
         if i==j
             Q(i,i)=min;
             for k=1:1:40
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
 H=sym(zeros(1,40));
 for i=1:1:40
     H(1,i)=min;
     for j=1:1:40
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i)/2,rTpL(1,i),1);
 end
STP=[rT10x rT10y rT11x rT11y dx11 dy11 dx21 dy21 dx12 dx22 dy12 dy22 dy13 dy23 dx13 dx23 dy14 dy24 dx14 dx24];
STA=[1 1 5 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
coefficient=sym(zeros(20,40));
for i=1:1:20
    for j=1:1:40
        coefficient(i,j)=STP(i);
        for k=1:1:40
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
save QP_model