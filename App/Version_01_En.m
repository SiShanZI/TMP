function [DispImage]=Version_01_En(Cover,Rep,MRM,SMf)
Si=size(MRM);                           %SMf,Single、Multiple flag
Sil=Si(1);Sir=Si(2);                    %在Single模式下，仍然要保证Rep的长度为Multiple模式下的长度，也是无奈之举
if(SMf==0)                              
    SMf=[1:Sil];
else
    SMf=[SMf];
end
for j=1:Sil
    switch(SMf(j))
        case 01
            Simple='Cover(L1:L2,R1:R2)=reshape(Rep(:,i),4,2);';
            for i=1:numel(MRM)
                switch MRM(i)
                    case 01
                        L1=18;L2=21;R1=20;R2=21;
                        eval(Simple);               %Matlab这般事无巨细是如何做到的？
                    case 02
                        L1=14;L2=17;R1=20;R2=21;
                        eval(Simple);
                    case 03
                        L1=10;L2=13;R1=20;R2=21;
                        eval(Simple);
                    case 04
                        L1=10;L2=13;R1=18;R2=19;
                        eval(Simple);
                    case 05
                        L1=14;L2=17;R1=18;R2=19;
                        eval(Simple);
                    case 06
                        L1=18;L2=21;R1=18;R2=19;
                        eval(Simple);
                    case 07
                        L1=18;L2=21;R1=16;R2=17;
                        eval(Simple);
                    case 08
                        L1=14;L2=17;R1=16;R2=17;
                        eval(Simple);
                    case 09
                        L1=10;L2=13;R1=16;R2=17;
                        eval(Simple);
                    case 10
                        L1=10;L2=13;R1=14;R2=15;
                        eval(Simple);
                    case 11
                        L1=14;L2=17;R1=14;R2=15;
                        eval(Simple);
                    case 12
                        L1=18;L2=21;R1=14;R2=15;
                        eval(Simple);
                    case 13
                        L1=18;L2=21;R1=12;R2=13;
                        eval(Simple);
                    case 14
                        L1=14;L2=17;R1=12;R2=13;
                        eval(Simple);
                    case 15
                        L1=10;L2=13;R1=12;R2=13;
                        eval(Simple);
                    case 16
                        L1=05;L2=06;L3=08;L4=09;R1=12;R2=13;
                        Res=reshape(Rep(:,i),4,2);
                        Cover(L1:L2,R1:R2)=Res(1:2,:);
                        Cover(L3:L4,R1:R2)=Res(3:4,:);
                    case 17
                        L1=01;L2=04;R1=12;R2=13;
                        eval(Simple);
                    case 18
                        L1=01;L2=04;R1=10;R2=11;
                        eval(Simple);
                    case 19
                        L1=05;L2=06;L3=08;L4=09;R1=10;R2=11;
                        Res=reshape(Rep(:,i),4,2);
                        Cover(L1:L2,R1:R2)=Res(1:2,:);
                        Cover(L3:L4,R1:R2)=Res(3:4,:);
                    case 20
                        L1=10;L2=13;R1=10;R2=11;
                        eval(Simple);
                    case 21
                        L1=14;L2=17;R1=10;R2=11;
                        eval(Simple);
                    case 22
                        L1=18;L2=21;R1=10;R2=11;
                        eval(Simple);
                    case 23
                        L1=10;L2=13;R1=08;R2=09;
                        eval(Simple);
                    case 24
                        L1=10;L2=13;R1=05;R2=06;
                        eval(Simple);
                    case 25
                        L1=10;L2=13;R1=03;R2=04;
                        eval(Simple);
                    otherwise
                        L1=10;L2=13;R1=01;R2=02;
                        eval(Simple);
                end
            end
        otherwise
    end
end
DispImage=Cover;



