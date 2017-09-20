function [DispImage]=Version_05_En(Cover,Rep,MRM,SMf)
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
            for i=1:Sir
                switch MRM(j,i)
                    case 01
                        L1=34;L2=37;R1=36;R2=37;
                        eval(Simple1);              
                    case 02
                        L1=18;L2=21;R1=36;R2=37;
                        eval(Simple1);
                    case 03
                        L1=14;L2=17;R1=34;R2=35;
                        eval(Simple1);
                    case 04
                        L1=30;L2=33;R1=34;R2=35;
                        eval(Simple1);
                    case 05
                        L1=21;L2=24;R1=32;R2=33;
                        eval(Simple1);
                    case 06
                        L1=11;L2=14;R1=30;R2=31;
                        eval(Simple1);
                    case 07
                        pl=Rep(:,i);
                        Cover(27,30)=pl(1,1);Cover(27,31)=pl(2,1);Cover(28,30)=pl(3,1);Cover(28,31)=pl(4,1);
                        Cover(34,30)=pl(5,1);Cover(34,31)=pl(6,1);Cover(35,30)=pl(7,1);Cover(35,31)=pl(8,1);
                    case 08
                        L1=22;L2=25;R1=28;
                        L3=21;L4=24;R2=29;
                        eval(Simple2);
                    case 09
                        pl=Rep(:,i);
                        Cover(05,28)=pl(1,1);Cover(06,28)=pl(2,1);Cover(08,28)=pl(3,1);Cover(09,28)=pl(4,1);
                        Cover(04,29)=pl(5,1);Cover(05,29)=pl(6,1);Cover(06,29)=pl(7,1);Cover(08,29)=pl(8,1);
                    case 10
                        L1=10;L2=13;R1=26;
                        L3=11;L4=14;R2=27;
                        eval(Simple2);
                    case 11
                        L1=26;L2=29;R1=26;
                        L3=27;L4=30;R2=27;
                        eval(Simple2);
                    case 12
                        L1=22;L2=25;R1=24;
                        L3=21;L4=24;R2=25;
                        eval(Simple2);
                    case 13
                        pl=Rep(:,i);
                        Cover(05,24)=pl(1,1);Cover(06,24)=pl(2,1);Cover(08,24)=pl(3,1);Cover(09,24)=pl(4,1);
                        Cover(04,25)=pl(5,1);Cover(05,25)=pl(6,1);Cover(06,25)=pl(7,1);Cover(08,25)=pl(8,1);
                    case 14
                        L1=10;L2=13;R1=22;
                        L3=11;L4=14;R2=23;
                        eval(Simple2);
                    case 15
                        L1=26;L2=29;R1=22;
                        L3=27;L4=30;R2=23;
                        eval(Simple2);
                    case 16
                        L1=30;L2=33;R1=20;
                        L3=29;L4=32;R2=21;
                        eval(Simple2);
                    case 17
                        L1=14;L2=17;R1=20;
                        L3=13;L4=16;R2=21;
                        eval(Simple2);
                    case 18
                        L1=01;L2=04;R1=18;
                        L3=02;L4=05;R2=19;
                        eval(Simple2);
                    case 19
                        L1=18;L2=21;R1=18;
                        L3=19;L4=22;R2=19;
                        eval(Simple2);
                    case 20
                        pl=Rep(:,i);
                        Cover(34,18)=pl(1,1);Cover(35,18)=pl(2,1);Cover(35,19)=pl(3,1);Cover(36,18)=pl(4,1);
                        Cover(36,19)=pl(5,1);Cover(37,17)=pl(6,1);Cover(37,18)=pl(7,1);Cover(37,19)=pl(8,1);
                    case 21
                        L1=22;L2=25;R1=16;
                        L3=21;L4=24;R2=17;
                        eval(Simple2);
                    case 22
                        pl=Rep(:,i);
                        Cover(05,16)=pl(1,1);Cover(06,16)=pl(2,1);Cover(08,16)=pl(3,1);Cover(09,16)=pl(4,1);
                        Cover(04,17)=pl(5,1);Cover(05,17)=pl(6,1);Cover(06,17)=pl(7,1);Cover(08,17)=pl(8,1);
                    case 23
                        L1=10;L2=13;R1=14;
                        L3=11;L4=14;R2=15;
                        eval(Simple2);
                    case 24
                        L1=26;L2=29;R1=14;
                        L3=27;L4=30;R2=15;
                        eval(Simple2);
                    case 25
                        L1=30;L2=33;R1=12;
                        L3=29;L4=32;R2=13;
                        eval(Simple2);
                    case 26
                        L1=14;L2=17;R1=12;
                        L3=13;L4=16;R2=13;
                        eval(Simple2);
                    case 27
                        L1=01;L2=04;R1=10;
                        L3=02;L4=05;R2=11;
                        eval(Simple2);
                    case 28
                        L1=18;L2=21;R1=10;
                        L3=19;L4=22;R2=11;
                        eval(Simple2);
                    case 29
                        pl=Rep(:,i);
                        Cover(34,10)=pl(1,1);Cover(35,10)=pl(2,1);Cover(35,11)=pl(3,1);Cover(36,10)=pl(4,1);
                        Cover(36,11)=pl(5,1);Cover(37,09)=pl(6,1);Cover(37,10)=pl(7,1);Cover(37,11)=pl(8,1);
                    case 30
                        L1=14;L2=17;R1=08;
                        L3=13;L4=16;R2=09;
                        eval(Simple2);
                    case 31
                        L1=18;L2=21;R1=05;
                        L3=19;L4=22;R2=06;
                        eval(Simple2);
                    case 32
                        L1=22;L2=25;R1=03;
                        L3=21;L4=24;R2=04;
                        eval(Simple2);
                    otherwise
                        L1=10;L2=13;R1=01;
                        L3=11;L4=14;R2=02;
                        eval(Simple2);
                end
            end
        case 02
            Simple1='Cover(L1:L2,R1:R2)=reshape(Rep(:,i+Sir),4,2);';
            Simple2='pl=reshape(Rep(:,i+Sir),4,2);Cover(L1:L2,R1)=pl(:,1);Cover(L3:L4,R2)=pl(:,2);';
            for i=1:Sir
                switch MRM(j,i)
                    case 01
                        L1=30;L2=33;R1=36;R2=37;
                        eval(Simple1);              
                    case 02
                        L1=14;L2=17;R1=36;R2=37;
                        eval(Simple1);
                    case 03
                        L1=18;L2=21;R1=34;R2=35;
                        eval(Simple1);
                    case 04
                        L1=34;L2=37;R1=34;R2=35;
                        eval(Simple1);
                    case 05
                        L1=17;L2=20;R1=32;R2=33;
                        eval(Simple1);
                    case 06
                        L1=15;L2=18;R1=30;R2=31;
                        eval(Simple1);
                    case 07
                        L1=36;L2=37;R1=28;R2=31;
                        Cover(L1:L2,R1:R2)=reshape(Rep(:,i+Sir),2,4);
                    case 08
                        L1=18;L2=21;R1=28;
                        L3=17;L4=20;R2=29;
                        eval(Simple2);
                    case 09
                        pl=Rep(:,i+Sir);
                        Cover(01,27)=pl(1,1);Cover(01,28)=pl(2,1);Cover(01,29)=pl(3,1);Cover(02,28)=pl(4,1);
                        Cover(02,29)=pl(5,1);Cover(03,28)=pl(6,1);Cover(03,29)=pl(7,1);Cover(04,28)=pl(8,1);
                    case 10
                        L1=14;L2=17;R1=26;
                        L3=15;L4=18;R2=27;
                        eval(Simple2);
                    case 11
                        L1=30;L2=33;R1=26;
                        L3=31;L4=34;R2=27;
                        eval(Simple2);
                    case 12
                        L1=18;L2=21;R1=24;
                        L3=17;L4=20;R2=25;
                        eval(Simple2);
                    case 13
                        pl=Rep(:,i+Sir);
                        Cover(01,23)=pl(1,1);Cover(01,24)=pl(2,1);Cover(01,25)=pl(3,1);Cover(02,24)=pl(4,1);
                        Cover(02,25)=pl(5,1);Cover(03,24)=pl(6,1);Cover(03,25)=pl(7,1);Cover(04,24)=pl(8,1);
                    case 14
                        L1=14;L2=17;R1=22;
                        L3=15;L4=18;R2=23;
                        eval(Simple2);
                    case 15
                        L1=30;L2=33;R1=22;
                        L3=31;L4=34;R2=23;
                        eval(Simple2);
                    case 16
                        L1=26;L2=29;R1=20;
                        L3=25;L4=28;R2=21;
                        eval(Simple2);
                    case 17
                        L1=10;L2=13;R1=20;
                        L3=09;L4=12;R2=21;
                        eval(Simple2);
                    case 18
                        pl=Rep(:,i+Sir);
                        Cover(05,18)=pl(1,1);Cover(06,18)=pl(2,1);Cover(08,18)=pl(3,1);Cover(09,18)=pl(4,1);
                        Cover(06,19)=pl(5,1);Cover(08,19)=pl(6,1);Cover(09,19)=pl(7,1);Cover(10,19)=pl(8,1);
                    case 19
                        L1=22;L2=25;R1=18;
                        L3=23;L4=26;R2=19;
                        eval(Simple2);
                    case 20
                        L1=34;L2=37;R1=16;
                        L3=33;L4=36;R2=17;
                        eval(Simple2);
                    case 21
                        L1=18;L2=21;R1=16;
                        L3=17;L4=20;R2=17;
                        eval(Simple2);
                    case 22
                        pl=Rep(:,i+Sir);
                        Cover(01,15)=pl(1,1);Cover(01,16)=pl(2,1);Cover(01,17)=pl(3,1);Cover(02,16)=pl(4,1);
                        Cover(02,17)=pl(5,1);Cover(03,16)=pl(6,1);Cover(03,17)=pl(7,1);Cover(04,16)=pl(8,1);
                    case 23
                        L1=14;L2=17;R1=14;
                        L3=15;L4=18;R2=15;
                        eval(Simple2);
                    case 24
                        L1=30;L2=33;R1=14;
                        L3=31;L4=34;R2=15;
                        eval(Simple2);
                    case 25
                        L1=26;L2=29;R1=12;
                        L3=25;L4=28;R2=13;
                        eval(Simple2);
                    case 26
                        L1=10;L2=13;R1=12;
                        L3=09;L4=12;R2=13;
                        eval(Simple2);
                    case 27
                        pl=Rep(:,i+Sir);
                        Cover(05,10)=pl(1,1);Cover(06,10)=pl(2,1);Cover(08,10)=pl(3,1);Cover(09,10)=pl(4,1);
                        Cover(06,11)=pl(5,1);Cover(08,11)=pl(6,1);Cover(09,11)=pl(7,1);Cover(10,11)=pl(8,1);
                    case 28
                        L1=22;L2=25;R1=10;
                        L3=23;L4=26;R2=11;
                        eval(Simple2);
                    case 29
                        L1=26;L2=29;R1=08;
                        L3=25;L4=28;R2=09;
                        eval(Simple2);
                    case 30
                        pl=Rep(:,i+Sir);
                        Cover(10,06)=pl(1,1);Cover(10,08)=pl(2,1);Cover(10,09)=pl(3,1);Cover(11,08)=pl(4,1);
                        Cover(11,09)=pl(5,1);Cover(12,08)=pl(6,1);Cover(12,09)=pl(7,1);Cover(13,08)=pl(8,1);
                    case 31
                        L1=22;L2=25;R1=05;
                        L3=23;L4=26;R2=06;
                        eval(Simple2);
                    case 32
                        L1=18;L2=21;R1=03;
                        L3=17;L4=20;R2=04;
                        eval(Simple2);
                    otherwise
                        L1=14;L2=17;R1=01;
                        L3=15;L4=18;R2=02;
                        eval(Simple2);
                end
            end
        case 03
            Simple1='Cover(L1:L2,R1:R2)=reshape(Rep(:,i+2*Sir),4,2);';
            Simple2='pl=reshape(Rep(:,i+2*Sir),4,2);Cover(L1:L2,R1)=pl(:,1);Cover(L3:L4,R2)=pl(:,2);';
            for i=1:Sir
                switch MRM(j,i)
                    case 01
                        L1=26;L2=29;R1=36;R2=37;
                        eval(Simple1);              
                    case 02
                        L1=10;L2=13;R1=36;R2=37;
                        eval(Simple1);
                    case 03
                        L1=22;L2=25;R1=34;R2=35;
                        eval(Simple1);
                    case 04
                        L1=34;L2=37;R1=32;R2=33;
                        eval(Simple1);
                    case 05
                        L1=13;L2=16;R1=32;R2=33;
                        eval(Simple1);
                    case 06
                        L1=19;L2=22;R1=30;R2=31;
                        eval(Simple1);
                    case 07
                        pl=Rep(:,i+2*Sir);
                        Cover(30,28)=pl(1,1);Cover(31,28)=pl(2,1);Cover(32,28)=pl(3,1);Cover(33,28)=pl(4,1);
                        Cover(34,28)=pl(5,1);Cover(34,29)=pl(6,1);Cover(35,28)=pl(7,1);Cover(35,29)=pl(8,1);
                    case 08
                        L1=14;L2=17;R1=28;
                        L3=13;L4=16;R2=29;
                        eval(Simple2);
                    case 09
                        L1=01;L2=04;R1=26;
                        L3=02;L4=05;R2=27;
                        eval(Simple2);
                    case 10
                        L1=18;L2=21;R1=26;
                        L3=19;L4=22;R2=27;
                        eval(Simple2);
                    case 11
                        pl=Rep(:,i+2*Sir);
                        Cover(34,26)=pl(1,1);Cover(35,26)=pl(2,1);Cover(35,27)=pl(3,1);Cover(36,26)=pl(4,1);
                        Cover(36,27)=pl(5,1);Cover(37,25)=pl(6,1);Cover(37,26)=pl(7,1);Cover(37,27)=pl(8,1);
                    case 12
                        L1=30;L2=33;R1=24;
                        L3=29;L4=32;R2=25;
                        eval(Simple2);
                    case 13
                        L1=14;L2=17;R1=24;
                        L3=13;L4=16;R2=25;
                        eval(Simple2);
                    case 14
                        L1=01;L2=04;R1=22;
                        L3=02;L4=05;R2=23;
                        eval(Simple2);
                  case 15
                        L1=18;L2=21;R1=22;
                        L3=19;L4=22;R2=23;
                        eval(Simple2);
                    case 16
                        pl=Rep(:,i+2*Sir);
                        Cover(34,22)=pl(1,1);Cover(35,22)=pl(2,1);Cover(35,23)=pl(3,1);Cover(36,22)=pl(4,1);
                        Cover(36,23)=pl(5,1);Cover(37,21)=pl(6,1);Cover(37,22)=pl(7,1);Cover(37,23)=pl(8,1);
                    case 17
                        L1=22;L2=25;R1=20;
                        L3=21;L4=24;R2=21;
                        eval(Simple2);
                    case 18
                        pl=Rep(:,i+2*Sir);
                        Cover(05,20)=pl(1,1);Cover(06,20)=pl(2,1);Cover(08,20)=pl(3,1);Cover(09,20)=pl(4,1);
                        Cover(04,21)=pl(5,1);Cover(05,21)=pl(6,1);Cover(06,21)=pl(7,1);Cover(08,21)=pl(8,1);
                    case 19
                        L1=10;L2=13;R1=18;
                        L3=11;L4=14;R2=19;
                        eval(Simple2);
                    case 20
                        L1=26;L2=29;R1=18;
                        L3=27;L4=30;R2=19;
                        eval(Simple2);
                    case 21
                        L1=30;L2=33;R1=16;
                        L3=29;L4=32;R2=17;
                        eval(Simple2);
                    case 22
                        L1=14;L2=17;R1=16;
                        L3=13;L4=16;R2=17;
                        eval(Simple2);
                    case 23
                        L1=01;L2=04;R1=14;
                        L3=02;L4=05;R2=15;
                        eval(Simple2);
                    case 24
                        L1=18;L2=21;R1=14;
                        L3=19;L4=22;R2=15;
                        eval(Simple2);
                    case 25
                        pl=Rep(:,i+2*Sir);
                        Cover(34,14)=pl(1,1);Cover(35,14)=pl(2,1);Cover(35,15)=pl(3,1);Cover(36,14)=pl(4,1);
                        Cover(36,15)=pl(5,1);Cover(37,13)=pl(6,1);Cover(37,14)=pl(7,1);Cover(37,15)=pl(8,1);
                    case 26
                        L1=22;L2=25;R1=12;
                        L3=21;L4=24;R2=13;
                        eval(Simple2);
                    case 27
                        pl=Rep(:,i+2*Sir);
                        Cover(05,12)=pl(1,1);Cover(06,12)=pl(2,1);Cover(08,12)=pl(3,1);Cover(09,12)=pl(4,1);
                        Cover(04,13)=pl(5,1);Cover(05,13)=pl(6,1);Cover(06,13)=pl(7,1);Cover(08,13)=pl(8,1);
                    case 28
                        L1=10;L2=13;R1=10;
                        L3=11;L4=14;R2=11;
                        eval(Simple2);
                    case 29
                        L1=26;L2=29;R1=10;
                        L3=27;L4=30;R2=11;
                        eval(Simple2);
                    case 30
                        L1=22;L2=25;R1=08;
                        L3=21;L4=24;R2=09;
                        eval(Simple2);
                    case 31
                        L1=10;L2=13;R1=05;
                        L3=11;L4=14;R2=06;
                        eval(Simple2);
                    case 32
                        pl=Rep(:,i+2*Sir);
                        Cover(26,05)=pl(1,1);Cover(27,05)=pl(2,1);Cover(27,06)=pl(3,1);Cover(28,05)=pl(4,1);
                        Cover(28,06)=pl(5,1);Cover(29,04)=pl(6,1);Cover(29,05)=pl(7,1);Cover(29,06)=pl(8,1);
                    otherwise
                        L1=14;L2=17;R1=03;
                        L3=13;L4=16;R2=04;
                        eval(Simple2);
                end
            end
        otherwise
            Simple1='Cover(L1:L2,R1:R2)=reshape(Rep(:,i+3*Sir),4,2);';
            Simple2='pl=reshape(Rep(:,i+3*Sir),4,2);Cover(L1:L2,R1)=pl(:,1);Cover(L3:L4,R2)=pl(:,2);';
            for i=1:Sir
                switch MRM(j,i)
                    case 01
                        L1=22;L2=25;R1=36;R2=37;
                        eval(Simple1);              
                    case 02
                        L1=10;L2=13;R1=34;R2=35;
                        eval(Simple1);
                    case 03
                        L1=26;L2=29;R1=34;R2=35;
                        eval(Simple1);
                    case 04
                        L1=25;L2=28;R1=32;R2=33;
                        eval(Simple1);
                    case 05
                        pl=Rep(:,i+3*Sir);
                        Cover(10,30)=pl(1,1);Cover(10,31)=pl(2,1);Cover(10,32)=pl(3,1);Cover(10,33)=pl(4,1);
                        Cover(11,32)=pl(5,1);Cover(11,33)=pl(6,1);Cover(12,32)=pl(7,1);Cover(12,33)=pl(8,1);
                    case 06
                        L1=23;L2=26;R1=30;R2=31;
                        eval(Simple1);
                    case 07
                        L1=26;L2=29;R1=28;
                        L3=25;L4=28;R2=29;
                        eval(Simple2);
                    case 08
                        L1=10;L2=13;R1=28;
                        L3=09;L4=12;R2=29;
                        eval(Simple2);
                    case 09
                        pl=Rep(:,i+3*Sir);
                        Cover(05,26)=pl(1,1);Cover(06,26)=pl(2,1);Cover(08,26)=pl(3,1);Cover(09,26)=pl(4,1);
                        Cover(06,27)=pl(5,1);Cover(08,27)=pl(6,1);Cover(09,27)=pl(7,1);Cover(10,27)=pl(8,1);
                    case 10
                        L1=22;L2=25;R1=26;
                        L3=23;L4=26;R2=27;
                        eval(Simple2);
                    case 11
                        L1=34;L2=37;R1=24;
                        L3=33;L4=36;R2=25;
                        eval(Simple2);
                    case 12
                        L1=26;L2=29;R1=24;
                        L3=25;L4=28;R2=25;
                        eval(Simple2);
                    case 13
                        L1=10;L2=13;R1=24;
                        L3=09;L4=12;R2=25;
                        eval(Simple2);
                    case 14
                        pl=Rep(:,i+3*Sir);
                        Cover(05,22)=pl(1,1);Cover(06,22)=pl(2,1);Cover(08,22)=pl(3,1);Cover(09,22)=pl(4,1);
                        Cover(06,23)=pl(5,1);Cover(08,23)=pl(6,1);Cover(09,23)=pl(7,1);Cover(10,23)=pl(8,1);
                    case 15
                        L1=22;L2=25;R1=22;
                        L3=23;L4=26;R2=23;
                        eval(Simple2);
                    case 16
                        L1=34;L2=37;R1=20;
                        L3=33;L4=36;R2=21;
                        eval(Simple2);
                    case 17
                        L1=18;L2=21;R1=20;
                        L3=17;L4=20;R2=21;
                        eval(Simple2);
                    case 18
                        pl=Rep(:,i+3*Sir);
                        Cover(01,19)=pl(1,1);Cover(01,20)=pl(2,1);Cover(01,21)=pl(3,1);Cover(02,20)=pl(4,1);
                        Cover(02,21)=pl(5,1);Cover(03,20)=pl(6,1);Cover(03,21)=pl(7,1);Cover(04,20)=pl(8,1);
                    case 19
                        L1=14;L2=17;R1=18;
                        L3=15;L4=18;R2=19;
                        eval(Simple2);
                    case 20
                        L1=30;L2=33;R1=18;
                        L3=31;L4=34;R2=19;
                        eval(Simple2);
                    case 21
                        L1=26;L2=29;R1=16;
                        L3=25;L4=28;R2=17;
                        eval(Simple2);
                    case 22
                        L1=10;L2=13;R1=16;
                        L3=09;L4=12;R2=17;
                        eval(Simple2);
                    case 23
                        pl=Rep(:,i+3*Sir);
                        Cover(05,14)=pl(1,1);Cover(06,14)=pl(2,1);Cover(08,14)=pl(3,1);Cover(09,14)=pl(4,1);
                        Cover(06,15)=pl(5,1);Cover(08,15)=pl(6,1);Cover(09,15)=pl(7,1);Cover(10,15)=pl(8,1);
                    case 24
                        L1=22;L2=25;R1=14;
                        L3=23;L4=26;R2=15;
                        eval(Simple2);
                    case 25
                        L1=34;L2=37;R1=12;
                        L3=33;L4=36;R2=13;
                        eval(Simple2);
                    case 26
                        L1=18;L2=21;R1=12;
                        L3=17;L4=20;R2=13;
                        eval(Simple2);
                    case 27
                        pl=Rep(:,i+3*Sir);
                        Cover(01,11)=pl(1,1);Cover(01,12)=pl(2,1);Cover(01,13)=pl(3,1);Cover(02,12)=pl(4,1);
                        Cover(02,13)=pl(5,1);Cover(03,12)=pl(6,1);Cover(03,13)=pl(7,1);Cover(04,12)=pl(8,1);
                    case 28
                        L1=14;L2=17;R1=10;
                        L3=15;L4=18;R2=11;
                        eval(Simple2);
                    case 29
                        L1=30;L2=33;R1=10;
                        L3=31;L4=34;R2=11;
                        eval(Simple2);
                    case 30
                        L1=18;L2=21;R1=08;
                        L3=17;L4=20;R2=09;
                        eval(Simple2);
                    case 31
                        L1=14;L2=17;R1=05;
                        L3=15;L4=18;R2=06;
                        eval(Simple2);
                    case 32
                        L1=26;L2=29;R1=03;
                        L3=25;L4=28;R2=04;
                        eval(Simple2);
                    otherwise
                        pl=Rep(:,i+3*Sir);
                        Cover(10,02)=pl(1,1);Cover(10,03)=pl(2,1);Cover(10,04)=pl(3,1);Cover(11,03)=pl(4,1);
                        Cover(11,04)=pl(5,1);Cover(12,03)=pl(6,1);Cover(12,04)=pl(7,1);Cover(13,03)=pl(8,1);
                end
            end
    end
end
DispImage=Cover;            