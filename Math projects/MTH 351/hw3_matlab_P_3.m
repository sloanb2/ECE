clear all;
clc;
a=10^-10

a=[1+a^2,1;1,1+a^2]

[Q,R]=qr(a)

