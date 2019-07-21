A = ones(4,4);

A(1,2) = -1; A(1,3) = -1; A(1,4) = -1;
A(2,2) = -1;
A(3,3) = -1;
A(4,4) = -1;

W = [0 0 0];
Wk = [0 0 0];

disp(W);
disp('----------------');

Poprawne_Iteracje_W = 0;
Poprawne_Iteracje_WK = 0;

while (Poprawne_Iteracje_WK < 4)
    //losowe wybranie wektora trenującego
    Nr_Wektora = round(rand()*3)+1;
            
    S = A(Nr_Wektora,1) * W(1) + A(Nr_Wektora,2) * W(2) + A(Nr_Wektora,3) * W(3);
    
    Sig = 0;
    if S > 0 then
        Sig = 1;
    end
    if S < 0 then
        Sig = -1;
    end
    
    Sk = A(Nr_Wektora,1) * Wk(1) + A(Nr_Wektora,2) * Wk(2) + A(Nr_Wektora,3) * Wk(3);
    
    SigK = 0;
    if Sk > 0 then
        SigK = 1;
    end
    if Sk < 0 then
        SigK = -1;
    end
    
    if ((SigK > 0) & (A(Nr_Wektora,4) == 1)) | ((SigK < 0) & (A(Nr_Wektora,4) == -1)) then
        Poprawne_Iteracje_WK = Poprawne_Iteracje_WK + 1;
    else
        Poprawne_Iteracje_WK = 0;
    end
    
    
    //jeśli następuje poprawa klasyfikacyjna
    if ((Sig > 0) & (A(Nr_Wektora,4) == 1)) | ((Sig < 0) & (A(Nr_Wektora,4) == -1)) then
        Poprawne_Iteracje_W = Poprawne_Iteracje_W + 1;
        
        if Poprawne_Iteracje_W > Poprawne_Iteracje_WK then
            for j=1:3
                Wk(j) = W(j);
            end
            Poprawne_Iteracje_WK = Poprawne_Iteracje_W;
            Poprawne_Iteracje_W = 0;
        end
    else
        Poprawne_Iteracje_W = 0;
    
        if S ~= 0 then
            for j=1:3
                W(j) = W(j) + 0.5*((A(Nr_Wektora,4) - Sig) * A(Nr_Wektora,j)); 
            end
        else
            for j=1:3
                W(j) = W(j) + A(Nr_Wektora,4) * A(Nr_Wektora,j);
            end
        end
    end
    
end

disp(Wk);

for i=1:4

u1 = input('Podaj u1: ');
u2 = input('Podaj u2: ');

Sk = 1 * Wk(1) + u1 * Wk(2) + u2 * Wk(3);

SigK = 0;

if Sk > 0 then
    SigK = 1;
end
if Sk < 0 then
    SigK = -1;
end

disp(SigK,'Sig dla WK = ');

end

