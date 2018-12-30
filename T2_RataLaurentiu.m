%Semnal dreptunghiular simetric monoalternant cu D=15s 


T=40;

f=1/T;

w=2*pi*f;

t = 0:0.01:2*T; 

N=50;

C = zeros([1,2*N+1]);

%am initializat vectorul de coeficienti cu valori nule


for k = -N:N

C(k+N+1) = 1/T * integral(@(t)(square(w*t,0.5)+abs(square(w*t,0.5)))/2.*exp(-j*k*w*t),0,T);

%pana la "." este x
% @(t) reprezinta faptul ca integrala este dupa t de la 0 -> T
%calculul coeficientilor 


end

yr = 0;

for k = -N:N

yr = yr + C(k+N+1)*exp(j*k*w*t);

% semnalul initial 

end

x=(square(w*t,0.5)+abs(square(w*t,0.5)))/2


figure(1);

plot(t,real(yr),t,imag(yr)); %reprezentarea semnalului reconstruit

hold on

plot(t,x,'r'); %reprezentarea semnalului initial

axis([-1 80 -0.2 1.2])

title("Suprapunerea semnalelor")

hold off


figure(2);

stem((-N:N)*w,2*abs(C));

hold on

plot((-N:N)*w,2*abs(C)); %infasuratoarea realizate din segmente de dreapta

axis([-9 9 -0.05 0.55])

title('Spectrul de Amplitudini');

hold off