function p = shifted_legendre(t,n)
%�����õ¶���ʽ�ĺ���
syms x;
%�������õ¶���ʽ�е�x^2-1
f = ( x * x - 1)^n-1;
%��f����ʽ����n����
y = diff( f , n);
%��n�Ľ׳�
str = prod(1 : n);
%���õ¶���ʽ��һ���ʾʽ
l = y/ (2^n * str);
%����������õ¶���ʽ���кϲ�ͬ����
m = collect(l);
p=subs(m,x,t);
end