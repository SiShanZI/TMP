function [DispImage]=Version_02_En(Cover,Rep,MRM,SMf)                           
Si=size(MRM);
Sil=Si(1);Sir=Si(2);
if(SMf==0)                              
    SMf=[1:Sil];
else
    SMf=[SMf];
end
for j=1:Sil
    switch(SMf(j))
        case 01
            Simple1='Cover(L1:L2,R1:R2)=reshape(Rep(:,i),4,2);';
            Simple2='pl=reshape(Rep(:,i),4,2);Cover(L1:L2,R1)=pl(:,1);Cover(L3:L4,R2)=pl(:,2);';
            for i=1:numel(MRM)
                switch MRM(i)
                    case 01
                        L1=22;L2=25;R1=24;R2=25;
                        eval(Simple1);              
                    case 02
                        L1=18;L2=21;R1=24;R2=25;
                        eval(Simple1);
                    case 03
                        L1=14;L2=17;R1=24;R2=25;
                        eval(Simple1);
                    case 04
                        L1=10;L2=13;R1=24;R2=25;
                        eval(Simple1);
                    case 05
                        L1=10;L2=13;R1=22;R2=23;
                        eval(Simple1);
                    case 06
                        L1=14;L2=17;R1=22;R2=23;
                        eval(Simple1);
                    case 07
                        L1=18;L2=21;R1=22;R2=23;
                        eval(Simple1);
                    case 08
                        L1=22;L2=25;R1=22;R2=23;
                        eval(Simple1);
                    case 09
                        L1=22;L2=25;R1=20;R2=21;
                        eval(Simple1);
                    case 10
                        L1=13;L2=16;R1=20;R2=21;
                        eval(Simple1);
                    case 11
                        pl=Rep(:,i);
                        Cover(10,18)=pl(1,1);Cover(10,19)=pl(2,1);Cover(10,20)=pl(3,1);Cover(10,21)=pl(4,1);
                        Cover(11,20)=pl(5,1);Cover(11,21)=pl(6,1);Cover(12,20)=pl(7,1);Cover(12,21)=pl(8,1);
                    case 12
                        L1=11;L2=14;R1=18;R2=19;
                        eval(Simple1);
                    case 13
                        pl=Rep(:,i);
                        Cover(15,18)=pl(1,1);Cover(15,19)=pl(2,1);Cover(16,18)=pl(3,1);Cover(16,19)=pl(4,1);
                        Cover(22,18)=pl(5,1);Cover(22,19)=pl(6,1);Cover(23,18)=pl(7,1);Cover(23,19)=pl(8,1);
                    case 14
                        L1=24;L2=25;R1=16;R2=19;
                        Cover(L1:L2,R1:R2)=reshape(Rep(:,i),2,4);
                    case 15
                        pl=Rep(:,i);
                        Cover(18,16)=pl(1,1);Cover(19,16)=pl(2,1);Cover(20,16)=pl(3,1);Cover(21,16)=pl(4,1);
                        Cover(22,16)=pl(5,1);Cover(22,17)=pl(6,1);Cover(23,16)=pl(7,1);Cover(23,17)=pl(8,1);
                    case 16
                        L1=14;L2=17;R1=16;
                        L3=13;L4=16;R2=17;
                        eval(Simple2);
                    case 17
                        L1=10;L2=13;R1=16;
                        L3=09;L4=12;R2=17;
                        eval(Simple2);
                    case 18
                        pl=Rep(:,i);
                        Cover(05,16)=pl(1,1);Cover(06,16)=pl(2,1);Cover(08,16)=pl(3,1);Cover(09,16)=pl(4,1);
                        Cover(04,17)=pl(5,1);Cover(05,17)=pl(6,1);Cover(06,17)=pl(7,1);Cover(08,17)=pl(8,1);
                    case 19
                        pl=Rep(:,i);
                        Cover(01,15)=pl(1,1);Cover(01,16)=pl(2,1);Cover(01,17)=pl(3,1);Cover(02,16)=pl(4,1);
                        Cover(02,17)=pl(5,1);Cover(03,16)=pl(6,1);Cover(03,17)=pl(7,1);Cover(04,16)=pl(8,1);
                    case 20
                        L1=01;L2=04;R1=14;
                        L3=02;L4=05;R2=15;
                        eval(Simple2);
                    case 21
                        pl=Rep(:,i);
                        Cover(05,14)=pl(1,1);Cover(06,14)=pl(2,1);Cover(08,14)=pl(3,1);Cover(09,14)=pl(4,1);
                        Cover(06,15)=pl(5,1);Cover(08,15)=pl(6,1);Cover(09,15)=pl(7,1);Cover(10,15)=pl(8,1);
                    case 22
                        L1=10;L2=13;R1=14;
                        L3=11;L4=14;R2=15;
                        eval(Simple2);
                    case 23
                        L1=14;L2=17;R1=14;
                        L3=15;L4=18;R2=15;
                        eval(Simple2);
                    case 24
                        L1=18;L2=21;R1=14;
                        L3=19;L4=22;R2=15;
                        eval(Simple2);
                    case 25
                        pl=Rep(:,i);
                        Cover(22,14)=pl(1,1);Cover(23,14)=pl(2,1);Cover(23,15)=pl(3,1);Cover(24,14)=pl(4,1);
                        Cover(24,15)=pl(5,1);Cover(25,13)=pl(6,1);Cover(25,14)=pl(7,1);Cover(25,15)=pl(8,1);
                    case 26
                        L1=22;L2=25;R1=12;
                        L3=21;L4=24;R2=13;
                        eval(Simple2);
                    case 27
                        L1=18;L2=21;R1=12;
                        L3=17;L4=20;R2=13;
                        eval(Simple2);
                    case 28
                        L1=14;L2=17;R1=12;
                        L3=13;L4=16;R2=13;
                        eval(Simple2);
                    case 29
                        L1=10;L2=13;R1=12;
                        L3=09;L4=12;R2=13;
                        eval(Simple2);
                    case 30
                        pl=Rep(:,i);
                        Cover(05,12)=pl(1,1);Cover(06,12)=pl(2,1);Cover(08,12)=pl(3,1);Cover(09,12)=pl(4,1);
                        Cover(04,13)=pl(5,1);Cover(05,13)=pl(6,1);Cover(06,13)=pl(7,1);Cover(08,13)=pl(8,1);
                    case 31
                        pl=Rep(:,i);
                        Cover(01,11)=pl(1,1);Cover(01,12)=pl(2,1);Cover(01,13)=pl(3,1);Cover(02,12)=pl(4,1);
                        Cover(02,13)=pl(5,1);Cover(03,12)=pl(6,1);Cover(03,13)=pl(7,1);Cover(04,12)=pl(8,1);
                    case 32
                        L1=01;L2=04;R1=10;
                        L3=02;L4=05;R2=11;
                        eval(Simple2);
                    case 33
                        pl=Rep(:,i);
                        Cover(05,10)=pl(1,1);Cover(06,10)=pl(2,1);Cover(08,10)=pl(3,1);Cover(09,10)=pl(4,1);
                        Cover(06,11)=pl(5,1);Cover(08,11)=pl(6,1);Cover(09,11)=pl(7,1);Cover(10,11)=pl(8,1);
                    case 34
                        L1=10;L2=13;R1=10;
                        L3=11;L4=14;R2=11;
                        eval(Simple2);
                    case 35
                        L1=14;L2=17;R1=10;
                        L3=15;L4=18;R2=11;
                        eval(Simple2);
                    case 36
                        L1=18;L2=21;R1=10;
                        L3=19;L4=22;R2=11;
                        eval(Simple2);
                    case 37
                        pl=Rep(:,i);
                        Cover(22,10)=pl(1,1);Cover(23,10)=pl(2,1);Cover(24,10)=pl(3,1);Cover(25,10)=pl(4,1);
                        Cover(23,11)=pl(5,1);Cover(24,11)=pl(6,1);Cover(25,11)=pl(7,1);Cover(17,09)=pl(8,1);
                    case 38
                        L1=14;L2=17;R1=08;
                        L3=13;L4=16;R2=09;
                        eval(Simple2);
                    case 39
                        pl=Rep(:,i);
                        Cover(10,08)=pl(1,1);Cover(11,08)=pl(2,1);Cover(12,08)=pl(3,1);Cover(13,08)=pl(4,1);
                        Cover(10,09)=pl(5,1);Cover(11,09)=pl(6,1);Cover(12,09)=pl(7,1);Cover(10,06)=pl(8,1);
                    case 40
                        L1=10;L2=13;R1=05;
                        L3=11;L4=14;R2=06;
                        eval(Simple2);
                    case 41
                        pl=Rep(:,i);
                        Cover(14,05)=pl(1,1);Cover(15,05)=pl(2,1);Cover(15,06)=pl(3,1);Cover(16,05)=pl(4,1);
                        Cover(16,06)=pl(5,1);Cover(17,04)=pl(6,1);Cover(17,05)=pl(7,1);Cover(17,06)=pl(8,1);
                    case 42
                        L1=14;L2=17;R1=03;
                        L3=13;L4=16;R2=04;
                        eval(Simple2);
                    case 43
                        pl=Rep(:,i);
                        Cover(10,02)=pl(1,1);Cover(10,03)=pl(2,1);Cover(10,04)=pl(3,1);Cover(11,03)=pl(4,1);
                        Cover(11,04)=pl(5,1);Cover(12,03)=pl(6,1);Cover(12,04)=pl(7,1);Cover(13,03)=pl(8,1);
                    otherwise
                        L1=10;L2=13;R1=01;
                        L3=11;L4=14;R2=02;
                        eval(Simple2);
                end
            end
        otherwise
    end
end
DispImage=Cover;          