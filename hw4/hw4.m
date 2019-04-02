%% Question 2 

clc; close all;

n = 10;
h = 1/(n+1);
tri = full(gallery('tridiag',n,1,-2,1));

func = @(x) (4*pi)^2*cos(4*pi*x)*h^2;

f = [];
x = [];

for i=1:n
    x(i) = h*i;
    f(i) = func(x(i));
end
f(n) = f(n) - 2;
f(1) = 0;
x = [0 x 1];
x = x';
u = tri\f';
u = [0;u;2];

ax = solutionAN10000(:,1);
ay = solutionAN10000(:,2);

figure
plot(x,u);
hold on
plot(ax,ay)
title('U vs. x')
legend('U','Exact')
xlim([0 1])
xlabel('x')
ylabel('U')

fid = fopen('q2data.txt','w');
fprintf(fid, '\tx\t\t\tu\n');
fprintf(fid,'%f\t%f\n',[x,u].');

%% Question 3
clc; clear all; close all;

N = [5,10,20,40,80,160,320,640,1280];
f = [];


n = 10^4;
h = 1/(n+1);
tri = full(gallery('tridiag',n,1,-2,1));
func = @(x) (4*pi)^2*cos(4*pi*x)*h^2;
f1 = [];
x1 = [];
for i=1:n
    x1(i) = h*i;
    f1(i) = func(x1(i));
end
f1(n) = f1(n) - 2;
x1 = [0 x1 1];
x1 = x1';
u1 = tri\f1';
u1 = [0;u1;2];


for i=1:9
    n = N(i);
    h = 1/(n+1);
    tri = full(gallery('tridiag',n,1,-2,1));
    x = [];
    func = @(x) (4*pi)^2*cos(4*pi*x)*h^2;
    
    for j=1:n
        x(j) = h*j;
        f(j) = func(x(j));
    end
    f(n) = f(n) - 2;
    f(1) = 0;
    x = [0 x 1];
    x = x';
    u = tri\f';
    u = [0;u;2];
    
    
    E = [];
    
    for j=1:n
        E(j) = (u(j) - u1(j))^2; 
    end
    E_sum = sum(E);
    E_final = sqrt(E_sum);
    e = E_final/n;
    
    
    E_vec(i) = E_final;
    e_vec(i) = e;
    
    
    
    
end

loglog(1./N,E_vec)
hold on
loglog(1./N,e_vec)
hold on

title('E and e vs. 1/h')
legend('E', 'e')
xlabel('1/h')
dim = [.2 .4 .3 .2];
str = 'We can see that E is order O(h) while e is O(h^2)';
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on');


%% Question 5
clc; close all;

n = 10;
h = 1/(n+1);
tri = full(gallery('tridiag',n,1,-2,1));
tri(1,1) = -2/3;
tri(1,2) = 2/3;

func = @(x) (4*pi)^2*cos(4*pi*x)*h^2;
f = [];
x = [];

for i=1:n
    x(i) = h*i;
    f(i) = func(x(i));
end
f(1) = f(1) + (20/3)*h;
f(n) = f(n) - 2;

x = [0 x 1];
x = x';
u = tri\f';
u0 = -(20/3)*h+(4/3)*u(1)-(1/3)*u(2);
u = [u0;u;2];



ax = solutionBN10000(:,1);
ay = solutionBN10000(:,2);

figure
plot(x,u)
hold on
plot(ax,ay)
title('U vs. x')
legend('Numerical Solution','Exact', 'Location', 'northwest')
xlabel('x')
ylabel('u')

fid = fopen('q5data.txt','w');
fprintf(fid, '\tx\t\t\tu\n');
fprintf(fid,'%f\t%f\n',[x,u].');

