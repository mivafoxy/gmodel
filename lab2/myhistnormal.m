function myhistnormal(nums)
[histN,histX] = hist(nums);
histN = histN ./ sum(histN)./(histX(2)-histX(1));
figure
bar(histX,histN,1);
grid on;
hold on;

m = 0;
d = 1;
x = -4*sqrt(d):0.01:4*sqrt(d);
y = exp(-(x-m).^2/(2*d))/(sqrt(d*2*pi));

plot(x,y,'r','LineWidth',3);

end

