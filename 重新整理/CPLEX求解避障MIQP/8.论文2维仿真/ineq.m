clear all;
load QP_model;
syms x;
syms T0;
syms T1;
syms T2;
syms B11;syms B12;syms B13;syms B14;
syms B21;syms B22;syms B23;syms B24;
syms B31;syms B32;syms B33;syms B34;
syms B41;syms B42;syms B43;syms B44;
syms B51;syms B52;syms B53;syms B54;
syms B61;syms B62;syms B63;syms B64;
syms B71;syms B72;syms B73;syms B74;
syms B81;syms B82;syms B83;syms B84;
syms B91;syms B92;syms B93;syms B94;
syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;syms x110;syms x111;syms x112;syms x113;syms x114;syms x115;
syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;syms y110;syms y111;syms y112;syms y113;syms y114;syms y115;
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115,...
     B11 B12 B13 B14,...
     B21 B22 B23 B24,...
     B31 B32 B33 B34,...
     B41 B42 B43 B44,...
     B51 B52 B53 B54,...
     B61 B62 B63 B64,...
     B71 B72 B73 B74,...
     B81 B82 B83 B84,...
     B91 B92 B93 B94];
lim1_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.1,0,1})-1000*B11;
lim1_x2=subs(rT1(1,1),{'x','T0','T1'},{0.1,0,1})-1000*B12;
lim1_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.1,0,1})-1000*B13;
lim1_y2=subs(rT1(2,1),{'x','T0','T1'},{0.1,0,1})-1000*B14;
lim1_B=B11+B12+B13+B14;
lim12=subs(rT1(1,1),{'x','T0','T1'},{0.1,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.2,0,1});
lim21=subs(rT1(1,1),{'x','T0','T1'},{0.2,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.1,0,1});
lim2_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.2,0,1})-1000*B21;
lim2_x2=subs(rT1(1,1),{'x','T0','T1'},{0.2,0,1})-1000*B22;
lim2_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.2,0,1})-1000*B23;
lim2_y2=subs(rT1(2,1),{'x','T0','T1'},{0.2,0,1})-1000*B24;
lim2_B=B21+B22+B23+B24;
lim23=subs(rT1(1,1),{'x','T0','T1'},{0.2,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.3,0,1});
lim32=subs(rT1(1,1),{'x','T0','T1'},{0.3,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.2,0,1});
lim3_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.3,0,1})-1000*B31;
lim3_x2=subs(rT1(1,1),{'x','T0','T1'},{0.3,0,1})-1000*B32;
lim3_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.3,0,1})-1000*B33;
lim3_y2=subs(rT1(2,1),{'x','T0','T1'},{0.3,0,1})-1000*B34;
lim3_B=B31+B32+B33+B34;
lim34=subs(rT1(1,1),{'x','T0','T1'},{0.3,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.4,0,1});
lim43=subs(rT1(1,1),{'x','T0','T1'},{0.4,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.3,0,1});
lim4_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.4,0,1})-1000*B41;
lim4_x2=subs(rT1(1,1),{'x','T0','T1'},{0.4,0,1})-1000*B42;
lim4_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.4,0,1})-1000*B43;
lim4_y2=subs(rT1(2,1),{'x','T0','T1'},{0.4,0,1})-1000*B44;
lim4_B=B41+B42+B43+B44;
lim45=subs(rT1(1,1),{'x','T0','T1'},{0.4,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.5,0,1});
lim54=subs(rT1(1,1),{'x','T0','T1'},{0.5,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.4,0,1});
lim5_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.5,0,1})-1000*B51;
lim5_x2=subs(rT1(1,1),{'x','T0','T1'},{0.5,0,1})-1000*B52;
lim5_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.5,0,1})-1000*B53;
lim5_y2=subs(rT1(2,1),{'x','T0','T1'},{0.5,0,1})-1000*B54;
lim5_B=B51+B52+B53+B54;
lim56=subs(rT1(1,1),{'x','T0','T1'},{0.5,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1});
lim65=subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.5,0,1});
lim6_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1})-1000*B61;
lim6_x2=subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1})-1000*B62;
lim6_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.6,0,1})-1000*B63;
lim6_y2=subs(rT1(2,1),{'x','T0','T1'},{0.6,0,1})-1000*B64;
lim6_B=B61+B62+B63+B64;
lim67=subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.7,0,1});
lim76=subs(rT1(1,1),{'x','T0','T1'},{0.7,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.6,0,1});
lim7_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.7,0,1})-1000*B71;
lim7_x2=subs(rT1(1,1),{'x','T0','T1'},{0.7,0,1})-1000*B72;
lim7_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.7,0,1})-1000*B73;
lim7_y2=subs(rT1(2,1),{'x','T0','T1'},{0.7,0,1})-1000*B74;
lim7_B=B71+B72+B73+B74;
lim78=subs(rT1(1,1),{'x','T0','T1'},{0.7,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.8,0,1});
lim87=subs(rT1(1,1),{'x','T0','T1'},{0.8,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.7,0,1});
lim8_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.8,0,1})-1000*B81;
lim8_x2=subs(rT1(1,1),{'x','T0','T1'},{0.8,0,1})-1000*B82;
lim8_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.8,0,1})-1000*B83;
lim8_y2=subs(rT1(2,1),{'x','T0','T1'},{0.8,0,1})-1000*B84;
lim8_B=B81+B82+B83+B84;
lim89=subs(rT1(1,1),{'x','T0','T1'},{0.8,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.9,0,1});
lim98=subs(rT1(1,1),{'x','T0','T1'},{0.9,0,1})-subs(rT1(1,1),{'x','T0','T1'},{0.8,0,1});
lim9_x1=-subs(rT1(1,1),{'x','T0','T1'},{0.9,0,1})-1000*B91;
lim9_x2=subs(rT1(1,1),{'x','T0','T1'},{0.9,0,1})-1000*B92;
lim9_y1=-subs(rT1(2,1),{'x','T0','T1'},{0.9,0,1})-1000*B93;
lim9_y2=subs(rT1(2,1),{'x','T0','T1'},{0.9,0,1})-1000*B94;
lim9_B=B91+B92+B93+B94;
Aineq=[lim1_x1 lim1_x2 lim1_y1 lim1_y2 lim1_B lim2_x1 lim2_x2 lim2_y1 lim2_y2 lim2_B,...
    lim3_x1 lim3_x2 lim3_y1 lim3_y2 lim3_B lim4_x1 lim4_x2 lim4_y1 lim4_y2 lim4_B,...
    lim5_x1 lim5_x2 lim5_y1 lim5_y2 lim5_B lim6_x1 lim6_x2 lim6_y1 lim6_y2 lim6_B,...
    lim7_x1 lim7_x2 lim7_y1 lim7_y2 lim7_B lim8_x1 lim8_x2 lim8_y1 lim8_y2 lim8_B,...
    lim9_x1 lim9_x2 lim9_y1 lim9_y2 lim9_B lim12 lim21 lim23 lim32 lim34 lim43 lim45 lim54 lim56 lim65 lim67 lim76 lim78 lim87 lim89 lim98];   
bineq=[-3 4 -5 0 3 -3 4 -5 0 3,...
    -3 4 -5 0 3 -3 4 -5 0 3,...
    -3 4 -5 0 3 -3 4 -5 0 3,...
    -3 4 -5 0 3 -3 4 -5 0 3,...
    -3 4 -5 0 3 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4];
AIneq=sym(zeros(79,99));
for i=1:51
    parfor j=1:1:66
        AIneq(i,j)=Aineq(i);
        for k=1:1:66
            if k~=j
                AIneq(i,j)=subs(AIneq(i,j),rTpL(k),0);
            end
        end
        AIneq(i,j)=AIneq(i,j)/rTpL(j);
    end
end
save ineq AIneq bineq
