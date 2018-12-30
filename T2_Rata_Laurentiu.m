%in cazul prezent al unui semanal triunghiular simetric monoalternant

%de durata D=15 secunde

T=40;

f=1/T;

w=2*pi*f;

t = 0:0.001:2*T;

%am ales rezolutia temporala de 0.001

N=50;

C = zeros(1,2*N+1);

%am initializat vectorul de coeficienti cu valori nule

x=(square(w*t,0.5)+abs(square(w*t,0.5)))/2


for n = -N:N

    C(n+N+1) = 1/T * integral(@(t)(1/2*square(w*t,0.5)+1/2*abs(square(w*t,0.5))).*exp(-1j*n*w*t),0,T) ;

    %calculul coeficientiilor cu formula analitica

  

end

yr = 0;

for n = -N:N

    yr = yr + C(n+N+1)*exp(1j*n*w*t) ;

end

%am recostruit semnalul initial cu 100 de componente

figure(1);

hold on

plot(t,real(yr),':r',t,imag(yr),':r')%reprezentarea semnalului reconstruit

plot(t,x);%reprezentarea semnalului initial

axis([-1 80 -0.1 1.1])%delimitarea axelor de coordonate

xlabel("Timpul[s]");

ylabel("x(t)(linie solida) si xr(t)-reconstruirea (linie intrerupta)");

title("Suprapunerea semnalelor x(t) si xr(t)")

hold off

%prin hold on/off pot reprezenta mai multe grafice in acelasi sistem

figure(2);

hold on

stem((-N:N)*w,2*abs(C));

%functia stem este utilizata pentru reprezentarea functiilor sau a

%seturi de date cu valori discrete

plot((-N:N)*w,2*abs(C),'-ro');%infasuratoarea realizate din segmente de dreapta

xlabel('Pulsatia w [rad/s]');

ylabel('Amplitudinile Ak');

axis([-9 9 -0.05 0.55])% delimitarea axelor de coordonate

title('Spectrul de Amplitudini');

hold off

% Cu ajutorul seriei Fourier putem arata ca orice semnal poate fi scris ca fiind 

% o suma finita de semnale elementare, ceea ce face mai usoara reprezentarea grafica a acestuia 

% In cazul Spectrului de amplitudini am obtinut un grafic cu valori discrete. 

% Putem observa ca acesta este un grafic simetric fata de fundamentala, A(-k) fiind egal cu A(k).