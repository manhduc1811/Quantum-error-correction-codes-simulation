clear;
clc;
%Creat GATE:
fprintf('Running...\n');
gate2CN=[ 1 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0;
        0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 0 1;
        0 0 0 0 0 0 1 0;
        0 0 0 0 0 1 0 0;
        0 0 0 0 1 0 0 0];
%Correct Gate:
gate2CT=[ 1 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0;
        0 0 0 0 0 0 0 1;
        0 0 0 0 1 0 0 0;
        0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 1 0;
        0 0 0 1 0 0 0 0;
        ];
%-----------------------
%Creat ERRORS:
Xgate=[ 0 1;
        1 0];    
Error0=eye(2^3);

Error1=kron(Xgate,eye(2));
Error1=kron(Error1,eye(2));

Error2=kron(eye(2),Xgate);
Error2=kron(Error2,eye(2));

Error3=kron(eye(2),eye(2));
Error3=kron(Error3,Xgate);
%-----------------------
%Setup qubit input:
q_zero=qubit0(1);
q_one=qubit1(1);
q1=(3/5)*q_zero+(4/5)*q_one;
q2=qubit0(2);
%-----------------------
%Init
Phi1=kron(q1,q2);
Phi2=gate2CN*Phi1;
%Applying Error
Phi3=Error3*Phi2;
%Decode
Phi4=gate2CN*Phi3;
Phi5=gate2CT*Phi4;
fprintf('Finished!\n');
