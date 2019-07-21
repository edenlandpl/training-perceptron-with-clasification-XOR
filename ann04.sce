//---- perceptron trenowanie
//---- okreslenie par wektorow trenujacych
//---- dla podanej funkcji logicznej
A=ones(8,5);

A(1,2)=-1; A(1,3)=-1; A(1,4)=-1; A(1,5)=-1;
A(2,2)=-1; A(2,3)=-1; A(2,5)=-1;
A(3,2)=-1; A(3,4)=-1; A(3,5)=-1;
A(4,2)=-1; A(4,5)=-1;
A(5,3)=-1; A(5,4)=-1; A(5,5)=-1;
A(6,3)=-1;
A(7,4)=-1; A(7,5)=-1;
A(8,5)=-1;

//---- ustalenie poczatkowych wartosci wag
W=[0 0 0 0];

//---- proces trenowania
disp(W);
disp('----------------');

BrakZmiany = 0;
Nr_Wektora = 1;

while (BrakZmiany < 8)
    S = A(Nr_Wektora,1)*W(1) + A(Nr_Wektora,2)*W(2) + A(Nr_Wektora,3)*W(3) + A(Nr_Wektora,4)*W(4);
    
    Sig = 0;
    
    if S > 0 then
        Sig = 1;
    end
    if S < 0 then
        Sig = -1;
    end
    
    if ((Sig > 0) & (A(Nr_Wektora,5) == 1)) | ((Sig < 0) & (A(Nr_Wektora,5) == -1)) then
        W = W;
        BrakZmiany = BrakZmiany + 1;
    else
        BrakZmiany = 0;
        
        if S ~= 0 then
            for j=1:4
                W(j) = W(j) + 0.5 * ((A(Nr_Wektora,5) - Sig) * A(Nr_Wektora,j));
            end
        else
            for j=1:4
                W(j) = W(j) + A(Nr_Wektora,5) * A(Nr_Wektora,j);
            end
        end
    end
    
disp(W);

Nr_Wektora = Nr_Wektora + 1;

    if Nr_Wektora > 8 then
        Nr_Wektora = 1;
    end
end

u1 = input('Podaj u1: ');
u2 = input('Podaj u2: ');
u3 = input('Podaj u3: ');

S = 1 * W(1) + u1 * W(2) + u2 * W(3) + u3 * W(4);

Sig = 0;

if S > 0 then
    Sig = 1;
end
if S < 0 then
    Sig = -1;
end

disp(Sig,'Sig = ');