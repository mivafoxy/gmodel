classdef calculationService
    methods
        % Увеличение потока.
        function [wl,mq,p,wt,tis, param_l] = callModelWithIncreasingFlow(obj, N,Nd,Tn)
            param_l = [];
            for lambda = 0.1:0.1:10
                [wl,mq,p,wt,tis] = model(N,Nd,Tn,Tn+10,lambda);
                param_l = [ param_l;lambda, wl,mq,p,wt,tis]; 
            end
        end
        
        % Увеличение интервалов на обработку заявки.
        function [wl,mq,p,wt,tis, param_l] = callModelWithIncreasingInterval(obj, N,Nd,Tn, lambda)
            param_l = [];
            for interval = 1:1:30
                [wl,mq,p,wt,tis] = model(N,Nd,Tn,Tn+interval,lambda);
                param_l = [ param_l;interval, wl,mq,p,wt,tis];  
            end
        end 
        
        % Увеличение количества устройств для обработки входящих заявок.
        function [wl,mq,p,wt,tis, param_l] = callModelWithIncreasingDeviceCount(obj, N,Tn, lambda)
            param_l = [];
            for Nd = 1:1:30
                [wl,mq,p,wt,tis] = model(N,Nd,Tn,Tn+10,lambda);
                param_l = [ param_l;Nd, wl,mq,p,wt,tis]; 
            end
        end
    end
end