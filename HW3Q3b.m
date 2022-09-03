clear 
clc
syms R M1 M2 M3 r ma mb mc f I1 I2 I3 ia ib ic IR io Vm Vp Vout Im;
syms V1 V2 V3 va vb vc;
A=[R/M1 0   0     0    0    0    0  0  1 0 0; %1
   0    R/M2 0    0    0    0    0  0  1 0 0; %2
   0    0    R/M3 0    0    0    0  0  1 0 0; %3
   0    0    0    0    0    0    R  0 -1 0 1; %4
   0    0    0    r/ma 0    0    0  0  0 1 0; %5
   0    0    0    0    r/mb 0    0  0  0 1 0; %6
   0    0    0    0    0    r/mc 0  0  0 1 0; %7
   0    0    0    0    0    0    0  r/f  -1 0 0; %8
   1    1    1    0    0    0   0  0    0 0 0; %9
   0    0    0    0    0    0    1 1   0  0 0;  %10
   0    0    0    0    0    0    0  0   1 -1 0 ;] %11
%size(A)
B=[V1; V2; V3; 0; va; vb; vc; 0; Im; Im; 0]; x=A\B;
%size(B)
%% Obtains values from x
I1 = x(1);
I2 = x(2);
I3 = x(3);
ia = x(4);
ib = x(5);
ic = x(6);
IR = x(7);
io = x(8);
Vm = x(9);
Vp = x(10);
Vout = x(11)

%effectively applies abs(f)
f = -(ma + mb + mc) + (M1 + M2 +M3 +1)

Vout = simplify ( (M1*V1*r - Im*R*r + M2*V2*r + M3*V3*r - Im*R^2*f - Im*M1*R*r - Im*M2*R*r - Im*M3*R*r + M1*R*V1*f + M2*R*V2*f + M3*R*V3*f)/(r*(M1 + M2 + M3)) )
