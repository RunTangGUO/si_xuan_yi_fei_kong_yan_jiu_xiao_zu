clear;
x = sdpvar(5,1);
A = randn(15,5);
b = rand(15,1)*10;

obj = sum(x) + sum((x-3).^4); % 4th order objective
ops = sdpsettings('solver','bnb','bnb.solver','fmincon');
sol=optimize([A*x <= b, integer(x)],obj,ops);
X=value(x)