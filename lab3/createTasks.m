function [q] = createTasks(n,lambda)

tn = 1;
tk = 10;
q = queue();
for i=1:1:n
    t = tn + (tk-tn)*(-log(rand)/lambda);
    ts = task(i,t);
    q.add(ts);
end
end

