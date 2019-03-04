classdef task
    properties
        id
        start
        desc
    end
    
    methods
        function obj = task(id,start)
            obj.id = id;
            obj.start = start;
            obj.desc = 'description';
        end
        
    end
end

