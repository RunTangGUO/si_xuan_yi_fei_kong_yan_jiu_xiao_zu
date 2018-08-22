clear all;
load QP_model;
syms x;
syms B11;syms B12;syms B13;syms B14;
syms B21;syms B22;syms B23;syms B24;
syms B31;syms B32;syms B33;syms B34;
syms B41;syms B42;syms B43;syms B44;
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
lim1_x1=-subs(rT1(1,1),{'x'},{0.6})-1000*B11;
lim1_x2=subs(rT1(1,1),{'x'},{0.6})-1000*B12;
lim1_y1=-subs(rT1(2,1),{'x'},{0.6})-1000*B13;
lim1_y2=subs(rT1(2,1),{'x'},{0.6})-1000*B14;
lim1_B=B11+B12+B13+B14;
lim01=subs(rT1(1,1),{'x','T0','T1'},{0,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1});
lim10=subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0,0,1});
lim12=subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1})-subs(rT2(1,1),{'x','T0','T1'},{0.2,0,1});
lim21=subs(rT2(1,1),{'x','T0','T1'},{0.2,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1});
lim23=subs(rT2(1,1),{'x','T0','T1'},{0.2,0,1})-subs(rT2(1,1),{'x','T0','T1'},{0.8,0,1});
lim32=subs(rT2(1,1),{'x','T0','T1'},{0.8,0,1})-subs(rT2(1,1),{'x','T0','T1'},{0.2,0,1});
lim2_x1=-subs(rT2(1,1),{'x','T0','T1'},{0.2,0,1})-1000*B21;
lim2_x2=subs(rT2(1,1),{'x','T0','T1'},{0.2,0,1})-1000*B22;
lim2_y1=-subs(rT2(2,1),{'x','T0','T1'},{0.2,0,1})-1000*B23;
lim2_y2=subs(rT2(2,1),{'x','T0','T1'},{0.2,0,1})-1000*B24;
lim2_B=B21+B22+B23+B24;
lim3_x1=-subs(rT2(1,1),{'x','T0','T1'},{0.8,0,1})-1000*B31;
lim3_x2=subs(rT2(1,1),{'x','T0','T1'},{0.8,0,1})-1000*B32;
lim3_y1=-subs(rT2(2,1),{'x','T0','T1'},{0.8,0,1})-1000*B33;
lim3_y2=subs(rT2(2,1),{'x','T0','T1'},{0.8,0,1})-1000*B34;
lim3_B=B31+B32+B33+B34;
lim34=subs(rT2(1,1),{'x','T0','T1'},{0.8,0,1})-subs(rT3(1,1),{'x','T0','T1'},{0.4,0,1});
lim43=subs(rT3(1,1),{'x','T0','T1'},{0.4,0,1})-subs(rT2(1,1),{'x','T0','T1'},{0.8,0,1});
lim45=subs(rT3(1,1),{'x','T0','T1'},{0.4,0,1})-subs(rT3(1,1),{'x','T0','T1'},{1,0,1});
lim54=subs(rT3(1,1),{'x','T0','T1'},{1,0,1})-subs(rT3(1,1),{'x','T0','T1'},{0.4,0,1});
lim4_x1=-subs(rT3(1,1),{'x','T0','T1'},{0.4,0,1})-1000*B41;
lim4_x2=subs(rT3(1,1),{'x','T0','T1'},{0.4,0,1})-1000*B42;
lim4_y1=-subs(rT3(2,1),{'x','T0','T1'},{0.4,0,1})-1000*B43;
lim4_y2=subs(rT3(2,1),{'x','T0','T1'},{0.4,0,1})-1000*B44;
lim4_B=B41+B42+B43+B44;
Aineq=[lim1_x1 lim1_x2 lim1_y1 lim1_y2 lim2_x1 lim2_x2 lim2_y1 lim2_y2 lim3_x1 lim3_x2 lim3_y1 lim3_y2 lim4_x1 lim4_x2 lim4_y1 lim4_y2 lim01 lim10 lim12 lim21 lim23 lim32 lim34 lim43 lim45 lim54 lim1_B lim2_B lim3_B lim4_B];
bineq=[-4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 3 3 3 3];
rTpL=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19,... x110,... x111 x112,... x113 x114 x115,...
    y01 y11 y12 y13 y14 y15 y16 y17 y18 y19,... y110,... y111 y112,... y113 y114 y115,...
    x02 x21 x22 x23 x24 x25 x26 x27 x28 x29,... x210,... x211 x212,... x213 x214 x215,...
    y02 y21 y22 y23 y24 y25 y26 y27 y28 y29,... y210,... y211 y212,... y213 y214 y215,...
    x03 x31 x32 x33 x34 x35 x36 x37 x38 x39,... x210,... x211 x212,... x213 x214 x215,...
    y03 y31 y32 y33 y34 y35 y36 y37 y38 y39,... y210,... y211 y212,... y213 y214 y215,...
    B11 B12 B13 B14 B21 B22 B23 B24 B31 B32 B33 B34 B41 B42 B43 B44];
AIneq=sym(zeros(30,76));
for i=1:30
    parfor j=1:1:76
        AIneq(i,j)=Aineq(i);
        for k=1:1:76
            if k~=j
                AIneq(i,j)=subs(AIneq(i,j),rTpL(k),0);
            end
        end
        AIneq(i,j)=AIneq(i,j)/rTpL(j);
    end
end
save ineq AIneq bineq