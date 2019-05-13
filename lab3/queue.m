classdef queue < handle
   
    properties
        tasks
    end
    
    methods
        function obj = queue()
           obj.tasks = [];
        end
        
        function add(obj,task)
           obj.tasks = [obj.tasks task];
        end
               
        function [flag,task] = getNext(obj,time)
            len = length(obj.tasks);
            if len < 1
                %disp('Empty')
                flag = -1;
                task = 0;
            else
                ind = 1;
                minId = obj.tasks(ind).id;
                
                for i=1:1:len
                    nextId = obj.tasks(i).id; % Поиск идёт по приоритету "у кого индекс меньше - тот и выйграл". Это модель FIFO.
                    if  nextId < minId
                        minId = nextId;
                        ind = i;
                    end
                end
                
                task = obj.tasks(ind);
                if task.start > time && time ~= -1
                    flag = 0; % Заявку хоть и нашли, но она утратила свою актуальность.
                else
                    obj.tasks(ind) = [];
                    flag = 1;
                end
            end
        end
        
        function len = size(obj)
            len = length(obj.tasks);
        end
    end
end

