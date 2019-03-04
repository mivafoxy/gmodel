function myhist(nums,a,b)
[histN,histX] = hist(nums);
figure
histN = histN ./ sum(histN)./(histX(2)-histX(1));
bar(histX,histN,1);
%hist(nums);
grid on;
hold on;

m = 1/(b-a);

x = (a-1):0.1:(b+1);
for i=1:1:length(x)
    if x(i) < a || x(i) > b
        y(i) = 0;
    else
        y(i) = m;
    end
end

plot(x,y,'r','LineWidth',3);
end

