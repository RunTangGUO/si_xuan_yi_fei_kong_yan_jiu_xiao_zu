function p = create_P( x )
    syms T0;
    syms T1;
    syms T2;
    syms T3;
    p=sym(zeros(9,3));
    
    t =2*(x-T0)/(T1-T0)-1;
    t=subs(t,{'T0','T1'},{0,1})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,1)=a;
    end
    for i=6:1:9
        p(i,1)=(x-T0)^(i-9+4-1);
        p(i,1)=subs(p(i,1),'T0',0);
    end
    t=2*(x-T1)/(T2-T1)-1;
    t=subs(t,{'T1','T2'},{1,2})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,2)=a;
    end
    for i=6:1:9
        p(i,2)=(x-T1)^(i-9+4-1);
        p(i,2)=subs(p(i,2),'T1',1);
    end
    
    t =2*(x-T2)/(T3-T2)-1;
    t=subs(t,{'T2','T3'},{2,3})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,3)=a;
    end
    for i=6:1:9
        p(i,3)=(x-T2)^(i-9+4-1);
        p(i,3)=subs(p(i,3),'T2',2);
    end
end