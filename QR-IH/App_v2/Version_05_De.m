function [Message]=Version_05_De(Rec,MRM)
Message=[];                             
Simple1='Message=[Message,reshape(Rec(L1:L2,R1:R2),1,8)];';                             
Simple2='Message=[Message,reshape(Rec(L1:L2,R1),1,4),reshape(Rec(L3:L4,R2),1,4)];';
for i=1:numel(MRM)/4
    switch MRM(1,i)
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
            Message=[Message,Rec(27,30),Rec(27,31),Rec(28,30),Rec(28,31),Rec(34,30),Rec(34,31),Rec(35,30),Rec(35,31)];
        case 08
            L1=22;L2=25;R1=28;
            L3=21;L4=24;R2=29;
            eval(Simple2);
        case 09
            Message=[Message,Rec(05,28),Rec(06,28),Rec(08,28),Rec(09,28),Rec(04,29),Rec(05,29),Rec(06,29),Rec(08,29)];
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
            Message=[Message,Rec(05,24),Rec(06,24),Rec(08,24),Rec(09,24),Rec(04,25),Rec(05,25),Rec(06,25),Rec(08,25)];
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
            Message=[Message,Rec(34,18),Rec(35,18),Rec(35,19),Rec(36,18),Rec(36,19),Rec(37,17),Rec(37,18),Rec(37,19)];
        case 21
            L1=22;L2=25;R1=16;
            L3=21;L4=24;R2=17;
            eval(Simple2);
        case 22
            Message=[Message,Rec(05,16),Rec(06,16),Rec(08,16),Rec(09,16),Rec(04,17),Rec(05,17),Rec(06,17),Rec(08,17)];
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
            Message=[Message,Rec(34,10),Rec(35,10),Rec(35,11),Rec(36,10),Rec(36,11),Rec(37,09),Rec(37,10),Rec(37,11)];
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
for i=1:numel(MRM)/4
    switch MRM(2,i)
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
            Message=[Message,reshape(Rec(L1:L2,R1:R2),1,8)];
        case 08
            L1=18;L2=21;R1=28;
            L3=17;L4=20;R2=29;
            eval(Simple2);
        case 09
            Message=[Message,Rec(01,27),Rec(01,28),Rec(01,29),Rec(02,28),Rec(02,29),Rec(03,28),Rec(03,29),Rec(04,28)];
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
            Message=[Message,Rec(01,23),Rec(01,24),Rec(01,25),Rec(02,24),Rec(02,25),Rec(03,24),Rec(03,25),Rec(04,24)];
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
            Message=[Message,Rec(05,18),Rec(06,18),Rec(08,18),Rec(09,18),Rec(06,19),Rec(08,19),Rec(09,19),Rec(10,19)];
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
            Message=[Message,Rec(01,15),Rec(01,16),Rec(01,17),Rec(02,16),Rec(02,17),Rec(03,16),Rec(03,17),Rec(04,16)];
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
            Message=[Message,Rec(05,10),Rec(06,10),Rec(08,10),Rec(09,10),Rec(06,11),Rec(08,11),Rec(09,11),Rec(10,11)];
        case 28
            L1=22;L2=25;R1=10;
            L3=23;L4=26;R2=11;
            eval(Simple2);
        case 29
            L1=26;L2=29;R1=08;
            L3=25;L4=28;R2=09;
            eval(Simple2);
        case 30
            Message=[Message,Rec(10,06),Rec(10,08),Rec(10,09),Rec(11,08),Rec(11,09),Rec(12,08),Rec(12,09),Rec(13,08)];
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
for i=1:numel(MRM)/4
    switch MRM(3,i)
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
            Message=[Message,Rec(30,28),Rec(31,28),Rec(32,28),Rec(33,28),Rec(34,28),Rec(34,29),Rec(35,28),Rec(35,29)];
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
            Message=[Message,Rec(34,26),Rec(35,26),Rec(35,27),Rec(36,26),Rec(36,27),Rec(37,25),Rec(37,26),Rec(37,27)];
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
            Message=[Message,Rec(34,22),Rec(35,22),Rec(35,23),Rec(36,22),Rec(36,23),Rec(37,21),Rec(37,22),Rec(37,23)];
        case 17
            L1=22;L2=25;R1=20;
            L3=21;L4=24;R2=21;
            eval(Simple2);
        case 18
            Message=[Message,Rec(05,20),Rec(06,20),Rec(08,20),Rec(09,20),Rec(04,21),Rec(05,21),Rec(06,21),Rec(08,21)];
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
            Message=[Message,Rec(34,14),Rec(35,14),Rec(35,15),Rec(36,14),Rec(36,15),Rec(37,13),Rec(37,14),Rec(37,15)];
        case 26
            L1=22;L2=25;R1=12;
            L3=21;L4=24;R2=13;
            eval(Simple2);
        case 27
            Message=[Message,Rec(05,12),Rec(06,12),Rec(08,12),Rec(09,12),Rec(04,13),Rec(05,13),Rec(06,13),Rec(08,13)];
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
            Message=[Message,Rec(26,05),Rec(27,05),Rec(27,06),Rec(28,05),Rec(28,06),Rec(29,04),Rec(29,05),Rec(29,06)];
        otherwise
            L1=14;L2=17;R1=03;
            L3=13;L4=16;R2=04;
            eval(Simple2);
    end
end
for i=1:numel(MRM)/4
    switch MRM(4,i)
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
            Message=[Message,Rec(10,30),Rec(10,31),Rec(10,32),Rec(10,33),Rec(11,32),Rec(11,33),Rec(12,32),Rec(12,33)];
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
            Message=[Message,Rec(05,26),Rec(06,26),Rec(08,26),Rec(09,26),Rec(06,27),Rec(08,27),Rec(09,27),Rec(10,27)];
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
            Message=[Message,Rec(05,22),Rec(06,22),Rec(08,22),Rec(09,22),Rec(06,23),Rec(08,23),Rec(09,23),Rec(10,23)];
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
            Message=[Message,Rec(01,19),Rec(01,20),Rec(01,21),Rec(02,20),Rec(02,21),Rec(03,20),Rec(03,21),Rec(04,20)];
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
            Message=[Message,Rec(05,14),Rec(06,14),Rec(08,14),Rec(09,14),Rec(06,15),Rec(08,15),Rec(09,15),Rec(10,15)];
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
            Message=[Message,Rec(01,11),Rec(01,12),Rec(01,13),Rec(02,12),Rec(02,13),Rec(03,12),Rec(03,13),Rec(04,12)];
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
            Message=[Message,Rec(10,02),Rec(10,03),Rec(10,04),Rec(11,03),Rec(11,04),Rec(12,03),Rec(12,04),Rec(13,03)];
    end
end
Message;