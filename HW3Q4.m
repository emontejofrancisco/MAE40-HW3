clear 
clc
syms K s Wo Q R2 R1 R C

%Verify equation
Fnotch = K * (s^2+Wo^2) / ( s^2 + ( Wo/Q*s ) + Wo^2 )

K = 1 + R2/R1
Q = 1 / (2 *(2 - K) )
Wo = 1 / (R*C)

finalform = simplify ( K * (s^2+Wo^2) / ( s^2 + ( Wo/Q*s ) + Wo^2 ) )

syms C s V1 V2 R R2 R1 Iin
%system of equations
A=[-1 0   0     0    0    0    0  0  0 0 0 C*s 0; %1
   0    1 0    0    0    0    0  0  0 0 C*s 0 0; %2
   0    0    R/2 0    0    0    0  0  1 0 0 0 1; %3
   0    0    0    -1    0    0    0  0 0 0 0 1 0; %4
   0    0    0    0 R    0    0  0  0 0 1 0 0; %5
   0    0    0    0    0 1    0  0  0 0 0 0 0; %6
   0    0    0    0    0    0 R2  0  0 -1 0 0 1; %7
   0    0    0    0    0    0    0  R1  0 -1 0 0 0; %8
   0    0    0    -1   1    1   0  0    0 0 0 0 0; %9
   0    0    0    0    1    0    0  0  1  0 0 0 0;  %10 
   -1   0    1    0    0    0    0  0  1  0 0 0  0; %11
   1    0    0    1   0     0    0   0  0  0 0 0 0;

   0    0    0    0    0    0    0  0  0 1 -1 0 0;] %11
size(A);

B=[C*s*V1; C*s*V1; V1; V2; V2; 2*C*V2; 0; 0; 0; 0; 0; 0; 0]; x=A\B

size(B);
%Vout
Vout = x(13)



