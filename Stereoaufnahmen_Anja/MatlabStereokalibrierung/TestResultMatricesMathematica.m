MathematicaP2 = [0.97403	-0.182244	-0.134358	0.987675
-0.211478	-0.520293	-0.827389	-0.156491
0.0808811	0.834315	-0.545322	-0.00298775
0 0 0 1];

a=[1; 0; 0; 1];
b=[2; 0; 0; 1];
c=[2; 1; 0; 1];
d=[1; 1; 0; 1];
%e=[0; 0; 4; 1];
%f=[1; 0; 4; 1];
%g=[1; 1; 4; 1];
%h=[0; 1; 4; 1];

PL1 = [a b c d];

Test=zeros(4, 4);

s= a.'*MathematicaP2;

for i=1:4
Test(:,i) = PL1(:,i).'*MathematicaP2;
Test(:,i) = Test(:,i)/Test(4,i);
end

plot3([PL1(1,:),PL1(1,1)],[PL1(2,:),PL1(2,1)],[PL1(3,:),PL1(3,1)]);hold on
plot3([Test(1,:),Test(1,1)],[Test(2,:),Test(2,1)],[Test(3,:),Test(3,1)]);