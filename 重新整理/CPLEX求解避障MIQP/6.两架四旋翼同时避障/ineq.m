clear all;
syms x;
syms T0;
syms T1;
syms T2;
syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;
syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;
syms z11;syms z12;syms z13;syms z14;syms z15;syms z16;syms z17;syms z18;syms z19;
syms x21;syms x22;syms x23;syms x24;syms x25;syms x26;syms x27;syms x28;syms x29;
syms y21;syms y22;syms y23;syms y24;syms y25;syms y26;syms y27;syms y28;syms y29;
syms z21;syms z22;syms z23;syms z24;syms z25;syms z26;syms z27;syms z28;syms z29;
syms X1;syms Y1;syms Z1;
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19,...
     z11 z12 z13 z14 z15 z16 z17 z18 z19,...
     x21 x22 x23 x24 x25 x26 x27 x28 x29,...
     y21 y22 y23 y24 y25 y26 y27 y28 y29,...
     z21 z22 z23 z24 z25 z26 z27 z28 z29,X1,Y1,Z1];
lim_x1=-X1;
lim_x2=X1;
lim_y1=-Y1;
lim_y2=Y1;
lim_z1=-Z1;
lim_z2=Z1;
Aineq=[lim_x1 lim_x2 lim_y1 lim_y2 lim_z1 lim_z2 ];
bineq=[-3 4 -5 8 0 5];
AIneq=sym(zeros(6,57));
for i=1:6
    parfor j=1:1:57
        AIneq(i,j)=Aineq(i);
        for k=1:1:57
            if k~=j
                AIneq(i,j)=subs(AIneq(i,j),rTpL(k),0);
            end
        end
        AIneq(i,j)=AIneq(i,j)/rTpL(j);
    end
end
save ineq AIneq bineq
