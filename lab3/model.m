function [wl,mq,p,wt,tis] = model(N,Nd,Tn,Tk,lambda, hasToDisplay)

allQ = createTasks(N,lambda); % ����� ���������� ������ �� ����������.
q = queue; % ������������� �� ���� ������ �������. ����� ��� ������� ������������� ���������� ������ � �������.

d = createDevices(Nd,Tn,Tk); % �������������� ����������.

maxQ = 0; % ������������ ���������� ������ � �������.
workTime = 0; % �����, ������������� �� ���������� ���� ������ �� �������.
prostoi = 0; % ������� ���������� (����� ��� ������ �� ���������)
waiting = 0; % ����� �������� ������ � ������� (???)

time = 1; % � ����� ���� - ��� ������ ������ �� ���������� ������.

while 1 % ������� ���� ����������, � ������� ���������� ���������� ������ � ������� � �� ����������.
    waiting = waiting + q.size();
    if q.size() > 0 % ����� � ������� ���� ������, ��� ������ ����������� �� ��. ������, ���� ����� ������������� ������ �������, ��� ������ �������������.
        [flag,task] = q.getNext(-1);
        [flag2,task2] = allQ.getNext(time);
        if flag2 > 0 % ����� ������� ����� ��������� ������ �� ������ ������ - ��� ���������������� � ������� ���������, � ��� ������ �������.
            q.add(task2);
            if maxQ < q.size() % ��������� ������������� ���������� ������ �� ������ ���������.
                maxQ = q.size();
            end
        end
    else % ��������� ������, ������� ������ �� ������ ������, ���� ����������� ������� � ����� ��� �� ���� �� �����������.
        [flag,task] = allQ.getNext(time);
    end
    
    if flag == -1 % ����� �����.
        break
    end
    if flag == 1 % ���������� ������ �� ������� �� ���������� �� ����������.
        flag = 1;
        for j=1:1:Nd % �� ������ ����������, ������������ ��������� ������, ���� ��� ���������� �� ������ �������� ����� ������ �� ���������.
            if d(j).isEmpty(time)
                w = d(j).run(task,time);
                flag = 0;
                workTime = workTime + w; % ���������� ���������� �������, �������������� �� ����� ������ �������.
                break % ���� ������ ������� � ����� �� ����������, ��� �� ������ - ������ ������ �� �������.
            end
        end

        if flag % � ������, ����� ��� ���������� ������, ������ ������� � ��������� �������.
            q.add(task);
            if maxQ < q.size()
                maxQ = q.size();
            end
        end
    else % ����� ����� ��������, ��� ��� ������ �� ����������, ��� ��������� ���������� � �������. ���������� ��� ��������.
        for j=1:1:Nd
            if  d(j).isEmpty(time)
                prostoi = prostoi + 1;
            end
        end
    end
    
    time = time + 1; % ������� � ��������� ������.
end

for i=1:1:Nd % ������� ��������, ���� ����� �� ��������� ����� ����������, �� ��������� ����� ���������� ������ �����������. ���� ����� ���, ��� ���� �����-�� ����������, � �������� ��� ����� ���������� ������ ��������� - �� � ����� ����� ����� ��� �����.
    if d(i).timeEnd > time
        time = d(i).timeEnd;
    end
end

wl = waiting / time;
mq = maxQ;
p = prostoi / time;
wt = waiting / N;
tis = (waiting+workTime) / N;

    if hasToDisplay == 1
        % ������� ����� �������
        fprintf('C������ ����� ������� %f \n',wl);    
        % ������������ ����� �������
        fprintf('������������ ����� ������� %f \n',maxQ);    
        % �������
        fprintf("������� %f \n",p);
        % ������� ����� ��������
        fprintf('C������ ����� �������� %f \n',wt);    
        % ������� ����� ���������� ������ � �������
        fprintf('C������ ����� ���������� ������ � ������� %f \n',tis);
    end
    
end

