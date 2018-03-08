MathematicaP3RightHanded = [0.998795	-0.0166209	-0.0461764	-0.999019
0.0125832	-0.82272	0.568307	-0.0442335
-0.047436	-0.568204	-0.82152	-0.00192209
0 0 0 1];

MathematicaP2LeftHanded = [-0.997455	0.0637154	-0.031995	0.999388
0.0239921	-0.122626	-0.992163	-0.0349693
0.0671395	0.990406	-0.120786	-0.00120798
0 0 0 1];

MathematicaP3 =  [0.997455	-0.0637154	0.031995	0.999388
-0.0239921	0.122626	0.992163	-0.0349693
-0.0671395	-0.990406	0.120786	-0.00120798
0 0 0 1];

MatlabP2 =  [    0.5974   -0.6060   -0.5253   -0.7729
    0.6610    0.0013    0.7504   -0.0356
   -0.4540   -0.7955    0.4013    0.6335
0 0 0 1];

MathematicaK1PM =[];

K1 = [17.3158028 0 6.146589863 0; 0 17.31981867 4.600615527 0; 0 0 1 0;0 0 0 1];
K2 = [18.60732121 0 4.145650968 0; 0 18.58796099 3.22706539 0; 0 0 1 0;0 0 0 1];

 
M=[1 0 0;0 1 0;0 0 1].'*[1 0 0 0;0 1 0 0;0 0 1 0];
M=[M(1,1) M(1,2) M(1,3) M(1,4);M(2,1) M(2,2) M(2,3) M(2,4);M(3,1) M(3,2) M(3,3) M(3,4);0 0 0 1];
PMK1 =K1*M;
PMK2= K2*MathematicaP3RightHanded;
MatlabPMK2= K2*MatlabP2;


a=[1; 0; 0; 1];
b=[2; 0; 0; 1];
c=[2; 1; 0; 1];
d=[1; 1; 0; 1];
e=[1; 0; 1; 1];
f=[2; 0; 1; 1];
g=[2; 1; 1; 1];
h=[1; 1; 1; 1];

PL1 = [a b c d e f g h];
PL2 = [a b c d e f g h];

Test=zeros(4, 8);
TestMatlab=zeros(4, 8);
TestK1=zeros(4, 8);


for i=1:8
%Test(:,i) = MathematicaP3RightHanded*PL1(:,i);
Test(:,i) = PMK2*PL1(:,i);
Test(:,i) = Test(:,i)/Test(4,i);

TestK1(:,i) = PMK1*PL1(:,i);
TestK1(:,i) = TestK1(:,i)/TestK1(4,i);

%TestMatlab(:,i) = MatlabP2*PL2(:,i);
TestMatlab(:,i) = MatlabPMK2*PL2(:,i);
TestMatlab(:,i) = TestMatlab(:,i)/TestMatlab(4,i);

end


figure
subplot(1,2,1)       % add first plot in 2 x 1 grid
%plot3([PL1(1,:),PL1(1,1)],[PL1(2,:),PL1(2,1)],[PL1(3,:),PL1(3,1)]);hold on
plot3([TestK1(1,:),TestK1(1,1)],[TestK1(2,:),TestK1(2,1)],[TestK1(3,:),TestK1(3,1)]);hold on
plot3([Test(1,:),Test(1,1)],[Test(2,:),Test(2,1)],[Test(3,:),Test(3,1)]);
xlabel('x');
ylabel('y');
zlabel('z');
title('Projektionsmatrix Mathematica')

subplot(1,2,2)       % add second plot in 2 x 1 grid
%plot3([PL2(1,:),PL2(1,1)],[PL2(2,:),PL2(2,1)],[PL2(3,:),PL2(3,1)]);hold on
plot3([TestK1(1,:),TestK1(1,1)],[TestK1(2,:),TestK1(2,1)],[TestK1(3,:),TestK1(3,1)]);hold on
plot3([TestMatlab(1,:),TestMatlab(1,1)],[TestMatlab(2,:),TestMatlab(2,1)],[TestMatlab(3,:),TestMatlab(3,1)]);
xlabel('x');
ylabel('y');
zlabel('z');
title('Projektionsmatrix Matlab')

