t0 = 0;
r = 0.05;
k = 40;
N0 = 5;

N = 200;
b = r/k;
t = t0:1:(N + t0);

% 1. Темп прироста не зависит от численности
subplot(1,3,1);
grid on;
hold on;
title('Не зависит от численности');
ylabel('Nt');
xlabel('t');
plot(t,f1(r,t,t0,N0))

% 2. Уменьшается линейно с увеличение численности
subplot(1,3,2);
grid on;
hold on;
title('Уменьшается линейно с увеличением численности');
ylabel('Nt');
xlabel('t');
plot(t,f2(r,b,t,t0,N0))

% 3. Наличие некоторого ресурса
subplot(1,3,3);
grid on;
hold on;
title('При наличии ресурса');
ylabel('Nt');
xlabel('t');
plot(t,f3(r,b,t,t0,N0))

