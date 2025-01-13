% The main function of this function is to extract the fully connected data of 
% the CApEn connection matrix, because CApEn(x,y) and CApEn(y,x) are not equal

close all
close all

Num       =  [71 74];
Group     =   {'SCZ' 'NC'};
k=1;

f = waitbar(0,'Extracting features, please wait...');

for g  = 1 : length(Group)

    for nSub = 1 : Num(g)
        ntmp = ( (g-1)*Num(1)+nSub ) / sum(Num) ;
        str=['Extracting features, please wait...',num2str( round (100* ntmp) ),'%'];
        waitbar( ntmp, f, str);

        if strcmp(Group(g),'SCZ')
            load([ 'CApE_data\SCZ_CApE_', num2str(nSub), '.mat']);
            tmp = Mat (RHO);
            tmp=num2cell(tmp);
            for num = 1: length(tmp)
                X { k,  num } = tmp {num};
            end
            Y  {k, 1}  = 'SCZ';
            k=k+1;
        elseif strcmp(Group(g),'NC')
            load([ 'CApE_data\NC_CApE_', num2str(nSub), '.mat']);
            tmp = Mat (RHO);
            tmp=num2cell(tmp);
            for num = 1: length(tmp)
                X { k,  num } = tmp {num};
            end
            Y  {k, 1}  = 'NC';
            k=k+1;
        end

    end

end

save('SCZ_NC_CApE_Brain.mat','X','Y');
close(f);