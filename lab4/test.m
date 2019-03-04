t = 0:pi/50:10*pi;
st = sin(t);
ct = cos(t);

figure
plot3(st,ct,t)

grid on;
hold on;

ph = plot3(t(1),st(1),ct(1),'or');

for i=1:numel(t)
    set(ph,'Zdata',t(i),'XData',st(i),'YData',ct(i));
    pause(0.04);
end
