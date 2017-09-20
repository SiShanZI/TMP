function [Refer,Lim,Lc,Lr,Block]=Version_Pick_En(image)       
switch sqrt(numel(image))                               %有待扩充
    case 21
        Refer='Disp=Version_01_En(image,Rep,MRM,SMf);';
        Lim=10;Lc=26;Lr=08;Block=1;                     %有待修正
    case 25
        Refer='Disp=Version_02_En(image,Rep,MRM,SMf);';
        Lim=14;Lc=44;Lr=14;Block=1;                     %有待修正
    case 29
        Refer='Disp=Version_03_En(image,Rep,MRM,SMf);';
        Lim=22;Lc=35;Lr=11;Block=2;                     %有待修正
    case 33
        Refer='Disp=Version_04_En(image,Rep,MRM,SMf);';
        Lim=32;Lc=25;Lr=08;Block=4;                     %有待修正
    otherwise
        Refer='Disp=Version_05_En(image,Rep,MRM,SMf);';
        Lim=44;Lc=33;Lr=11;Block=4;                     %有待修正
end

    