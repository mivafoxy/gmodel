function plotAll(param_l, labelName)

param_names = ["������� ����� �������","������������ ����� �������","�������","������� ����� ��������","������� ����� ���������� ������ � �������"];
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