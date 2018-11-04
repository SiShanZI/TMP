function [Message]=Version_02_De(Rec,MRM)
Message=[];                             
Simple1='Message=[Message,reshape(Rec(L1:L2,R1:R2),1,8)];';                             
Simple2='Message=[Message,reshape(Rec(L1:L2,R1),1,4),reshape(Rec(L3:L4,R2),1,4)];';
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
            Message=[Message,Rec(10,18),Rec(10,19),Rec(10,20),Rec(10,21),Rec(11,20),Rec(11,21),Rec(12,20),Rec(12,21)];
        case 12
            L1=11;L2=14;R1=18;R2=19;
            eval(Simple1);
        case 13
            Message=[Message,Rec(15,18),Rec(15,19),Rec(16,18),Rec(16,19),Rec(22,18),Rec(22,19),Rec(23,18),Rec(23,19)];
        case 14
            L1=24;L2=25;R1=16;R2=19;
            eval(Simple1);
        case 15
            Message=[Message,Rec(18,16),Rec(19,16),Rec(20,16),Rec(21,16),Rec(22,16),Rec(22,17),Rec(23,16),Rec(23,17)];
        case 16
            L1=14;L2=17;R1=16;
            L3=13;L4=16;R2=17;
            eval(Simple2);
        case 17
            L1=10;L2=13;R1=16;
            L3=09;L4=12;R2=17;
            eval(Simple2);
        case 18
            Message=[Message,Rec(05,16),Rec(06,16),Rec(08,16),Rec(09,16),Rec(04,17),Rec(05,17),Rec(06,17),Rec(08,17)];
        case 19
            Message=[Message,Rec(01,15),Rec(01,16),Rec(01,17),Rec(02,16),Rec(02,17),Rec(03,16),Rec(03,17),Rec(04,16)];
        case 20
            L1=01;L2=04;R1=14;
            L3=02;L4=05;R2=15;
            eval(Simple2);
        case 21
            Message=[Message,Rec(05,14),Rec(06,14),Rec(08,14),Rec(09,14),Rec(06,15),Rec(08,15),Rec(09,15),Rec(10,15)];
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
            Message=[Message,Rec(22,14),Rec(23,14),Rec(23,15),Rec(24,14),Rec(24,15),Rec(25,13),Rec(25,14),Rec(25,15)];
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
            Message=[Message,Rec(05,12),Rec(06,12),Rec(08,12),Rec(09,12),Rec(04,13),Rec(05,13),Rec(06,13),Rec(08,13)];
        case 31
            Message=[Message,Rec(01,11),Rec(01,12),Rec(01,13),Rec(02,12),Rec(02,13),Rec(03,12),Rec(03,13),Rec(04,12)];
        case 32
            L1=01;L2=04;R1=10;
            L3=02;L4=05;R2=11;
            eval(Simple2);
        case 33
            Message=[Message,Rec(05,10),Rec(06,10),Rec(08,10),Rec(09,10),Rec(06,11),Rec(08,11),Rec(09,11),Rec(10,11)];
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
            Message=[Message,Rec(22,10),Rec(23,10),Rec(24,10),Rec(25,10),Rec(23,11),Rec(24,11),Rec(25,11),Rec(17,09)];
        case 38
            L1=14;L2=17;R1=08;
            L3=13;L4=16;R2=09;
            eval(Simple2);
        case 39
            Message=[Message,Rec(10,08),Rec(11,08),Rec(12,08),Rec(13,08),Rec(10,09),Rec(11,09),Rec(12,09),Rec(10,06)];
        case 40
            L1=10;L2=13;R1=05;
            L3=11;L4=14;R2=06;
            eval(Simple2);
        case 41
            Message=[Message,Rec(14,05),Rec(15,05),Rec(15,06),Rec(16,05),Rec(16,06),Rec(17,04),Rec(17,05),Rec(17,06)];
        case 42
            L1=14;L2=17;R1=03;
            L3=13;L4=16;R2=04;
            eval(Simple2);
        case 43
            Message=[Message,Rec(10,02),Rec(10,03),Rec(10,04),Rec(11,03),Rec(11,04),Rec(12,03),Rec(12,04),Rec(13,03)];
        otherwise
            L1=10;L2=13;R1=01;
            L3=11;L4=14;R2=02;
            eval(Simple2);
    end
end
Message;