%第二种策略，牺牲部分容量以换取更小的失真
function [Message]=Optimize_De(image,Np)
msgbox('稍安勿躁！','AH……','on'); 
[Refer,Lc,Lr,Block,KEY]=Version_Pick_OpDe(image); 
MRM=[];
for i=1:Block
    rand('state',KEY(i));MR=randperm(Lc);
    MR=MR(1:Lr);MRM=[MRM;MR];
end
eval(Refer);
Original=Sue_ArithDeco(BinEx,Np);
Message=Z_Agree_Str(Original);
