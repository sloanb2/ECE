clear all;
clc;

x(1)=2;                                     %Given x_0 = 2

for k=1:7                                   %For 7 iterates
    x(k+1)=(5/6)*(x(k)+((3/5)/(x(k)^5)));   %Calculated via Newtons Method
end

format longe
x'


xr(1)=2;
diffx=diff(x');

for k=1:7                                   %For 7 iterates
    xr(k+1)=(5/6)*(diffx(k)+((3/5)/(diffx(k)^5)));   %Calculated via Newtons Method
end

format longe
xr'
