
a = [1/7; (3*sqrt(2))/7; 1];
b = [3/5; (3*sqrt(2))/5; 1];
c = [3/5; sqrt(2); 1];
d = [1/7; (5*sqrt(2))/7; 1]; 

aa=[0; 0; 1];
bb=[1; 0; 1];
cc=[1; 1; 1];
dd=[0; 1; 1];

PL2 = [a b c d];
PL1 = [aa bb cc dd];

CoefficientMtx = zeros(8,9);

CoefficientMtx(1,:)= [PL1(1,1) PL1(2,1) 1 0 0 0 -PL1(1,1)*PL2(1,1) -PL1(2,1)*PL2(1,1) -PL2(1,1)];
CoefficientMtx(2,:)= [0 0 0 PL1(1,1) PL1(2,1) 1 -PL1(1,1)*PL2(2,1) -PL1(2,1)*PL2(2,1) -PL2(2,1)];
CoefficientMtx(3,:)= [PL1(1,2) PL1(2,2) 1 0 0 0 -PL1(1,2)*PL2(1,2) -PL1(2,2)*PL2(1,2) -PL2(1,2)];
CoefficientMtx(4,:)= [0 0 0 PL1(1,2) PL1(2,2) 1 -PL1(1,2)*PL2(2,2) -PL1(2,2)*PL2(2,2) -PL2(2,2)];
CoefficientMtx(5,:)= [PL1(1,3) PL1(2,3) 1 0 0 0 -PL1(1,3)*PL2(1,3) -PL1(2,3)*PL2(1,3) -PL2(1,3)];
CoefficientMtx(6,:)= [0 0 0 PL1(1,3) PL1(2,3) 1 -PL1(1,3)*PL2(2,3) -PL1(2,3)*PL2(2,3) -PL2(2,3)];
CoefficientMtx(7,:)= [PL1(1,4) PL1(2,4) 1 0 0 0 -PL1(1,4)*PL2(1,4) -PL1(2,4)*PL2(1,4) -PL2(1,4)];
CoefficientMtx(8,:)= [0 0 0 PL1(1,4) PL1(2,4) 1 -PL1(1,4)*PL2(2,4) -PL1(2,4)*PL2(2,4) -PL2(2,4)];

ns = null(CoefficientMtx);

H = [ns(1) ns(2) ns(3);ns(4) ns(5) ns(6); ns(7) ns(8) ns(9)];

NewPL2 = H*PL1;

for i=1:4
       NewPL2(:,i)=NewPL2(:,i)/NewPL2(3,i)
end

plot3([PL1(1,:),PL1(1,1)],[PL1(2,:),PL1(2,1)],[PL1(3,:),PL1(3,1)]);hold on
plot3([NewPL2(1,:),NewPL2(1,1)],[NewPL2(2,:),NewPL2(2,1)],[NewPL2(3,:),NewPL2(3,1)]);