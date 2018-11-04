%第二种策略，牺牲部分容量以换取更小的失真
function [DispOp,LossOp]=Optimize_En(image,Np,Sel)
DispOp=image;
[Refer,Lim,Lc,Lr,Block]=Version_Pick_OpEn(image);
[EnSeq,KEY]=Z_Str_Agree(Lim,Sel);
[DecEn,BinEn]=Sue_ArithEnco(EnSeq,Np);
Rep=[];Fill=[0 1 0 0 1 0 1 1];                    %填充                               
for i=1:Block*Lr                      
    Rep=[Rep,Fill];
end
Rep(1:length(BinEn))=BinEn;
Rep=reshape(Rep,8*Lr,Block);                
Repp=[];
for i=1:Block                                     %程序、函数需要
    Repp=[Repp,zeros(1,8),Rep(:,i)'];
end
Rep=Repp;
Rep=reshape(Rep,8,numel(Rep)/8);                  %程序、函数需要
for i=1:Block
    SMf=i;
    Loss=1;
    for KEY=0:255                                 %密钥空间0~255
        Rep(:,(i-1)*(Lr+1)+1)=(dec2bin(KEY,8)-48)';
        rand('state',KEY);MR=randperm(Lc);
        MR=MR(1:Lr);MRM=[Lc+1,MR];
        eval(Refer);Disp;
        Diff=bitxor(image,Disp);
        DisR=length(find(Diff==1))/numel(image);  %失真率计算
        if(DisR<=Loss)                            %选择最小失真
            Loss=DisR;
            DispOpp=Disp;
        end
    end
    DispOp=DispOpp;
    LossOp=Loss;
end

