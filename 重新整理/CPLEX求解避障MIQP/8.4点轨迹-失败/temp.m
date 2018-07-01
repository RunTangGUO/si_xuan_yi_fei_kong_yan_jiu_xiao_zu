% hold on;
% for i=1:1000
%     x2(i,1)=double(subs(rT3(1,1),'x',(i+2000)/1000));
%     y2(i,1)=double(subs(rT3(2,1),'x',(i+2000)/1000));
%     z2(i,1)=double(subs(rT3(3,1),'x',(i+2000)/1000));
% end
% plot3(x2,y2,z2,'g');
syms T0;syms T1;syms T2;syms T3;
    t =2*(x-T0)-1;
    t=subs(t,{'T0','T1'},{0,1})
    a(1,1) = shifted_legendre(t,1);
%     a = int(int(int(int(a,x),x),x),x);
%     p(1,1)=a
    t=2*(x-T1)-1;
    t=subs(t,{'T1','T2'},{1,2})
    i=1
    a(1,2) = shifted_legendre(t,1);
%     a = int(int(int(int(a,x),x),x),x);
%     p(i,2)=a
    t =2*(x-T2)-1;
    t=subs(t,{'T2','T3'},{2,3})
    a(1,3) = shifted_legendre(t,1);
%     a = int(int(int(int(a,x),x),x),x);
%     p(i,3)=a