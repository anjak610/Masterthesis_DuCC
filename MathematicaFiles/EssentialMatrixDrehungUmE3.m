%Drehung um e2

syms cos sin a t1 t2 t3 x y z;

M1= [x;y;z;1];

M11 = [x y z 1];

%M2 = [a -a 0 0;a a 0 0;0 0 1 0;t1 t2 t3 1];
M2 = [cos -sin 0 0;sin cos 0 0; 0 0 1 0;t1 t2 t3 1];

M3 = [1 0 0;0 1 0;0 0 1;0 0 0];

M4 = [0 -t3 t2; t3 0 -t1; -t2 t1 0];

%M5 = [a -a 0 ;a a 0;0 0 1];
M5 = [cos -sin 0;sin cos 0;0 0 1];

Rt = transpose(M5);% [a 0 a;0 1 0;-a 0 a;];

M6= [1 0 0 0;0 1 0 0;0 0 1 0];

%Ausprobieren: Mit M1 zuerst verrechnen!!!!

s1= mtimes(Rt,M6);

s2 = mtimes(M4,s1);

s3= mtimes(M3,s2);

s4 = mtimes(M2,s3);

s5 = mtimes(s4,M1);

s6= mtimes(M11,s5);