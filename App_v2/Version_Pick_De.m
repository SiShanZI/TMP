function [Refer,Lc,Lr,Block]=Version_Pick_De(image)     
switch sqrt(numel(image))                               %ÓÐ´ýÀ©³ä
    case 21
        Refer='BinEx=Version_01_De(image,MRM);';
        Lc=26;Lr=08;Block=1;
    case 25
        Refer='BinEx=Version_02_De(image,MRM);';
        Lc=44;Lr=14;Block=1;
    case 29
        Refer='BinEx=Version_03_De(image,MRM);';
        Lc=35;Lr=11;Block=2;
    case 33
        Refer='BinEx=Version_04_De(image,MRM);';
        Lc=25;Lr=08;Block=4;
    otherwise
        Refer='BinEx=Version_05_De(image,MRM);';
        Lc=33;Lr=11;Block=4;
end
