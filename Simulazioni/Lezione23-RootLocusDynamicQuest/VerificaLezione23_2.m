% verifica lezione 23 1:40
clear
clc
close all;

sys=tf(1, [1 2 0]);
clearance = -0.1;       % tolleranza
z = 2*(1+clearance);    % simulo la realtà andando a piazzare il polo 
                        % non proprio in -2 ma in 1.8, ovvero con un errore del 10%
N = 10;                 % N rappresenta una decade

ctrl = tf(3 * N * z * [1 z], [1 N*z]);  % creo il controllore
loop = series(ctrl, sys);
syscl = feedback(loop, 1);
step(syscl);
grid on; hold on;