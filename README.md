# ControlliAutomatici
Repository dedicata all'esame di sistemi di Controlli Automatici

## Articoli utili

- **Calcolo di errori a regime**: [link](http://www.dii.unimo.it/~zanasi/didattica/Controlli_Automatici/Luc_CA_2021_Errori_a_regime.pdf)

# Argomenti menzionati allo scritto

## Prima parte

- [ ] Margine di 180° nel diagramma di Nyquist
- [ ] Margine di fase
- [ ] Errore di velocità con ingresso rampa
- [ ] Domande puramente teoriche
  - [ ] Vantaggi del controllo a ciclo aperto

## Seconda parte

- [ ] Errore di posizione e velocità

# Tips

## Perchè è preferibile un integratore rispetto ad un derivatore?

Perchè possiamo sempre calcolare l'area sottesa ad una curva, ma non sempre possiamo effettuare la derivata.

## Simulare controllore a ciclo chiuso MatLab

Vogliamo inserire la seguente funzione di trasferimento nell'ambiente MatLab. 

![lagrida_latex_editor](assets/lagrida_latex_editor.png)

Possiamo farlo in 3 modi:

1. Svolgere le moltiplicazioni ed inserire la FDT come vettori (che rappresentano i polinomi al numeratore e denominatore)
2. Definire la variabile 's' ed inserire la FDT come frazione in s
3. Inserire la FDT come **convoluzione**

```matlab
sys = tf(1, [conv([1 3], [1 5], 0)]);
% la convoluzione tira fuori un array di convoluzione tra i due arrai in input, che rappresentano la moltiplicazione (s+3)*(s+5), aggiungiamo manualmente lo zero alla fine perchè lo zero in origine possiamo rappresentarlo shiftando il polinomio verso sinistra.
```

Matlab stamperà la FDT svolgendo le moltiplicazioni, ma possiamo visualizzare la rappresentazione poli-zeri con il comando:

```matlab
zpk(sys)	% visualizziamo la FDT mettendo in evidenza i poli e gli zeri (come l'immagine iniziale)
```

Possiamo visualizzare il luogo delle radici con:

```matlab
rlocus(sys)		% disegna il luogo
rlocfind(sys)	% disegna il luogo e ci fornisce un cursore per visualizzare le info in un punto
```

E' interessante anche creare la funzione di anello tramite un controllore e creare quindi la funzione di trasferimento a ciclo chiuso, lo facciamo nel seguente modo:

```matlab
k = 116;	% guadagno scelto dal disegno del luogo delle radici (guadagno critico che destabilizza il sys)
ctr = k		% il nostro controllore è proporzionale

loop = ctr * sys;	% la funzione di anello è data dalla serie controllore - impianto

syscl = feedback(loop, 1)	% la funzione di trasferimento a ciclo chiuso viene calcolata prendendo come argomenti la funzione di anello ed il guadagno di anello, che nel nostro caso è unitario.
```

Da questo punto in poi possiamo effettuare delle analisi sulla FDT a ciclo chiuso come stabilità e risposte.



# Argomenti Lezioni

## 9. Motore in CC e Riduzione d'ordine

> Lezione 9 del 27/03/2024

- [ ] Motore in corrente continua
  - [ ] schema a blocchi
