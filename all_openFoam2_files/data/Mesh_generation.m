%% Generates the mesh for OF2, flow around a cylinder
clear all; close all; clc;

%   Length and Height
L_u=input('Length upstream: ');
L_d=input('Length downstream: ');
H=input('Height from cylinder to floor/ceiling: ');

%   Number of circles
circles=input('# of inner circles evaluated: ');

%   Size of Radius
R=zeros(circles,1);
for i=1:circles
    R(i)=input('Radius of circle: ');
end

%   Number of cells per block in each direction
a=input('Cells in x direction(for circle): ');
b=input('Cells in y direction(for circle): ');
c=input('Cells in z direction(for circle): ');

%   Grading in each direction
grad_x=input('Grading in x direction: ');
grad_y=input('Grading in y direction: ');
grad_z=input('Grading in z direction: ');

%   Assembly of cell and grading vector
cells = [a,b,c];
grading = [grad_x,grad_y,grad_z];

%   Z coordinates
z1 = -.05;
z2 = .05;
%% Format of BlockMeshDict

file = fopen('blockMeshDict','w');
fprintf(file,'FoamFile \n{\n\tversion  2.0;\n\tformat   ascii;\n\tclass    dictionary;\n\tobject   blockMeshDict;\n}\n');
fprintf(file,'\n//Lf = %d\tLw = %d\tH = %d\tR = %d\n',L_u,L_d,H,R(1));
fprintf(file,'\n//cells (%d %d %d)\n',cells(1,:));
fprintf(file,'\n//grading (%d %d %d)\n',grading(1,:));
fprintf(file,'\nconvertToMeters 1.0;\n');

%Column1-Vertex# Column2-xcoord Column3-ycoord Column4-zcoord
if circles==1
    N=64;
elseif circles==2
    N=80;
elseif circles==3
    N=96;
end

global_coord=zeros(N,4);

%Creates Inner Circle Coordinates
t=[0:pi/4:2*pi];
temp = [0:pi/8:2*pi];
mid_t = temp(2:2:length(temp));

x=0.5*cos(t);
y=0.5*sin(t);
x_mid = .5*cos(mid_t);
y_mid = .5*sin(mid_t);

mid = [x_mid',y_mid'];

%   Inner circle
for i=1:8
    global_coord(i,1)=i-1;
    global_coord(i,2)=x(i);
    global_coord(i,3)=y(i);
    global_coord(i,4)=z1;
end

%Creates Outer Circles Coordinates
for j=1:circles
    
    x=R(j)*cos(t);
    y=R(j)*sin(t);
    
    for i=(8*j+1):(8*j+8)
        global_coord(i,1)=i-1;
        global_coord(i,2)=x(i-(8*j));
        global_coord(i,3)=y(i-(8*j));
        global_coord(i,4)=z1;
    end
    
end

%Creates Outer Block Coordinates
start=(N/2)-8*(circles+1)+1;

for i=start:(N/2)
    
    if i==start || i==start+1 || i==start+2 || i==start+14 || i==start+15 %Right side x=L_d
        global_coord(i,1)=i-1;
        global_coord(i,2)=L_d;
    end
    if i==start+2 || i==start+3 || i==start+4 || i==start+5 || i==start+6 %Top side y=H
        global_coord(i,1)=i-1;
        global_coord(i,3)=H;
    end
    if i==start+6 || i==start+7 || i==start+8 || i==start+9 || i==start+10 %Left side x=-L_u
        global_coord(i,1)=i-1;
        global_coord(i,2)=-L_u;
    end
    if i==start+10 || i==start+11 || i==start+12 || i==start+13 || i==start+14 %Bottom side y=-H
        global_coord(i,1)=i-1;
        global_coord(i,3)=-H;
    end
    
    global_coord(i,4)=z1;
    
end

xypos=global_coord(start-7,3);
xymid=0;
xyneg=global_coord(start-1,3);

global_coord(start,3)=xymid;
global_coord(start+1,3)=xypos;
global_coord(start+3,2)=xypos;
global_coord(start+4,2)=xymid;
global_coord(start+5,2)=xyneg;
global_coord(start+7,3)=xypos;
global_coord(start+8,3)=xymid;
global_coord(start+9,3)=xyneg;
global_coord(start+11,2)=xyneg;
global_coord(start+12,2)=xymid;
global_coord(start+13,2)=xypos;
global_coord(start+15,3)=xyneg;

for i=(N/2)+1:N
    
   global_coord(i,1)=i;
   global_coord(i,2)=global_coord(i-(N/2),2);
   global_coord(i,3)=global_coord(i-(N/2),3);
   global_coord(i,4)=z2;
    
end

%   Input vertices to blockmeshDict
fprintf(file,'\nvertices\n(\n');
for i=1:length(global_coord(:,1))
    fprintf(file,'\t(%f %f %f)\t//%d\n', global_coord(i,2:4),i-1);
end
fprintf(file,');\n');


Blocks = [0 8 9 1 32 40 41 33;      % 0
          1 9 10 2 33 41 42 34;     % 1
          2 10 11 3 34 42 43 35;    % 2
          3 11 12 4 35 43 44 36;    % 3
          4 12 13 5 36 44 45 37;    % 4
          5 13 14 6 37 45 46 38;    % 5
          6 14 15 7 38 46 47 39;    % 6
          7 15 8 0 39 47 40 32;     % 7
          8 16 17 9 40 48 49 41;    % 8
          9 17 18 19 41 49 50 51;   % 9
          10 9 19 20 42 41 51 52;   % 10
          11 10 20 21 43 42 52 53;  % 11
          23 11 21 22 55 43 53 54;  % 12
          24 12 11 23 56 44 43 55;  % 13
          25 13 12 24 57 45 44 56;  % 14
          26 27 13 25 58 59 45 57;  % 15
          27 28 14 13 59 60 46 45;  % 16
          28 29 15 14 60 61 47 46;  % 17
          29 30 31 15 61 62 63 47;  % 18
          15 31 16 8 47 63 48 40];  % 19
      
%   input blocks to file
fprintf(file,'\nblocks\n(\n');
for i=1:length(Blocks(:,1))
    fprintf(file,'\thex (%d %d %d %d %d %d %d %d)',Blocks(i,:));
    fprintf(file,'\t(%d %d %d)', cells(1,:));
    fprintf(file,'\tsimpleGrading (%d %d %d)', grading(1,:));
    fprintf(file,'\t//block %d\n',i-1);
end
fprintf(file,');\n');
    
%   Create edges/arcs
fprintf(file,'\nedges\n(\n');
arcs = zeros(32,2);
j = 1;
for i=0:14
    if i<7
        fprintf(file,'\tarc %d %d',i,i+1);
        fprintf(file,' (%f %f %f)\t//%d\n', mid(j,:),z1,i);
    elseif i==7
        fprintf(file,'\tarc 7 0 (%f %f %f)\t//%d\n',mid(8,:),z1,i);
        j = 0;
    else
        fprintf(file,'\tarc %d %d',i,i+1);
        fprintf(file,' (%f %f %f)\t//%d\n', 2.*mid(j,:),z1,i);
    end
    j = j+1;
end
fprintf(file,'\tarc 15 8 (%f %f %f)\t//%d\n',2.*mid(8,:),z1,i+1);

k=16;
j=1;
for i=32:46
    if i<39
        fprintf(file,'\tarc %d %d',i,i+1);
        fprintf(file,' (%f %f %f)\t//%d\n', mid(j,:),z2,k);
    elseif i==39
        fprintf(file,'\tarc 39 32 (%f %f %f)\t//%d\n',mid(8,:),z2,k);
        j = 0;
    else
        fprintf(file,'\tarc %d %d',i,i+1);
        fprintf(file,' (%f %f %f)\t//%d\n', 2.*mid(j,:),z2,k);
    end
    j = j + 1;
    k = k+1;
end
fprintf(file,'\tarc 47 40 (%f %f %f)\t//%d\n',2.*mid(8,:),z2,k);
fprintf(file,');\n');

% Create faces
fprintf(file,'\nboundary\n(\n\tinlet\n\t{\n\ttype patch;\n\tfaces\n\t(\n');

%   Inlet
Inlet = zeros(4,4);
Inlet(1,:) = [22 54 55 23];
fprintf(file,'\t\t(%d %d %d %d)\n',Inlet(1,:));
for i=1:3
    Inlet(i+1,:) = Inlet(1,:) + i;
    fprintf(file,'\t\t(%d %d %d %d)\n',Inlet(i+1,:));
end
fprintf(file,'\t);\n\t}\n');

%   Outlet
fprintf(file,'\n\toutlet\n\t{\n\ttype patch;\n\tfaces\n\t(\n');
Outlet = [18 50 49 17;17 49 48 16;16 48 63 31;31 63 62 30];
for i =1:4
    fprintf(file,'\t\t(%d %d %d %d)\n',Outlet(i,:));
end
fprintf(file,'\t);\n\t}\n');

%   Cylinder
fprintf(file,'\n\tcylinder\n\t{\n\ttype wall;\n\tfaces\n\t(\n');
Cylinder = zeros(8,4);
Cylinder(1,:) = [0 32 33 1];
fprintf(file,'\t\t(%d %d %d %d)\n',Cylinder(1,:));
for i=1:6
    Cylinder(i+1,:) = Cylinder(1,:) + i;
    fprintf(file,'\t\t(%d %d %d %d)\n',Cylinder(i+1,:));
end
Cylinder(8,:) = [7 39 32 0];
fprintf(file,'\t\t(%d %d %d %d)\n',Cylinder(8,:));
fprintf(file,'\t);\n\t}\n');

%   Top
fprintf(file,'\n\ttop\n\t{\n\ttype symmetryPlane;\n\tfaces\n\t(\n');
Top = zeros(4,4);
Top(1,:) = [22 54 53 21];
fprintf(file,'\t\t(%d %d %d %d)\n',Top(1,:));
for i=1:3
    Top(i+1,:) = Top(1,:) - i;
    fprintf(file,'\t\t(%d %d %d %d)\n',Top(i+1,:));
end
fprintf(file,'\t);\n\t}\n');

%   Bottom
fprintf(file,'\n\tbottom\n\t{\n\ttype symmetryPlane;\n\tfaces\n\t(\n');
Bottom = zeros(4,4);
Bottom(1,:) = [26 58 59 27];
fprintf(file,'\t\t(%d %d %d %d)\n',Bottom(1,:));
for i=1:3
    Bottom(i+1,:) = Bottom(1,:) + i;
    fprintf(file,'\t\t(%d %d %d %d)\n',Bottom(i+1,:));
end
fprintf(file,'\t);\n\t}\n');
fprintf(file,');');
fprintf(file,'\nmergePatchPairs\n(\n);');
fclose(file);




