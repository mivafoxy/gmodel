N = 10000;
X0 = 7;
a = 52;
c = 65;
m = 71;

%1. разработать ГПСЧ
nums = randN(N,X0,a,c,m);

%2. проверить
myhist(nums,0,m-1);

%3. длина периода
findT(nums);

%4. младшие разряды

nums2 = [];
for i=1:1:length(nums)
    if nums(i) < m/2
        nums2 = [nums2 nums(i)];
    end
end

myhist(nums2,0,(m-1)/2);
findT(nums2);