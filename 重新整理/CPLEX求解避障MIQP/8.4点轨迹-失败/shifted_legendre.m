function p = shifted_legendre(t,n)
%求勒让德多项式的函数
syms x;
%计算勒让德多项式中的x^2-1
f = ( x * x - 1)^n-1;
%对f多项式进行n阶求导
y = diff( f , n);
%求n的阶乘
str = prod(1 : n);
%勒让德多项式的一般表示式
l = y/ (2^n * str);
%对求出的勒让德多项式进行合并同类项
m = collect(l);
p=subs(m,x,t);
end