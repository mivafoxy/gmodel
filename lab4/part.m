classdef part < handle
    
    properties(Constant)
        listPart = list()
    end
    properties
        velocity
        r
        ph
        type
    end
    
    methods
        function obj = part(r,type)
            obj.r = r;
            obj.type = type;
            if type == 'n'
                a = rand(1,3)*2 - 1;
                obj.velocity = a/norm(a);
                obj.ph = plot3(r(1),r(2),r(3),'ob','LineWidth',2,'MarkerSize',3,'MarkerFaceColor','b');
            else
                obj.velocity = 0;
                obj.ph = plot3(r(1),r(2),r(3),'or','LineWidth',2,'MarkerSize',5,'MarkerFaceColor','r');
            end
            part.listPart.add(obj);
        end
        
        function nextStep(obj)
            temp = obj.r + obj.velocity;
            obj.r = temp;
            set(obj.ph,'Xdata',obj.r(1),'YData',obj.r(2),'ZData',obj.r(3));
        end
        
        function probe = probe(~,lambda)
            probe = round((1-exp(log(rand)/lambda))*2 + 1);
        end
        
        function del(obj)
            set(obj.ph,'Xdata',[],'YData',[],'ZData',[]);
        end
    end
end

