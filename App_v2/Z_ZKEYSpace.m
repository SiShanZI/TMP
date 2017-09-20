function [KEY]=Z_ZKEYSpace(BinEx,Block)
KEY=[];
KEYbin=reshape(BinEx,8,Block);
for i=1:Block
    Mid=reshape(KEYbin(:,i),1,8);
    Mid=num2str(Mid);
    Mid=bin2dec(Mid);
    KEY=[KEY,Mid];
end