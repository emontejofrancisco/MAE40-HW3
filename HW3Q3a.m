clear 
clc
syms R M1 M2 M3 r ma mb mc f I1 I2 I3 ia ib ic IR io Vm Vp Vout;
syms V1 V2 V3 va vb vc;
A=[R/M1 0   0     0    0    0    0  0  1 0 0; %1
   0    R/M2 0    0    0    0    0  0  1 0 0; %2
   0    0    R/M3 0    0    0    0  0  1 0 0; %3
   0    0    0    0    0    0    R  0 -1 0 1; %4
   0    0    0    r/ma 0    0    0  0  0 1 0; %5
   0    0    0    0    r/mb 0    0  0  0 1 0; %6
   0    0    0    0    0    r/mc 0  0  0 1 0; %7
   0    0    0    0    0    0    0  r/f  0 -1 0; %8
   1    1    1    0    0    0   -1  0    0 0 0; %9
   0    0    0    1    1    1    0 -1   0  0 0;  %10
   0    0    0    0    0    0    0  0   1 -1 0 ;] %11
%size(A)
B=[V1; V2; V3; 0; va; vb; vc; 0; 0; 0; 0]; x=A\B;
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
f = -(ma + mb + mc) + M1 + M2 +M3 +1

%Eqn 10.18 (Line 34 Simplifies output of x(11) and apples definition for f 
Vout = simplify ( (ma*va + mb*vb + mc*vc - M1*V1*f - M2*V2*f - M3*V3*f - M1*V1*ma - M2*V2*ma - M3*V3*ma - M1*V1*mb - M2*V2*mb - M3*V3*mb - M1*V1*mc - M2*V2*mc - M3*V3*mc + M1*ma*va + M2*ma*va + M3*ma*va + M1*mb*vb + M2*mb*vb + M3*mb*vb + M1*mc*vc + M2*mc*vc + M3*mc*vc)/(f + ma + mb + mc) )






