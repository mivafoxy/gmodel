classdef list < handle
    
    properties
        parts
        mol
    end
    
    methods
        function obj = list()
            obj.parts = [];
            obj.mol = [];
        end
        
        function add(obj,part)
            if part.type == 'n'
                obj.parts = [obj.parts part];
            else
                obj.mol = [obj.mol part];
            end
        end
        
        function check(obj,lambda)
            for i = 1:numel(obj.parts)
                a = obj.parts(i);
                for j = 1:numel(obj.mol)
                    b = obj.mol(j);
                    if sqrt(sum((a.r-b.r).*(a.r-b.r))) < 2
                        
                        nextStep = a.probe(lambda);
                        switch nextStep
                            case 1
                                a.velocity = a.velocity;
                                obj.parts(i).del()
                                obj.parts(i) = [];
                                i = i - 1;
                                break;
                            case 2
                                obj.parts(i).del()
                                obj.parts(i) = [];
                                i = i - 1;
                                break;
                            case 3
                                obj.mol(j).del;
                                obj.parts(i).del()
                                obj.mol(j) = [];
                                obj.parts(i) = [];
                                i = i - 1;
                                j = j - 1;
                                obj.add(part(a.r,'n'));
                                obj.add(part(a.r,'n'));
                                break;
                        end
                    end
                end
            end
        end
        
        function nextStep(obj)
            for i=1:numel(obj.parts)
                obj.parts(i).nextStep();
            end
            for i=1:numel(obj.mol)
                obj.mol(i).nextStep();
            end
        end
    end
end

