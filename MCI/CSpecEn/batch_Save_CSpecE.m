close all
clear all

mkdir('CSpecE_data');
Num        =  [32 32];
Group     =   {'MCI' 'NC'};

f = waitbar(0,'Saving data, please wait...');

for g  = 1 : length(Group)

    for nSub = 1 : Num(g)
        ntmp = ( (g-1)*Num(1)+nSub ) / sum(Num) ;
        str=['Saving data, please wait...',num2str( round (100* ntmp) ),'%'];
        waitbar( ntmp, f, str);

        if strcmp(Group(g),'MCI')
            load(['ROI_data\MCI\MCI_', num2str(nSub), '.mat']);
            ROI_tmp=ROISignals;
            tic
            RHO = CSpecE(ROI_tmp);
            t(nSub,:)=toc;
            save([ 'CSpecE_data\MCI_CSpecE_', num2str(nSub), '.mat'],'RHO');
        elseif strcmp(Group(g),'NC')
            load(['ROI_data\NC\NC_', num2str(nSub), '.mat']);
            ROI_tmp=ROISignals;
            tic
            RHO = CSpecE(ROI_tmp);
            t(Num(1)+nSub,:)=toc;
            save([ 'CSpecE_data\NC_CSpecE_', num2str(nSub), '.mat'],'RHO');
        end

    end
end
t_mean = mean(t);
close(f);



