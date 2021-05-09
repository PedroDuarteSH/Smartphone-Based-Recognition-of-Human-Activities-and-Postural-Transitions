clc;
clear;

dados = lerDados();
labels = lerLabel([dados{:,3}]);
activity_labels = lerActivityLabel()
if(~isa(dados,'cell'))
    return
end
%%
[indx,tf] = listdlg('ListString', strsplit(num2str([dados{:,3}])), 'SelectionMode','single', 'Name','Escolha uma experiencia para visualizar');
%plot(dados{indx,1} (:,1), 'k');
user_plot(dados, labels, activity_labels, indx)
%%
f = 50;
w0 = 2*pi * f;
p = 1/f;

N = length(dados{indx,1});
Ts=4*10^-3;
n=(0:N-1)';
%t=n*Ts;
t = n*p;
%T0=N*Ts;
T0 = N*p;
v = 128;
%%
for j = 1:3
    [Cm,tetam] = SerieFourier(t, dados{indx,1} (:,j),T0,v);
    subplot(3,1,j);
    hold on
    plot(Cm, '.');
end
%%
Y = fft(dados{indx,1});
plot(Y, '.');
%%
X = fftshift(fft(dados{indx,1}));
%%
%acabar
X(abs(X)<0.001)=0; % anular valores residuais
abs_X=abs(X);
ang_X=angle(X);

figure(2);
subplot(211)
plot(w,abs_X,'o');
title('DFT - Transformada de Fourier Discreta');
ylabel('Magnitude, |X|')
xlabel('w [rad/s]')
subplot(212)
plot(w,unwrap(ang_X),'o');
ylabel('Fase, <X [rad]');
xlabel('w [rad/s]');