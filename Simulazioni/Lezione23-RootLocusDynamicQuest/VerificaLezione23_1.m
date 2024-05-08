% verifica vista al minuto 1:25:00 lezione 23
clear
clc
close all;
sys = tf([1 3], [conv([1 1], [1 10]), 0]);
zpk(sys)    % visualizzo poli zeri e guadagno

ctrl = tf(28.7, 1);        % definisco il controllore come semplice controllore proporzionale
loop = series(ctrl, sys);   % la funzione di anello è la serie tra controllore ed impianto
syscl = feedback(loop, 1);  % la fdt in anello chiuso

step(syscl);
grid on; hold on;

% disegno un segmento che parte da x=0 ed arriva ad x=3.5 ad un'altezza
% (ordinata) costante di 1.01. Coloro la retta di rosso
plot([0 3.5], [1.01 1.01], 'r');

% stessa cosa di prima
plot([0 3.5], [0.99 0.99], 'r');

% disegno una retta verticale in 2.44 che arriva ad un'altezza di 0.99
plot([2.44 2.44], [0 0.99], 'k'); 