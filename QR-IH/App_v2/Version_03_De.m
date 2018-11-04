function [Message]=Version_03_De(Rec,MRM)
Message=[];                             
Simple1='Message=[Message,reshape(Rec(L1:L2,R1:R2),1,8)];';                             
Simple2='Message=[Message,reshape(Rec(L1:L2,R1),1,4),reshape(Rec(L3:L4,R2),1,4)];';
for i=1:numel(MRM)/2
    switch MRM(1,i)
        case 01
            L1=26;L2=29;R1=28;R2=29;
            eval(Simple1);              
        case 02
            L1=18;L2=21;R1=28;R2=29;
            eval(Simple1);
        case 03
            L1=10;L2=13;R1=28;R2=29;
            eval(Simple1);
        case 04
            L1=14;L2=17;R1=26;R2=27;
            eval(Simple1);
        case 05
            L1=22;L2=25;R1=26;R2=27;
            eval(Simple1);
        case 06
            L1=26;L2=29;R1=24;R2=25;
            eval(Simple1);
        case 07
            L1=13;L2=16;R1=24;R2=25;
            eval(Simple1);
        case 08
            L1=11;L2=14;R1=22;R2=23;
            eval(Simple1);
        case 09
            Message=[Message,Rec(19,22),Rec(19,23),Rec(20,22),Rec(20,23),Rec(26,22),Rec(26,23),Rec(27,22),Rec(27,23)];
        case 10
            Message=[Message,Rec(22,20),Rec(23,20),Rec(24,20),Rec(25,20),Rec(26,20),Rec(26,21),Rec(27,20),Rec(27,21)];
        case 11
            L1=14;L2=17;R1=20;
            L3=13;L4=16;R2=21;
            eval(Simple2);
        case 12
            Message=[Message,Rec(05,20),Rec(06,20),Rec(08,20),Rec(09,20),Rec(04,21),Rec(05,21),Rec(06,21),Rec(08,21)];
        case 13
            L1=01;L2=04;R1=18;
            L3=02;L4=05;R2=19;
            eval(Simple2);
        case 14
            L1=10;L2=13;R1=18;
            L3=11;L4=14;R2=19;
            eval(Simple2);
        case 15
            L1=18;L2=21;R1=18;
            L3=19;L4=22;R2=19;
            eval(Simple2);
        case 16
            Message=[Message,Rec(26,18),Rec(27,18),Rec(27,19),Rec(28,18),Rec(28,19),Rec(29,17),Rec(29,18),Rec(29,19)];
        case 17
            L1=22;L2=25;R1=16;
            L3=21;L4=24;R2=17;
            eval(Simple2);
        case 18
            L1=14;L2=17;R1=16;
            L3=13;L4=16;R2=17;
            eval(Simple2);
        case 19
            Message=[Message,Rec(05,16),Rec(06,16),Rec(08,16),Rec(09,16),Rec(04,17),Rec(05,17),Rec(06,17),Rec(08,17)];
        case 20
            L1=01;L2=04;R1=14;
            L3=02;L4=05;R2=15;
            eval(Simple2);
        case 21
            L1=10;L2=13;R1=14;
            L3=11;L4=14;R2=15;
            eval(Simple2);
        case 22
            L1=18;L2=21;R1=14;
            L3=19;L4=22;R2=15;
            eval(Simple2);
        case 23
            Message=[Message,Rec(26,14),Rec(27,14),Rec(27,15),Rec(28,14),Rec(28,15),Rec(29,13),Rec(29,14),Rec(29,15)];
        case 24
            L1=22;L2=25;R1=12;
            L3=21;L4=24;R2=13;
            eval(Simple2);
        case 25
            L1=14;L2=17;R1=12;
            L3=13;L4=16;R2=13;
            eval(Simple2);
        case 26
            Message=[Message,Rec(05,12),Rec(06,12),Rec(08,12),Rec(09,12),Rec(04,13),Rec(05,13),Rec(06,13),Rec(08,13)];
        case 27
            L1=01;L2=04;R1=10;
            L3=02;L4=05;R2=11;
            eval(Simple2);
        case 28
            L1=10;L2=13;R1=10;
            L3=11;L4=14;R2=11;
            eval(Simple2);
        case 29
            L1=18;L2=21;R1=10;
            L3=19;L4=22;R2=11;
            eval(Simple2);
        case 30
            Message=[Message,Rec(26,10),Rec(27,10),Rec(27,11),Rec(28,10),Rec(28,11),Rec(29,10),Rec(29,11),Rec(21,09)];
        case 31
            L1=14;L2=17;R1=08;
            L3=13;L4=16;R2=09;
            eval(Simple2);
        case 32
            L1=10;L2=13;R1=05;
            L3=11;L4=14;R2=06;
            eval(Simple2);
        case 33
            Message=[Message,Rec(18,05),Rec(19,05),Rec(19,06),Rec(20,05),Rec(20,06),Rec(21,04),Rec(21,05),Rec(21,06)];
        case 34
            L1=14;L2=17;R1=03;
            L3=13;L4=16;R2=04;
            eval(Simple2);
        otherwise
            L1=10;L2=13;R1=01;
            L3=11;L4=14;R2=02;
            eval(Simple2);
    end
end
for i=1:numel(MRM)/2
    switch MRM(2,i)
        case 01
            L1=22;L2=25;R1=28;R2=29;
            eval(Simple1);              
        case 02
            L1=14;L2=17;R1=28;R2=29;
            eval(Simple1);
        case 03
            L1=10;L2=13;R1=26;R2=27;
            eval(Simple1);
        case 04
            L1=18;L2=21;R1=26;R2=27;
            eval(Simple1);
        case 05
            L1=26;L2=29;R1=26;R2=27;
            eval(Simple1);
        case 06
            L1=17;L2=20;R1=24;R2=25;
            eval(Simple1);
        case 07
            Message=[Message,Rec(10,22),Rec(10,23),Rec(10,24),Rec(10,25),Rec(11,24),Rec(11,25),Rec(12,24),Rec(12,25)];
        case 08
            L1=15;L2=18;R1=22;R2=23;
            eval(Simple1);
        case 09
            L1=28;L2=29;R1=20;R2=23;
            eval(Simple1);
        case 10
            L1=18;L2=21;R1=20;
            L3=17;L4=20;R2=21;
            eval(Simple2);
        case 11
            L1=10;L2=13;R1=20;
            L3=09;L4=12;R2=21;
            eval(Simple2);
        case 12
            Message=[Message,Rec(01,19),Rec(01,20),Rec(01,21),Rec(02,20),Rec(02,21),Rec(03,20),Rec(03,21),Rec(04,20)];
        case 13
            Message=[Message,Rec(05,18),Rec(06,18),Rec(08,18),Rec(09,18),Rec(06,19),Rec(08,19),Rec(09,19),Rec(10,19)];
        case 14
            L1=14;L2=17;R1=18;
            L3=15;L4=18;R2=19;
            eval(Simple2);
        case 15
            L1=22;L2=25;R1=18;
            L3=23;L4=26;R2=19;
            eval(Simple2);
        case 16
            L1=26;L2=29;R1=16;
            L3=25;L4=28;R2=17;
            eval(Simple2);
        case 17
            L1=18;L2=21;R1=16;
            L3=17;L4=20;R2=17;
            eval(Simple2);
        case 18
            L1=10;L2=13;R1=16;
            L3=09;L4=12;R2=17;
            eval(Simple2);
        case 19
            Message=[Message,Rec(01,15),Rec(01,16),Rec(01,17),Rec(02,16),Rec(02,17),Rec(03,16),Rec(03,17),Rec(04,16)];
        case 20
            Message=[Message,Rec(05,14),Rec(06,14),Rec(08,14),Rec(09,14),Rec(06,15),Rec(08,15),Rec(09,15),Rec(10,15)];
        case 21
            L1=14;L2=17;R1=14;
            L3=15;L4=18;R2=15;
            eval(Simple2);
        case 22
            L1=22;L2=25;R1=14;
            L3=23;L4=26;R2=15;
            eval(Simple2);
        case 23
            L1=26;L2=29;R1=12;
            L3=25;L4=28;R2=13;
            eval(Simple2);
        case 24
            L1=18;L2=21;R1=12;
            L3=17;L4=20;R2=13;
            eval(Simple2);
        case 25
            L1=10;L2=13;R1=12;
            L3=09;L4=12;R2=13;
            eval(Simple2);
        case 26
            Message=[Message,Rec(01,11),Rec(01,12),Rec(01,13),Rec(02,12),Rec(02,13),Rec(03,12),Rec(03,13),Rec(04,12)];
        case 27
            Message=[Message,Rec(05,10),Rec(06,10),Rec(08,10),Rec(09,10),Rec(06,11),Rec(08,11),Rec(09,11),Rec(10,11)];
        case 28
            L1=14;L2=17;R1=10;
            L3=15;L4=18;R2=11;
            eval(Simple2);
        case 29
            L1=22;L2=25;R1=10;
            L3=23;L4=26;R2=11;
            eval(Simple2);
        case 30
            L1=18;L2=21;R1=08;
            L3=17;L4=20;R2=09;
            eval(Simple2);
        case 31
            Message=[Message,Rec(10,06),Rec(10,08),Rec(10,09),Rec(11,08),Rec(11,09),Rec(12,08),Rec(12,09),Rec(13,08)];
        case 32
            L1=14;L2=17;R1=05;
            L3=15;L4=18;R2=06;
            eval(Simple2);
        case 33
            L1=18;L2=21;R1=03;
            L3=17;L4=20;R2=04;
            eval(Simple2);
        case 34
            Message=[Message,Rec(10,02),Rec(10,03),Rec(10,04),Rec(11,03),Rec(11,04),Rec(12,03),Rec(12,04),Rec(13,03)];
        otherwise
            L1=14;L2=17;R1=01;
            L3=15;L4=18;R2=02;
            eval(Simple2);
    end
end
Message;