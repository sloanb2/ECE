clear all;
clc;


x(1)=1;                                     %Given x_0 = 1
x(2)=2;                                     %Given x_1 = 2

for k=3:10                                  %For 10 iterates
    x(k)=x(k-1) - ((x(k-1)^6)-3)*((x(k-1)-x(k-2))/(((x(k-1)^6)-3)-((x(k-2)^6)-3)));
end

format longe
x'

xr(1)=1;                                     %Given x_0 = 1
xr(2)=2;                                     %Given x_1 = 2
diffx=diff(x');
for k=3:10                                  %For 10 iterates
xr(k)=diffx(k-1)-((diffx(k-1)^6)-3)*((diffx(k-1)-diffx(k-2))/...
    (((diffx(k-1)^6)-3)-((diffx(k-2)^6)-3)));
end
xr'