function p = shifted_legendre(t,n)
%�����õ¶���ʽ�ĺ���
syms x;
%�������õ¶���ʽ�е�x^2-1
f = ( x * x - 1)^n;
%��f����ʽ����n����
y = diff( f , n);
%��n�ý׳�
str = prod(1 : n);
%���õ¶���ʽ��һ���ʾʽ
l = (1 / (2^n * str))*y;
%����������õ¶���ʽ���кϲ�ͬ����
m = collect(l);
p=subs(m,x,t);
end