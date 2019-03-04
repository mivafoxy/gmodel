clear all;
figure;
grid on;
hold on;
a = -20;
b = 20;
xlim([a,b]);
ylim([a,b]);
zlim([a,b]);

for i=1:1:200
    part([(rand-1/2)*20,(rand-1/2)*20,0],'m');
end

for i = 1:1:100
    a = rand(1,3);
    a = a/norm(a)*10;
    a(3) = 0;
    %%part(a,'n');
end
%%part([-10,-10,10],'n')
%%part([10,10,10],'n')
%%part([10,-10,10],'n')
p = part([10,10,0],'n');
p.velocity = [-1,-1,0];

%%for i=1:1:2
%%part([(rand-10),(rand-10),(rand-10)],'n')
%%end
lambda = 10e-5;
for i=1:1:100
    part.listPart.nextStep();
    part.listPart.check(lambda);
    %pause(0.5); 
end