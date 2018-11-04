clc; clear all;
%
Paths_1 = dir(pwd);
for i = 3:length(Paths_1); if Paths_1(i).isdir == 1; cd(Paths_1(i).name);
Paths_2 = dir(pwd);
for j = 3:length(Paths_2); if Paths_2(j).isdir == 1; cd(Paths_2(j).name); display(sprintf(Paths_2(j).name));
%



%
cd ..;end;end
cd ..;end;end
%