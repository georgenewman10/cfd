ux = [
-0.00252726, 
-0.000713389,
0.00749117,  
0.0204251,   
0.0370426,   
0.0565813,   
0.0784167,   
0.102039,    
0.127029,    
0.153036,    
0.179761,    
0.206941,    
0.234348,    
0.261773,    
0.289027,    
0.315917,    
0.342234,    
0.368043,    
0.394338,    
0.420226,    
0.566647,    
0.733958,    
1.03641,     
1.20562,     
1.13208,     
1.22556,     
1.2615,      
1.26422,     
1.24148,     
1.23725,     
1.22388,     
1.21327,     
1.20084,     
1.18671,
];

uy = [
    0.00340015, 
0.0061004,  
0.0073719,  
0.00765576, 
0.00741245, 
0.00703055, 
0.00677473, 
0.00682944, 
0.00732535, 
0.00835205, 
0.00996574, 
0.0121927,  
0.0150282,  
0.0184316,  
0.0223101,  
0.0264709,  
0.0305826,  
0.0344824,  
0.038787,   
0.0418061,  
-0.0806473, 
-0.0718593, 
-0.0105719, 
0.0415845,  
-0.00441855,
0.0171466,  
0.0296332,  
0.0354631,  
0.00083237, 
0.00775908, 
0.0117773,  
-0.00480956,
-0.00115616,
0.00126437,
];




ur1 = [];
ut1 = [];
for i = 1:34
    ur1(i) = sqrt(ux(i)^2 + uy(i)^2);
    ut1(i) = atan(uy(i)/ux(i));
end
ur1 = ur1';
ut1 = ut1';

s = linspace(0,3.37,34);



ux2 = [
    -0.00479741
0.0100458 
0.0434722 
0.0877774 
0.138484 	 
0.192492 	 
0.247232 	 
0.300757 	 
0.352384 	 
0.399548 	 
0.6443 	   
1.0276 	   
1.30447 	 
1.30422 	 
1.25739 	 
1.22643 	 
1.17691 	 
1.16197 	 
1.12801 	 
1.10211 	 
1.09228 	 
];

uy2 = [
    0.00814474 
0.00850323 
0.00607649 
0.00337774 
0.00194896 
0.00275104 
0.00610485 
0.0121969 	
0.0215721 	
0.0303162 	
-0.0909415 
-0.0588005 
0.00193527 
0.0554381 	
0.00804373 
0.00616259 
0.00602683 
-0.0109821 
-0.00717608
-0.00454448
-0.0078288 
];




ur2 = [];
ut2 = [];
for i = 1:length(ux2)
    ur2(i) = sqrt(ux2(i)^2 + uy2(i)^2);
    ut2(i) = atan(uy2(i)/ux2(i));
end
ur2= ur2';
ut2 = ut2';

s = linspace(0,3.37,34);

figure
plot(s,ut1)
hold on
plot(s2,ut2)
title('Utheta vs. S')
ylabel('Utheta (M/s)')



s2 = linspace(0,4.56,21);
figure
plot(s,ur1)
hold on
plot(s2,ur2)
title('U_r vs. S')
ylabel('U_r (M/s)')
