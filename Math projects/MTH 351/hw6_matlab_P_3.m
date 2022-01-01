clear all;
clc;
a=10^-10

A=[1+a^2,1;1,1+a^2]
b=[a^2;-a^2]

[C,R]=qr(A,b)

