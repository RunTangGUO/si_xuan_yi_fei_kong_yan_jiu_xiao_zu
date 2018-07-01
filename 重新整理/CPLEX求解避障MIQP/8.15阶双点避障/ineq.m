clear all;
syms x;
syms T0;
syms T1;
syms T2;
syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;syms x110;syms x111;syms x112;syms x113;syms x114;syms x115;
syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;syms y110;syms y111;syms y112;syms y113;syms y114;syms y115;
syms z11;syms z12;syms z13;syms z14;syms z15;syms z16;syms z17;syms z18;syms z19;syms z110;syms z111;syms z112;syms z113;syms z114;syms z115;
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19 x110 x111 x112 x113 x114 x115,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112 y113 y114 y115,...
     z11 z12 z13 z14 z15 z16 z17 z18 z19 z110 z111 z112 z113 z114 z115,...
     x21 x22 x23 x24 x25 x26 x27 x28 x29 x210 x211 x212 x213 x214 x215,...
     y21 y22 y23 y24 y25 y26 y27 y28 y29 y210 y211 y212 y213 y214 y215,...
     z21 z22 z23 z24 z25 z26 z27 z28 z29 z210 z211 z212 z213 z214 z215];
lim1_x1=-X1-1000*B1;
lim1_x2=X1-1000*B2;
lim1_y1=-Y1-1000*B3;
lim1_y2=Y1-1000*B4;
lim1_z1=-Z1-1000*B5;
lim1_z2=Z1-1000*B6;
lim1_B=B11+B12+B13+B14+B15+B16;
Aineq=[lim_x1 lim_x2 lim_y1 lim_y2 lim_z1 lim_z2 lim_B];
bineq=[-3 4 -5 0 -5 0 3];
AIneq=sym(zeros(6,61));
for i=1:7
    parfor j=1:1:61
        AIneq(i,j)=Aineq(i);
        for k=1:1:61
            if k~=j
                AIneq(i,j)=subs(AIneq(i,j),rTpL(k),0);
            end
        end
        AIneq(i,j)=AIneq(i,j)/rTpL(j);
    end
end
save ineq AIneq bineq
