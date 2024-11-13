####Algorithm1
for n in [12..56] do
    gl:= AllPrimitiveGroups(NrMovedPoints,n);
    mo:=0;
    G:=0;
    for g in gl do
        ord:=Order(g);
        if ord < Factorial(n)/2 then
           if ord > mo then
                mo:=ord;
                G:=g;
            fi;
        fi;
    od;
    if mo = 0 then
        Print("n=",n ,"         ","success","\n");
        continue;
    fi;
    k:=((2^n)/mo)-2*n;
    if k < 0 then
        Print("n=",n ,"         ","fail","\n");
    else
        Print("n=",n ,"       ","success","\n");
    fi;
od;   
###Algorithm2    
for n in [12,13,14,15,16,17,21,22,23,24,32] do
    gl:= AllPrimitiveGroups(NrMovedPoints,n);
    mo:=0;
    for g in gl do
        ord:=Order(g);
        if ord < Factorial(n)/2 then
            estimate:=4;
            if n mod 2 = 0 then
                s:=Int(n/2);
                for k in [2..s] do
                    if k <> s then
                        norb:=2*Size(OrbitsDomain(g, Combinations([1..n],k),OnSets));
                    else
                        norb:=Size(OrbitsDomain(g, Combinations([1..n],k),OnSets));
                    fi;    
                    estimate:=estimate+norb;
                    if estimate > 2*n then
                        break;
                    fi;
            od;
            else
                s:=Int(Floor(Float(n/2)));
                for k in [2..s] do
                    norb:=2*Size(OrbitsDomain(g, Combinations([1..n],k),OnSets));
                    estimate:=estimate+norb;
                    if estimate > 2*n then
                        break;
                    fi;
                od;
            fi;
            
            Print("n=",n,"      ",g,"     ","=>",estimate-2*n,"\n");
        fi;
    od;
od;
