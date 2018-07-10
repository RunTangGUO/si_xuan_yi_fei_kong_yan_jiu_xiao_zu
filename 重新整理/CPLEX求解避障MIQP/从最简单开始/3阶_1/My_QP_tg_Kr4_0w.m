clear all;
syms x;
p=sym(zeros(4,1));
for i=1:1:4
    p(i,1)=x^(i-1);
end
syms x01;syms x11;syms x12;syms x13;
syms y01;syms y11;syms y12;syms y13;
rTp=[x01 x11 x12 x13;...
     y01 y11 y12 y13];
rT1=sym(zeros(2,1));
for i=1:1:4
    rT1(1,1)=rT1(1,1)+rTp(1,i)*p(i,1);
    rT1(2,1)=rT1(2,1)+rTp(2,i)*p(i,1);
end
min=int(diff(rT1(1,1),2)^2+diff(rT1(2,1),2)^2,'x',0,1);
rT10x=subs(rT1(1,1),{'x'},{0});
rT10y=subs(rT1(2,1),{'x'},{0});
rT11x=subs(rT1(1,1),{'x'},{1});
rT11y=subs(rT1(2,1),{'x'},{1});
%测试数值为0在端点
% dx11=limit(diff(rT1(1,1),1),x,0);
% dx21=limit(diff(rT1(1,1),2),x,0);
% dy11=limit(diff(rT1(2,1),1),x,0);
% dy21=limit(diff(rT1(2,1),2),x,0);
% dx12=limit(diff(rT1(1,1),1),x,1);
% dx22=limit(diff(rT1(1,1),2),x,1);
% dy12=limit(diff(rT1(2,1),1),x,1);
% dy22=limit(diff(rT1(2,1),2),x,1);
%转折点处导数连续
% dx1x2=limit(diff(subs(rT1(1,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(1,1),{'T1','T2'},{1,2}),1),x,1);
% dy1y2=limit(diff(subs(rT1(2,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(2,1),{'T1','T2'},{1,2}),1),x,1);
% dz1z2=limit(diff(subs(rT1(3,1),{'T0','T1'},{0,1}),1),x,1)-limit(diff(subs(rT2(3,1),{'T1','T2'},{1,2}),1),x,1);
Q=sym(zeros(8));
rTpL=[x01 x11 x12 x13,...
     y01 y11 y12 y13];
 for i=1:1:8
     for j=1:1:i
         if i==j
             Q(i,i)=min;
             for k=1:1:8
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
 H=sym(zeros(1,8));
 for i=1:1:8
     H(1,i)=min;
     for j=1:1:8
         if j~=i
             H(1,i)=subs(H(1,i),rTpL(1,j),0);
         end
     end
     H(1,i)=subs(H(1,i)-rTpL(1,i)^2*Q(i,i)/2,rTpL(1,i),1);
 end
STP=[rT10x rT10y rT11x rT11y];
STA=[0 0 5 5];
coefficient=sym(zeros(4,8));
for i=1:1:4
    for j=1:1:8
        coefficient(i,j)=STP(i);
        for k=1:1:8
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