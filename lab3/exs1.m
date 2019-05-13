
N = 1000;
Nd = 5;
Tn = 10;
Tk = 1000;
lambda = 10;
allQ = createTasks(N, lambda);
q = queue;

d = createDevices(Nd,Tn,Tk);

maxQ = 0;
workTime = 0;
prostoi = 0;
waiting = 0;

time = 1;

while 1
    waiting = waiting + q.size();
    if q.size() > 0
        [flag,task] = q.getNext(-1);
        [flag2,task2] = allQ.getNext(time);
        if flag2 > 0
            q.add(task2);
            if maxQ < q.size()
                maxQ = q.size();
            end
        end
    else
        [flag,task] = allQ.getNext(time);
    end
    
    if flag == -1
        break
    end
    if flag == 1
        flag = 1;
        for j=1:1:Nd
            if d(j).isEmpty(time)
                w = d(j).run(task,time);
                flag = 0;
                workTime = workTime + w;
                break
            end
        end

        if flag
            q.add(task);
            if maxQ < q.size()
                maxQ = q.size();
            end
        end
    else
        for j=1:1:Nd
            if  d(j).isEmpty(time)
                prostoi = prostoi + 1;
            end
        end
    end
    
    time = time + 1;
end

for i=1:1:Nd
    if d(i).timeEnd > time
        time = d(i).timeEnd;
    end
end

% средн€€ длина очереди
fprintf('Cредн€€ длина очереди %f \n',waiting / time);

% средн€€ длина очереди
fprintf('ћаксимальна€ длина очереди %f \n',maxQ);

% простой
fprintf("ѕростой %f \n",prostoi / N);

% среднее врем€ ожидани€
fprintf('Cреднее врем€ ожидани€ %f \n',waiting / N);

% среднее врем€ нахождени€ за€вки в системе
fprintf('Cреднее врем€ нахождени€ за€вки в системе %f \n',(waiting+workTime) / N);

