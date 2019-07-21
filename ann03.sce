//---- perceptron trenowanie
//---- okreslenie par wektorow trenujacych
//---- dla funktora AND
A = ones(4,4);

A(1,2) = -1; A(1,3) = -1; A(1,4) = -1;
A(2,2) = -1;
A(3,3) = -1;


//---- wykreslenie obszaru klasyfikacji
mtlb_hold on;

for i=1:4
    if A(i,4)==1
        plot(A(i,2),A(i,3),'ko:');
    else
        plot(A(i,2),A(i,3),'r+:');
    end
end

mtlb_axis([-2 2 -2 2]);


//---- ustalenie poczatkowych wartosci wag
W=[0 0 0];


//---- proces trenowania
disp(W);
disp('----------------');

BrakZmiany=0;
Nr_Wektora=1;

while (BrakZmiany<4)
//--- kolejno pobiera wektory trenujace
S=A(Nr_Wektora,1)*W(1)+A(Nr_Wektora,2)*W(2)+A(Nr_Wektora,3)*W(3);
Sig=0;
    if S>0
        Sig=1;
    end
    if S<0
        Sig=-1;
    end
    if ((Sig>0) & (A(Nr_Wektora,4)==1)) | ((Sig<0) & (A(Nr_Wektora,4)==-1))
        W=W;
        BrakZmiany=BrakZmiany+1;
    else
        BrakZmiany=0;
    if S~=0
        for j=1:3
            W(j)=W(j)+0.5*(A(Nr_Wektora,4)-Sig)*A(Nr_Wektora,j);
        end
    else
        for j=1:3
            W(j)=W(j)+A(Nr_Wektora,4)*A(Nr_Wektora,j);
        end
    end
    end

disp(W);

Nr_Wektora=Nr_Wektora+1;
    
    if Nr_Wektora>4
        Nr_Wektora=1;
    end
end

u1 = input('Podaj u1: ');
u2 = input('Podaj u2: ');

S = 1 * W(1) + u1 * W(2) + u2 * W(3);

Sig = 0;

if S > 0 then
    Sig = 1;
end
if S < 0 then
    Sig = -1;
end

disp(Sig,'Sig = ');


//---- wykreslenie otrzymanej linii podzialu
k=0;
    for i=-2:0.01:2
        k=k+1;
        XX(k)=i;
        YY(k)=-((W(2)/W(3))*i)-(W(1)*1)/W(3);
    end
plot(XX,YY);
mtlb_axis([-2 2 -2 2]);