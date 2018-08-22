clear all;
load QP_model;
syms x;
syms B11;syms B12;syms B13;syms B14;
syms B21;syms B22;syms B23;syms B24;
syms x01;syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;syms x110;syms x111;syms x112;syms x113;syms x114;syms x115;syms x116;syms x117;syms x118;syms x119;
syms y01;syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;syms y110;syms y111;syms y112;syms y113;syms y114;syms y115;syms y116;syms y117;syms y118;syms y119;
rTp=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115 x116 x117 x118 x119;...
     y01 y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115 y116 y117 y118 y119];
lim1_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.33,0,1})-1000*B11;
lim1_x2=subs(rT1(1,1),{'x','T0','T1'},{0.33,0,1})-1000*B12;
lim1_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.33,0,1})-1000*B13;
lim1_y2=subs(rT1(2,1),{'x','T0','T1'},{0.33,0,1})-1000*B14;
lim1_B=B11+B12+B13+B14;
lim01=subs(rT1(1,1),{'x','T0','T1'},{0,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.33,0,1});
lim10=subs(rT1(1,1),{'x','T0','T1'},{0.33,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0,0,1});
lim12=subs(rT1(1,1),{'x','T0','T1'},{0.33,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.66,0,1});
lim21=subs(rT1(1,1),{'x','T0','T1'},{0.66,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.33,0,1});
lim23=subs(rT1(1,1),{'x','T0','T1'},{0.66,0,1})-subs(rT1(1,1),{'x','T0','T1'},{1,0,1});
lim32=subs(rT1(1,1),{'x','T0','T1'},{1,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.66,0,1});
lim2_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.66,0,1})-1000*B21;
lim2_x2=subs(rT1(1,1),{'x','T0','T1'},{0.66,0,1})-1000*B22;
lim2_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.66,0,1})-1000*B23;
lim2_y2=subs(rT1(2,1),{'x','T0','T1'},{0.66,0,1})-1000*B24;
lim2_B=B21+B22+B23+B24;
Aineq=[lim1_x1 lim1_x2 lim1_y1 lim1_y2 lim2_x1 lim2_x2 lim2_y1 lim2_y2 lim01 lim10 lim12 lim21 lim23 lim32 lim1_B lim2_B];
bineq=[-4.225 1.775 -2.225 -0.225 -4.225 1.775 -2.225 -0.225 1.4 1.4 1.4 1.4 1.4 1.4 3 3];
rTpL=[x01 x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115 x116 x117 x118 x119,...
    y01 y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115 y116 y117 y118 y119,...
    B11 B12 B13 B14 B21 B22 B23 B24];
AIneq=sym(zeros(16,48));
for i=1:16
    parfor j=1:1:48
        AIneq(i,j)=Aineq(i);
        for k=1:1:48
            if k~=j
                AIneq(i,j)=subs(AIneq(i,j),rTpL(k),0);
            end
        end
        AIneq(i,j)=AIneq(i,j)/rTpL(j);
    end
end
save ineq AIneq bineq