tic
clc;
clear all;
close all;
%%sequence
f=[1 1 1 -1 1 1 -1 1 1 1 1 -1 -1 -1 1 -1 ];
length = 16;
%%
t = 0 : 0.0001 : 1;

Sc = 0;

k = 0 : length-1;

temp(l) = exp(1i * 2 * pi .* k)


Sc = f(k+1) .* exp(1i * 2 * pi .* k .* t);

Sc_sum = sum(Sc);

%%PAPR formulation
Pc = Sc_sum .* conj(Sc_sum);
IAPR = Pc / length;
%%plot

plot(t , IAPR , '-b' );
grid on
yticks([0 : 0.2 : 2]);
axis([0 1 0 2]);
xlabel('t');
ylabel('The instantaneous-to-average power ratio');
papr_value=max(IAPR);
disp("The PAPR of f is");disp(papr_value);
toc