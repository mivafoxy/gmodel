classdef device < handle
    properties
        Tn
        Tk
        timeStart
        timeEnd
    end
    methods       
        function obj = device(Tn,Tk)
            obj.Tn = Tn;
            obj.Tk = Tk;
            obj.timeStart = 0;
            obj.timeEnd = 0;
        end
        function time = run(obj,task,currentTime)
            r = rand;
            p = r*(obj.Tk - obj.Tn) + obj.Tn;
            time = p - mod(p,1);
            %fprintf('Run task %d\n',task.id);
            
            obj.timeStart = currentTime;
            obj.timeEnd = currentTime + time;
        end
        
        function isEmpty = isEmpty(obj,time)
            if time > obj.timeEnd
                obj.timeStart = 0;
                obj.timeEnd = 0;
                isEmpty = 1;
            else
                isEmpty = 0;
            end
        end
        
    end
end

