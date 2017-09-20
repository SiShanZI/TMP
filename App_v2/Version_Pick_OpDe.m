function [Refer,Lc,Lr,Block,KEY]=Version_Pick_OpDe(image)
switch sqrt(numel(image))                               %ÓÐ´ýÀ©³ä                     
    case 21
        Refer='BinEx=Version_01_De(image,MRM);';
        Lc=25;Lr=07;Block=1;
        MRM=[26];
        eval(Refer);
        KEY=Z_ZKEYSpace(BinEx,Block);
    case 25
        Refer='BinEx=Version_02_De(image,MRM);';
        Lc=43;Lr=13;Block=1;
        MRM=[44];
        eval(Refer);
        KEY=Z_ZKEYSpace(BinEx,Block);
    case 29
        Refer='BinEx=Version_03_De(image,MRM);';
        Lc=34;Lr=10;Block=2;
        MRM=[35;35];
        eval(Refer);
        KEY=Z_ZKEYSpace(BinEx,Block);
    case 33
        Refer='BinEx=Version_04_De(image,MRM);';
        Lc=24;Lr=07;Block=4;
        MRM=[25;25;25;25];
        eval(Refer);
        KEY=Z_ZKEYSpace(BinEx,Block);
    otherwise
        Refer='BinEx=Version_05_De(image,MRM);';
        Lc=32;Lr=10;Block=4;
        MRM=[33;33;33;33];
        eval(Refer);
        KEY=Z_ZKEYSpace(BinEx,Block);
end
