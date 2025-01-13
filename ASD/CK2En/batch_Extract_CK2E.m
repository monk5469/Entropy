close all
clear all

Num       =  [48 50];
Group     =  {'ASD' 'NC'};
k=1;

f = waitbar(0,'Extracting features, please wait...');

for g  = 1 : length(Group)

    for nSub = 1 : Num(g)
        ntmp = ( (g-1)*Num(1)+nSub ) / sum(Num) ;
        str=['Extracting features, please wait...',num2str( round (100* ntmp) ),'%'];
        waitbar( ntmp, f, str);

        if strcmp(Group(g),'ASD')
            load([ 'CK2E_data\ASD_CK2E_', num2str(nSub), '.mat']);
            tmp = UpMat (RHO);
            for num = 1: length(tmp)
                X { k,  num } = tmp {num};
            end
            Y  {k, 1}  = 'ASD';
            k=k+1;
        elseif strcmp(Group(g),'NC')
            load([ 'CK2E_data\NC_CK2E_', num2str(nSub), '.mat']);
            tmp = UpMat (RHO);
            for num = 1: length(tmp)
                X { k,  num } = tmp {num};
            end
            Y  {k, 1}  = 'NC';
            k=k+1;
        end

    end

end

save('ASD_NC_CK2E.mat','X','Y');
close(f);