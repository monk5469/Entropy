% This function is mainly to extract the CDistE connection matrix of 
% the upper triangle data, and save.

clear all
cloae all

%% 
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
       load([ 'CDistE_data\SCZ_CDistE_', num2str(nSub), '.mat']);
       tmp = UpMat (RHO);
       for num = 1: length(tmp)
           X { k,  num } = tmp {num};
       end
       Y  {k, 1}  = 'SCZ';
       k=k+1;
    elseif strcmp(Group(g),'NC')
       load([ 'CDistE_data\NC_CDistE_', num2str(nSub), '.mat']);
       tmp = UpMat (RHO);
       for num = 1: length(tmp)
           X { k,  num } = tmp {num};
       end
       Y  {k, 1}  = 'NC';
       k=k+1;
    end
        
  end
  
end

save('SCZ_NC_CDistE_Brain.mat','X','Y');
close(f);



