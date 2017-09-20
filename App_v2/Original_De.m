%第一种策略，容量可达极限
function [Message]=Original_De(image,Np)
Answ=inputdlg({'KEY:'},'A KEY is needed!',[5 50]);
KEY=str2num(char(Answ));
msgbox('稍安勿躁！','AH……','on'); 
[Refer,Lc,Lr,Block]=Version_Pick_De(image);               
rand('state',KEY);MR=randperm(Lc);
MR=MR(1:Lr);MRM=[];
for i=1:Block                           %函数参数需要
    MRM=[MRM;MR];
end
eval(Refer);
Original=Sue_ArithDeco(BinEx,Np);
Message=Z_Agree_Str(Original);