clc; clear all; close all;

h = linspace(0,.3,100);
z = -10.*h;

r = {
    1+z,                                            ... % fwd
    1./(1-z),                                       ... % bwd
    (1+z./2)./(1-z./2),                             ... % trap and mid
    1+z+(z.^2)./2,                                  ... % rk2
    1+z+(z.^2)./2+(z.^3)./6+(z.^4)./24,             ... % rk4
    ((1-15.*h)+sqrt((1-15.^h).^2+20.*h))./2,        ... % ab2
    ((1-15.*h)-sqrt((1-15.^h).^2+20.*h))./2         ... % ab2    
};


figure(1)
for i = 1:length(r)
    x = h;
    y = abs(r{i});
    plot(x,y)
    xlim([0 0.3])
    ylim([0 1])
    hold on
end
legend('Forward','Backward','Trapezoidal and Midpoint','RK2','RK4','AB2','AB2')
title('R Value with Increasing h')
xlabel('Step size (h)')
ylabel('|R(-10h)|')



