clear all;
syms x;
n = 4;
%%%%%%%%%%%%%%%%%%%%%
p=create_P(x);
%%%%%%%%%%%%%%%%%%%%%%
% syms x11;syms x12;syms x13;syms x14;syms x15;syms x16;syms x17;syms x18;syms x19;
% syms y11;syms y12;syms y13;syms y14;syms y15;syms y16;syms y17;syms y18;syms y19;
% syms z11;syms z12;syms z13;syms z14;syms z15;syms z16;syms z17;syms z18;syms z19;
% syms x21;syms x22;syms x23;syms x24;syms x25;syms x26;syms x27;syms x28;syms x29;
% syms y21;syms y22;syms y23;syms y24;syms y25;syms y26;syms y27;syms y28;syms y29;
% syms z21;syms z22;syms z23;syms z24;syms z25;syms z26;syms z27;syms z28;syms z29;
for i=1:n-1
    for j=1:9
        eval(['syms x',num2str(i),num2str(j)]);
        eval(['rTp((',num2str(i),'-1)*3+1,',num2str(j),')=x',num2str(i),num2str(j)]);
        eval(['syms y',num2str(i),num2str(j)]);
        eval(['rTp((',num2str(i),'-1)*3+2,',num2str(j),')=y',num2str(i),num2str(j)]);
        eval(['syms z',num2str(i),num2str(j)]);
        eval(['rTp((',num2str(i),'-1)*3+3,',num2str(j),')=z',num2str(i),num2str(j)]);
    end
end
% rTp=[x11 x12 x13 x14 x15 x16 x17 x18 x19;...
%      y11 y12 y13 y14 y15 y16 y17 y18 y19;...
%      z11 z12 z13 z14 z15 z16 z17 z18 z19;...
%      x21 x22 x23 x24 x25 x26 x27 x28 x29;...
%      y21 y22 y23 y24 y25 y26 y27 y28 y29;...
%      z21 z22 z23 z24 z25 z26 z27 z28 z29];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rT1=sym(zeros(3,1));
for i=1:1:9
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
    rT1(3,1)=rT1(3,1)+rTp(3,i)*p(i,1);
end
rT2=sym(zeros(3,1));
for i=1:1:9
    rT2(1,1)=rT2(1,1)+rTp(4,i)*p(i,2);
    rT2(2,1)=rT2(2,1)+rTp(5,i)*p(i,2);
    rT2(3,1)=rT2(3,1)+rTp(6,i)*p(i,2);
end
rT3=sym(zeros(3,1));
for i=1:1:9
    rT3(1,1)=rT3(1,1)+rTp(7,i)*p(i,1);
    rT3(2,1)=rT3(2,1)+rTp(8,i)*p(i,1);
    rT3(3,1)=rT3(3,1)+rTp(9,i)*p(i,1);
end
% rT4=sym(zeros(3,1));
% for i=1:1:9
%     rT4(1,1)=rT4(1,1)+rTp(10,i)*p(i,2);
%     rT4(2,1)=rT4(2,1)+rTp(11,i)*p(i,2);
%     rT4(3,1)=rT4(3,1)+rTp(12,i)*p(i,2);
% end
% rT5=sym(zeros(3,1));
% for i=1:1:9
%     rT5(1,1)=rT5(1,1)+rTp(13,i)*p(i,1);
%     rT5(2,1)=rT5(2,1)+rTp(14,i)*p(i,1);
%     rT5(3,1)=rT5(3,1)+rTp(15,i)*p(i,1);
% end
% rT6=sym(zeros(3,1));
% for i=1:1:9
%     rT6(1,1)=rT6(1,1)+rTp(16,i)*p(i,2);
%     rT6(2,1)=rT6(2,1)+rTp(17,i)*p(i,2);
%     rT6(3,1)=rT6(3,1)+rTp(18,i)*p(i,2);
% end
% rT7=sym(zeros(3,1));
% for i=1:1:9
%     rT7(1,1)=rT7(1,1)+rTp(19,i)*p(i,1);
%     rT7(2,1)=rT7(2,1)+rTp(20,i)*p(i,1);
%     rT7(3,1)=rT7(3,1)+rTp(21,i)*p(i,1);
% end
% rT8=sym(zeros(3,1));
% for i=1:1:9
%     rT8(1,1)=rT8(1,1)+rTp(22,i)*p(i,2);
%     rT8(2,1)=rT8(2,1)+rTp(23,i)*p(i,2);
%     rT8(3,1)=rT8(3,1)+rTp(24,i)*p(i,2);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
min=int(diff(rT1(1,1),4)^2+diff(rT1(2,1),4)^2+diff(rT1(3,1),4)^2,x,0,1);
min=min+int(diff(rT2(1,1),x,4)^2+diff(rT2(2,1),x,4)^2+diff(rT2(3,1),x,4)^2,x,1,2);
min=min+int(diff(rT3(1,1),4)^2+diff(rT3(2,1),4)^2+diff(rT3(3,1),4)^2,x,2,3);
% min=min+int(diff(rT4(1,1),x,4)^2+diff(rT4(2,1),x,4)^2+diff(rT4(3,1),x,4)^2,x,3,4);
% min=min+int(diff(rT5(1,1),4)^2+diff(rT5(2,1),4)^2+diff(rT5(3,1),4)^2,x,4,5);
% min=min+int(diff(rT6(1,1),x,4)^2+diff(rT6(2,1),x,4)^2+diff(rT6(3,1),x,4)^2,x,5,6);
% min=min+int(diff(rT7(1,1),4)^2+diff(rT7(2,1),4)^2+diff(rT7(3,1),4)^2,x,6,7);
% min=min+int(diff(rT8(1,1),x,4)^2+diff(rT8(2,1),x,4)^2+diff(rT8(3,1),x,4)^2,x,7,8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rT10x=subs(rT1(1,1),{'x'},{0});
rT10y=subs(rT1(2,1),{'x'},{0});
rT10z=subs(rT1(3,1),{'x'},{0});
rT11x=subs(rT1(1,1),{'x'},{1});
rT11y=subs(rT1(2,1),{'x'},{1});
rT11z=subs(rT1(3,1),{'x'},{1});
rT21x=subs(rT2(1,1),{'x'},{1});
rT21y=subs(rT2(2,1),{'x'},{1});
rT21z=subs(rT2(3,1),{'x'},{1});
rT22x=subs(rT2(1,1),{'x'},{2});
rT22y=subs(rT2(2,1),{'x'},{2});
rT22z=subs(rT2(3,1),{'x'},{2});
rT32x=subs(rT3(1,1),{'x'},{2});
rT32y=subs(rT3(2,1),{'x'},{2});
rT32z=subs(rT3(3,1),{'x'},{2});
rT33x=subs(rT3(1,1),{'x'},{3});
rT33y=subs(rT3(2,1),{'x'},{3});
rT33z=subs(rT3(3,1),{'x'},{3});
% rT41x=subs(rT4(1,1),{'x'},{3});
% rT41y=subs(rT4(2,1),{'x'},{3});
% rT41z=subs(rT4(3,1),{'x'},{3});
% rT42x=subs(rT4(1,1),{'x'},{4});
% rT42y=subs(rT4(2,1),{'x'},{4});
% rT42z=subs(rT4(3,1),{'x'},{4});
% rT51x=subs(rT5(1,1),{'x'},{4});
% rT51y=subs(rT5(2,1),{'x'},{4});
% rT51z=subs(rT5(3,1),{'x'},{4});
% rT52x=subs(rT5(1,1),{'x'},{5});
% rT52y=subs(rT5(2,1),{'x'},{5});
% rT52z=subs(rT5(3,1),{'x'},{5});
% rT61x=subs(rT6(1,1),{'x'},{5});
% rT61y=subs(rT6(2,1),{'x'},{5});
% rT61z=subs(rT6(3,1),{'x'},{5});
% rT62x=subs(rT6(1,1),{'x'},{6});
% rT62y=subs(rT6(2,1),{'x'},{6});
% rT62z=subs(rT6(3,1),{'x'},{6});
% rT71x=subs(rT7(1,1),{'x'},{6});
% rT71y=subs(rT7(2,1),{'x'},{6});
% rT71z=subs(rT7(3,1),{'x'},{6});
% rT72x=subs(rT7(1,1),{'x'},{7});
% rT72y=subs(rT7(2,1),{'x'},{7});
% rT72z=subs(rT7(3,1),{'x'},{7});
% rT81x=subs(rT8(1,1),{'x'},{7});
% rT81y=subs(rT8(2,1),{'x'},{7});
% rT81z=subs(rT8(3,1),{'x'},{7});
% rT82x=subs(rT8(1,1),{'x'},{8});
% rT82y=subs(rT8(2,1),{'x'},{8});
% rT82z=subs(rT8(3,1),{'x'},{8});
%测试数值为0在端点
dx11=limit(diff(rT1(1,1),1),x,0);
dx21=limit(diff(rT1(1,1),2),x,0);
dx31=limit(diff(rT1(1,1),3),x,0);
dx41=limit(diff(rT1(1,1),4),x,0);
dy11=limit(diff(rT1(2,1),1),x,0);
dy21=limit(diff(rT1(2,1),2),x,0);
dy31=limit(diff(rT1(2,1),3),x,0);
dy41=limit(diff(rT1(2,1),4),x,0);
dz11=limit(diff(rT1(3,1),1),x,0);
dz21=limit(diff(rT1(3,1),2),x,0);
dz31=limit(diff(rT1(3,1),3),x,0);
dz41=limit(diff(rT1(3,1),4),x,0);
dx13=limit(diff(rT3(1,1),1),x,3);
dx23=limit(diff(rT3(1,1),2),x,3);
dx33=limit(diff(rT3(1,1),3),x,3);
dx43=limit(diff(rT3(1,1),4),x,3);
dy13=limit(diff(rT3(2,1),1),x,3);
dy23=limit(diff(rT3(2,1),2),x,3);
dy33=limit(diff(rT3(2,1),3),x,3);
dy43=limit(diff(rT3(2,1),4),x,3);
dz13=limit(diff(rT3(3,1),1),x,3);
dz23=limit(diff(rT3(3,1),2),x,3);
dz33=limit(diff(rT3(3,1),3),x,3);
dz43=limit(diff(rT3(3,1),4),x,3);
%转折点处导数连续
dx1x2=limit(diff(rT1(1,1),1),x,1)-limit(diff(rT2(1,1),1),x,1);
dy1y2=limit(diff(rT1(2,1),1),x,1)-limit(diff(rT2(2,1),1),x,1);
dz1z2=limit(diff(rT1(3,1),1),x,1)-limit(diff(rT2(3,1),1),x,1);

dx2x3=limit(diff(rT2(1,1),1),x,2)-limit(diff(rT3(1,1),1),x,2);
dy2y3=limit(diff(rT2(2,1),1),x,2)-limit(diff(rT3(2,1),1),x,2);
dz2z3=limit(diff(rT2(3,1),1),x,2)-limit(diff(rT3(3,1),1),x,2);

% dx3x4=limit(diff(rT3(1,1),1),x,3)-limit(diff(rT4(1,1),1),x,3);
% dy3y4=limit(diff(rT3(2,1),1),x,3)-limit(diff(rT4(2,1),1),x,3);
% dz3z4=limit(diff(rT3(3,1),1),x,3)-limit(diff(rT4(3,1),1),x,3);

% dx4x5=limit(diff(rT4(1,1),1),x,4)-limit(diff(rT5(1,1),1),x,4);
% dy4y5=limit(diff(rT4(2,1),1),x,4)-limit(diff(rT5(2,1),1),x,4);
% dz4z5=limit(diff(rT4(3,1),1),x,4)-limit(diff(rT5(3,1),1),x,4);

% dx5x6=limit(diff(rT5(1,1),1),x,5)-limit(diff(rT6(1,1),1),x,5);
% dy5y6=limit(diff(rT5(2,1),1),x,5)-limit(diff(rT6(2,1),1),x,5);
% dz5z6=limit(diff(rT5(3,1),1),x,5)-limit(diff(rT6(3,1),1),x,5);
% 
% dx6x7=limit(diff(rT6(1,1),1),x,6)-limit(diff(rT7(1,1),1),x,6);
% dy6y7=limit(diff(rT6(2,1),1),x,6)-limit(diff(rT7(2,1),1),x,6);
% dz6z7=limit(diff(rT6(3,1),1),x,6)-limit(diff(rT7(3,1),1),x,6);
% 
% dx7x8=limit(diff(rT7(1,1),1),x,7)-limit(diff(rT8(1,1),1),x,7);
% dy7y8=limit(diff(rT7(2,1),1),x,7)-limit(diff(rT8(2,1),1),x,7);
% dz7z8=limit(diff(rT7(3,1),1),x,7)-limit(diff(rT8(3,1),1),x,7);

Q=sym(zeros(27*3));
rTpL=[x11 x12 x13 x14 x15 x16 x17 x18 x19,...
     y11 y12 y13 y14 y15 y16 y17 y18 y19,...
     z11 z12 z13 z14 z15 z16 z17 z18 z19,...
     x21 x22 x23 x24 x25 x26 x27 x28 x29,...
     y21 y22 y23 y24 y25 y26 y27 y28 y29,...
     z21 z22 z23 z24 z25 z26 z27 z28 z29,...
     x31 x32 x33 x34 x35 x36 x37 x38 x39,...
     y31 y32 y33 y34 y35 y36 y37 y38 y39,...
     z31 z32 z33 z34 z35 z36 z37 z38 z39];
%      x41 x42 x43 x44 x45 x46 x47 x48 x49,...
%      y41 y42 y43 y44 y45 y46 y47 y48 y49,...
%      z41 z42 z43 z44 z45 z46 z47 z48 z49];
%      x51 x52 x53 x54 x55 x56 x57 x58 x59,...
%      y51 y52 y53 y54 y55 y56 y57 y58 y59,...
%      z51 z52 z53 z54 z55 z56 z57 z58 z59,...
%      x61 x62 x63 x64 x65 x66 x67 x68 x69,...
%      y61 y62 y63 y64 y65 y66 y67 y68 y69,...
%      z61 z62 z63 z64 z65 z66 z67 z68 z69,...
%      x71 x72 x73 x74 x75 x76 x77 x78 x79,...
%      y71 y72 y73 y74 y75 y76 y77 y78 y79,...
%      z71 z72 z73 z74 z75 z76 z77 z78 z79,...
%      x81 x82 x83 x84 x85 x86 x87 x88 x89,...
%      y81 y82 y83 y84 y85 y86 y87 y88 y89,...
%      z81 z82 z83 z84 z85 z86 z87 z88 z89];
 for i=1:1:27*3
     parfor j=1:1:27*3
%          if i==j
%              Q(i,i)=min;
%              for k=1:1:54*8
%                  if k~=i
%                      Q(i,i)=subs(Q(i,i),rTpL(k),0);
%                  end
%              end
%              Q(i,i)=2*Q(i,i)/rTpL(i)^2;
%          else
             Q(i,j)=diff(diff(min,rTpL(1,i),1),rTpL(1,j),1);
%             Q(j,i)=Q(i,j);
%         end
     end
     Q(i,i)=Q(i,i)/2;
 end
 H=sym(zeros(1,27*3));
 for i=1:1:27*3
     H(1,i)=min;
     for j=1:1:27*3
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i),rTpL(1,i),1);
 end
STP=[rT10x rT10y rT10z rT11x rT11y rT11z rT21x rT21y rT21z rT22x rT22y rT22z,...
    rT32x rT32y rT32z rT33x rT33y rT33z ,...
    dx11 dx21 dx31 dx41 dy11 dy21 dy31 dy41 dz11 dz21 dz31 dz41 ,...
    dx13 dx23 dx33 dx43 dy13 dy23 dy33 dy43 dz13 dz23 dz33 dz43 ,...
    dx1x2 dy1y2 dz1z2,...
    dx2x3 dy2y3 dz2z3];
STA=[1 5 1 3 7 3 3 7 3 6.5 4.5 5.5 ,...
    6.5 4.5 5.5 9 3 8 ,...
    0 0 0 0 0 0 0 0 0 0 0 0,...
    0 0 0 0 0 0 0 0 0 0 0 0,...
    0 0 0,...
    0 0 0];
coefficient=sym(zeros(48,27*3));
for i=1:1:48
    parfor j=1:1:27*3
       coefficient(i,j)=STP(i);
        for k=1:1:27*3
            if k~=j
                coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
            end
        end
        coefficient(i,j)=coefficient(i,j)/rTpL(j);
    end
end
%逐位计算等式约束中的系数矩阵
% for i=13:1:39
%     for j=1:1:54
%         coefficient(i,j)=STP(i);
%         for k=1:1:54
%             if k~=j
%                 coefficient(i,j)=subs(coefficient(i,j),rTpL(k),0);
%             end
%         end
%         coefficient(i,j)=coefficient(i,j)/rTpL(j);
%     end
% end
save QP_model