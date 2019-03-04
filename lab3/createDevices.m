function [devices] = createDevices(Nd,Tn,Tk)
devices = [];

for i=1:1:Nd
    devices = [devices device(Tn,Tk)];
end

end

