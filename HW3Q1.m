clear 
clc
syms R f Vin;

%Plug in found equations
A1 = [ 1  0  R   0;
      -1  0  0  R/f;
       0  0  -1   1;
       1 -1  0    0;]

%Verify size 
size(A1)

B = [Vin; 0; 0; 0]
size(B)

x=A1\B

v_ = x(2) %note: V_ = Vout (Same potential difference from circuit)
Vout = v_

%Transfer function:
H = Vout/Vin
