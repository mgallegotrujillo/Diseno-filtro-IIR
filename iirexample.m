function []=iirexample()

n=0:511;%tiempo
k=n/512;%frecuencias
xn=sin(2*pi*n*1/4)+sin(2*pi*n*1/8)+sin(2*pi*n*1/32)+sin(2*pi*n*1/128);
xn=awgn(xn, 10);
xk=abs(fft(xn));

figure
subplot(2,1,1);
stem(n,xn);
title('Señal de prueba x(n)');
subplot(2,1,2);
stem(k,xk);
title('Espectro de frecuencia');



%Filtro Butterworth
%frec corte = 1/32
[b1,a1]=butter(10,[0.0450 0.0550],'bandpass');
y1n=filter(b1,a1,xn);
y1k=abs(fft(y1n));
figure(2);
freqz(b1,a1);

figure
subplot(2,1,1)
stem(n,y1n);
title('Senal filtrada Butter');
subplot(2,1,2);
stem(k,y1k);
title('Espectro de frecuencia');
