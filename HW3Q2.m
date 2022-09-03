clear 
clc
syms R1 R2 s C1 C2 Vin Vo a A

A1 = [R1 0  0  0  1     0;
     0  1  0  0  C1*s  0;
     0  0  R2 0 -1     1;
     0  0  0  1 -C2*s  C2*s; 
     1  1 -1 -1  0     0;
     0  0  0  0  1     0;]

%Note As A approaches inf, V_==V+ as
% displayed in the last row of matrix A

%size(A1)

B = [Vin; C1*s*Vin; 0; 0; 0; 0;]

x=A1\B

Vo = x(6)

%Transfer function
H = simplify ( Vo/Vin )

