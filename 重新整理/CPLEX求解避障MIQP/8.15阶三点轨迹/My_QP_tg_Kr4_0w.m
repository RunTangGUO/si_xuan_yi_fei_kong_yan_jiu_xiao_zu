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
t=2*(x-T1)/(T2-T1)-1;
for i=1:1:11
    a = shifted_legendre(t,i);
    a = int(int(int(int(a,x),x),x),x);
    p(i,2)=a;
end
for i=12:1:15
    p(i,2)=(x-T1)^(i-15+4-1);
end
syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;syms x110;syms x111;syms x112;syms x113;syms x114;syms x115;
syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;syms y110;syms y111;syms y112;syms y113;syms y114;syms y115;
syms z11;syms z12;syms z13;syms z14;syms z15;syms z16;syms z17;syms z18;syms z19;syms z110;syms z111;syms z112;syms z113;syms z114;syms z115;
syms x21;syms x22;syms x23;syms x24;syms x25;syms x26;syms x27;syms x28;syms x29;syms x210;syms x211;syms x212;syms x213;syms x214;syms x215;
syms y21;syms y22;syms y23;syms y24;syms y25;syms y26;syms y27;syms y28;syms y29;syms y210;syms y211;syms y212;syms y213;syms y214;syms y215;
syms z21;syms z22;syms z23;syms z24;syms z25;syms z26;syms z27;syms z28;syms z29;syms z210;syms z211;syms z212;syms z213;syms z214;syms z215;
rTp=[x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115;...
     y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115;...
     z11 z12 z13 z14 z15 z16 z17 z18 z19 z110 z111 z112 z113 z114 z115;...
     x21 x22 x23 x24 x25 x26 x27 x28 x29 x210 x211 x212 x213 x214 x215;...
     y21 y22 y23 y24 y25 y26 y27 y28 y29 y210 y211 y212 y213 y214 y215;...
     z21 z22 z23 z24 z25 z26 z27 z28 z29 z210 z211 z212 z213 z214 z215];
rT1=sym(zeros(3,1));
for i=1:1:15
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
    rT1(3,1)=rT1(3,1)+rTp(3,i)*p(i,1);
end
rT2=sym(zeros(3,1));
for i=1:1:15
    rT2(1,1)=rT2(1,1)+rTp(4,i)*p(i,2);
    rT2(2,1)=rT2(2,1)+rTp(5,i)*p(i,2);
    rT2(3,1)=rT2(3,1)+rTp(6,i)*p(i,2);
end
min=int(subs(diff(rT1(1,1),4)^2+diff(rT1(2,1),4)^2+diff(rT1(3,1),4)^2,{'T0','T1'},{0,1}),x,0,1);
min=min+int(subs(diff(rT2(1,1),x,4)^2+diff(rT2(2,1),x,4)^2+diff(rT2(3,1),x,4)^2,{'T1','T2'},{1,2}),x,1,2);
rT10x=subs(rT1(1,1),{'x','T0','T1'},{0,0,1});
rT10y=subs(rT1(2,1),{'x','T0','T1'},{0,0,1});
rT10z=subs(rT1(3,1),{'x','T0','T1'},{0,0,1});
rT11x=subs(rT1(1,1),{'x','T0','T1'},{1,0,1});
rT11y=subs(rT1(2,1),{'x','T0','T1'},{1,0,1});
rT11z=subs(rT1(3,1),{'x','T0','T1'},{1,0,1});
rT21x=subs(rT2(1,1),{'x','T1','T2'},{1,1,2});
rT21y=subs(rT2(2,1),{'x','T1','T2'},{1,1,2});
rT21z=subs(rT2(3,1),{'x','T1','T2'},{1,1,2});
rT22x=subs(rT2(1,1),{'x','T1','T2'},{2,1,2});
rT22y=subs(rT2(2,1),{'x','T1','T2'},{2,1,2});
rT22z=subs(rT2(3,1),{'x','T1','T2'},{2,1,2});
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
dx12=limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),1),x,2);
dx22=limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),2),x,2);
dx32=limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),3),x,2);
dx42=limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),4),x,2);
dy12=limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),1),x,2);
dy22=limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),2),x,2);
dy32=limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),3),x,2);
dy42=limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),4),x,2);
dz12=limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),1),x,2);
dz22=limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),2),x,2);
dz32=limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),3),x,2);
dz42=limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),4),x,2);
%转折点处导数连续
dx1x2=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),1),x,1);
dy1y2=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),1),x,1);
dz1z2=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),1),x,1);
Q=sym(ones(90)*min);
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115,...
     z11 z12 z13 z14 z15 z16 z17 z18 z19 z110 z111 z112 z113 z114 z115,...
     x21 x22 x23 x24 x25 x26 x27 x28 x29 x210 x211 x212 x213 x214 x215,...
     y21 y22 y23 y24 y25 y26 y27 y28 y29 y210 y211 y212 y213 y214 y215,...
     z21 z22 z23 z24 z25 z26 z27 z28 z29 z210 z211 z212 z213 z214 z215];
 for i=1:1:90
     parfor j=1:1:i
         Q(i,j)=diff(diff(Q(i,j),rTpL(1,i),1),rTpL(1,j),1);
     end%对对角线处理有疑问
     Q(i,j)=Q(j,i);
 end
%   for i=1:1:90
%      for j=1:1:i
%          if i==j
%              Q(i,i)=min;
%              for k=1:1:90
%                  if k~=i
%                      Q(i,i)=subs(Q(i,i),rTpL(k),0);
%                  end
%              end
%              Q(i,i)=2*Q(i,i)/rTpL(i)^2;
%          else
%              Q(i,j)=diff(diff(min,rTpL(1,i),1),rTpL(1,j),1);
%              Q(j,i)=Q(i,j);
%          end
%      end
%  end
 H=sym(zeros(1,54));
 parfor i=1:1:90
     H(1,i)=min;
     for j=1:1:90
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i)/2,rTpL(1,i),1);
 end
STP=[rT10x rT10y rT10z rT11x rT11y rT11z rT21x rT21y rT21z rT22x rT22y rT22z dx11 dx21 dx31 dx41 dy11 dy21 dy31 dy41 dz11 dz21 dz31 dz41 dx12 dx22 dx32 dx42 dy12 dy22 dy32 dy42 dz12 dz22 dz32 dz42 dx1x2 dy1y2 dz1z2];
STA=[0 0 0 1 2 3 1 2 3 7 1 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
coefficient=sym(zeros(36,90));
for i=1:1:12
    parfor j=1:1:90
        coefficient(i,j)=STP(i);
        for k=1:1:90
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
%逐位计算等式约束中的系数矩阵
for i=13:1:39
    parfor j=1:1:90
        coefficient(i,j)=STP(i);
        for k=1:1:90
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
save QP_model