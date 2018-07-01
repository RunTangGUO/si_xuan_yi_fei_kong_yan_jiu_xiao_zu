function p = create_P( x )
    syms T0;
    syms T1;
    syms T2;
    syms T3;
    syms T4;
    syms T5; 
    syms T6;
    syms T7;
    syms T8;
    p=sym(zeros(9,8));
    
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
    t=2*(x-T3)/(T4-T3)-1;
    t=subs(t,{'T3','T4'},{3,4})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,4)=a;
    end
    for i=6:1:9
        p(i,4)=(x-T3)^(i-9+4-1);
        p(i,4)=subs(p(i,4),'T3',3);
    end
    
    t =2*(x-T4)/(T5-T4)-1;
    t=subs(t,{'T4','T5'},{4,5})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,5)=a;
    end
    for i=6:1:9
        p(i,5)=(x-T4)^(i-9+4-1);
        p(i,5)=subs(p(i,5),'T4',4);
    end
    t=2*(x-T5)/(T6-T5)-1;
    t=subs(t,{'T5','T6'},{5,6})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,6)=a;
    end
    for i=6:1:9
        p(i,6)=(x-T5)^(i-9+4-1);
        p(i,6)=subs(p(i,6),'T5',5);
    end
    
    t =2*(x-T6)/(T7-T6)-1;
    t=subs(t,{'T6','T7'},{6,7})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,7)=a;
    end
    for i=6:1:9
        p(i,7)=(x-T6)^(i-9+4-1);
        p(i,7)=subs(p(i,7),'T6',6);
    end
    t=2*(x-T7)/(T8-T7)-1;
    t=subs(t,{'T7','T8'},{7,8})
    for i=1:1:5
        a = shifted_legendre(t,i);
        a = int(int(int(int(a,x),x),x),x);
        p(i,8)=a;
    end
    for i=6:1:9
        p(i,8)=(x-T7)^(i-9+4-1);
        p(i,8)=subs(p(i,8),'T7',0);
    end
end