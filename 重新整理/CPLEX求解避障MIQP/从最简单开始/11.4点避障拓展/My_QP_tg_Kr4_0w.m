clear all;
syms x;
p=sym(zeros(11,1));
for i=1:1:7
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
syms x01;syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;%syms x110;%syms x111;syms x112;%syms x113;syms x114;syms x115;syms x116;syms x117;syms x118;syms x119;
syms y01;syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;%syms y110;%syms y111;syms y112;%syms y113;syms y114;syms y115;syms y116;syms y117;syms y118;syms y119;
syms x02;syms x21;syms x22;syms x23;syms x24;syms x25;syms x26;syms x27;syms x28;syms x29;%syms x210;%syms x211;syms x212;%syms x213;syms x214;syms x215;syms x216;syms x217;syms x218;syms x219;
syms y02;syms y21;syms y22;syms y23;syms y24;syms y25;syms y26;syms y27;syms y28;syms y29;%syms y210;%syms y211;syms y212;%syms y213;syms y214;syms y215;syms y216;syms y217;syms y218;syms y219;
syms x03;syms x31;syms x32;syms x33;syms x34;syms x35;syms x36;syms x37;syms x38;syms x39;%syms x210;%syms x211;syms x212;%syms x213;syms x214;syms x215;syms x216;syms x217;syms x218;syms x219;
syms y03;syms y31;syms y32;syms y33;syms y34;syms y35;syms y36;syms y37;syms y38;syms y39;%syms y210;%syms y211;syms y212;%syms y213;syms y214;syms y215;syms y216;syms y217;syms y218;syms y219;
rTp=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19;.... x110;... x111 x112;... x113 x114 x115;... x116 x117 x118 x119;...
     y01 y11 y12 y13 y14 y15 y16 y17 y18 y19;... y110;... y111 y112;... y113 y114 y115;... y116 y117 y118 y119;...
     x02 x21 x22 x23 x24 x25 x26 x27 x28 x29;... x210;... x211 x212;... x213 x214 x215;... x216 x217 x218 x219;...
     y02 y21 y22 y23 y24 y25 y26 y27 y28 y29;...
     x03 x31 x32 x33 x34 x35 x36 x37 x38 x39;... x210;... x211 x212;... x213 x214 x215;... x216 x217 x218 x219;...
     y03 y31 y32 y33 y34 y35 y36 y37 y38 y39];% y210];% y211 y212];% y213 y214 y215];% y216 y217 y218 y219];
rT1=sym(zeros(2,1));
rT2=sym(zeros(2,1));
rT3=sym(zeros(2,1));
for i=1:1:10
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
    rT2(1,1)=rT2(1,1)+rTp(3,i)*p(i,1);
    rT2(2,1)=rT2(2,1)+rTp(4,i)*p(i,1);
    rT3(1,1)=rT3(1,1)+rTp(5,i)*p(i,1);
    rT3(2,1)=rT3(2,1)+rTp(6,i)*p(i,1);
end
min=int(diff(rT1(1,1),4)^2+diff(rT1(2,1),2)^4,'x',0,1);
min=min+int(diff(rT2(1,1),4)^2+diff(rT2(2,1),4)^2,'x',0,1);
min=min+int(diff(rT3(1,1),4)^2+diff(rT3(2,1),4)^2,'x',0,1);
rT10x=subs(rT1(1,1),{'x'},{0});
rT10y=subs(rT1(2,1),{'x'},{0});
rT31x=subs(rT3(1,1),{'x'},{1});
rT31y=subs(rT3(2,1),{'x'},{1});
%测试数值为0在端点
dx11=limit(diff(rT1(1,1),1),x,0);
dx31=limit(diff(rT3(1,1),1),x,1);
dy11=limit(diff(rT1(2,1),1),x,0);
dy31=limit(diff(rT3(2,1),1),x,1);
dx12=limit(diff(rT1(1,1),2),x,0);
dx32=limit(diff(rT3(1,1),2),x,1);
dy12=limit(diff(rT1(2,1),2),x,0);
dy32=limit(diff(rT3(2,1),2),x,1);
dy13=limit(diff(rT1(2,1),3),x,0);
dy33=limit(diff(rT3(2,1),3),x,1);
dx13=limit(diff(rT1(1,1),3),x,0);
dx33=limit(diff(rT3(1,1),3),x,1);
dy14=limit(diff(rT1(2,1),4),x,0);
dy34=limit(diff(rT3(2,1),4),x,1);
dx14=limit(diff(rT1(1,1),4),x,0);
dx34=limit(diff(rT3(1,1),4),x,1);
%转折点处导数连续
dx1x2=limit(diff(rT1(1,1),1),x,1)-limit(diff(rT2(1,1),1),x,0);
dy1y2=limit(diff(rT1(2,1),1),x,1)-limit(diff(rT2(2,1),1),x,0);
dx2x3=limit(diff(rT2(1,1),1),x,1)-limit(diff(rT3(1,1),1),x,0);
dy2y3=limit(diff(rT2(2,1),1),x,1)-limit(diff(rT3(2,1),1),x,0);
limrT12x=subs(rT1(1,1),{'x'},{1})-subs(rT2(1,1),{'x'},{0});
limrT12y=subs(rT1(2,1),{'x'},{1})-subs(rT2(2,1),{'x'},{0});
limrT23x=subs(rT2(1,1),{'x'},{1})-subs(rT3(1,1),{'x'},{0});
limrT23y=subs(rT2(2,1),{'x'},{1})-subs(rT3(2,1),{'x'},{0});
Q=sym(zeros(60));
rTpL=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19,... x110,... x111 x112,... x113 x114 x115,...
     y01 y11 y12 y13 y14 y15 y16 y17 y18 y19,... y110,... y111 y112,... y113 y114 y115,...
     x02 x21 x22 x23 x24 x25 x26 x27 x28 x29,... x210,... x211 x212,... x213 x214 x215,... 
     y02 y21 y22 y23 y24 y25 y26 y27 y28 y29,...
     x03 x31 x32 x33 x34 x35 x36 x37 x38 x39,... x210,... x211 x212,... x213 x214 x215,... 
     y03 y31 y32 y33 y34 y35 y36 y37 y38 y39];% y210];% y211 y212];% y213 y214 y215];
 for i=1:1:60
     for j=1:1:i
         if i==j
             Q(i,i)=min;
             for k=1:1:60
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
 H=sym(zeros(1,60));
 for i=1:1:60
     H(1,i)=min;
     for j=1:1:60
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i)/2,rTpL(1,i),1);
 end
STP=[rT10x rT10y rT31x rT31y dx11 dy11 dx12 dy12 dy13 dx13 dy14 dx14 dx1x2 dy1y2 dx2x3 dy2y3 limrT12x limrT12y limrT23x limrT23y];
STA=[1 1 5 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
coefficient=sym(zeros(20,60));
for i=1:1:20
    for j=1:1:60
        coefficient(i,j)=STP(i);
        for k=1:1:60
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
save QP_model