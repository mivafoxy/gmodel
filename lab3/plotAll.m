function plotAll(param_l, labelName)

param_names = ["Средняя длина очереди","Максимальная длина очереди","Простой","Среднее время ожидания","Среднее время нахождения заявки в системе"];
param_label = ["wt","mq","p","wt","tis"];    
    for i=1:1:5  
        figure;
        
        grid on;
        hold on;
        title(param_names(i));
        xlabel(labelName);
        ylabel(param_label(i));
    
        plot(param_l(:,1),param_l(:,i+1))
    end
end