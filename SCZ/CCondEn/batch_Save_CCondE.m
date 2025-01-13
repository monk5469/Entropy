% This function mainly calculates the CCondEn of the subject and saves it.
% CCondEn calculates the cross-conditional entropy.

close all
clear all

mkdir('CCondE_data'); 
Num        =  [71 74];
Group     =   {'SCZ' 'NC'};

f = waitbar(0,'Saving data, please wait...');

for g  = 1 : length(Group)
   
   for nSub = 1 : Num(g)
    ntmp = ( (g-1)*Num(1)+nSub ) / sum(Num) ;
    str=['Saving data, please wait...',num2str( round (100* ntmp) ),'%'];
    waitbar( ntmp, f, str);
       
    if strcmp(Group(g),'SCZ')
       load(['ROI_data\SCZ\ROISignals_Sub_0', num2str(nSub), '.mat']);
       ROI_tmp=ROISignals;
%        tic
       RHO = CCondE(ROI_tmp);
%        t(Num(1),:)=toc;
       save([ 'CCondE_data\SCZ_CCondE_', num2str(nSub), '.mat'],'RHO');
    elseif strcmp(Group(g),'NC')
       load(['ROI_data\NC\ROISignals_Sub_0', num2str(nSub), '.mat']);
       ROI_tmp=ROISignals;
%        tic
       RHO = CCondE(ROI_tmp);
%        t(Num(1)+nSub,:)=toc;
       save([ 'CCondE_data\NC_CCondE_', num2str(nSub), '.mat'],'RHO');
    end
        
   end
end
% t_mean = mean(t);
close(f);



