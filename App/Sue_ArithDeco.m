function [Original]=Sue_ArithDeco(Stream,Np)
Stream=reshape(Stream,4,numel(Stream)/4);     
Original=[];DeSeq=[];
for i=1:numel(Stream)/4                 %将比特流转换为十进制字符集
    Mid=0;
    for j=1:4
        Mid=Mid+Stream(j,i)*2^(4-j);
    end
    DeSeq=[DeSeq,Mid];
end
DeSeq=sym(DeSeq);
DeSeqL=length(DeSeq);
Nn=Np;i=1;Q=10;
Cal=ones(1,Np);
Sides=sym([0:1/Np:1]);                  %符号运算保证精度
A=DeSeq(i)/Q;
B=A+1/Q;
while(1)
    j=1;                                %确定区间以获得一位解码输出
    while(j<=Np&(~(double(Sides(j))<=double(A)&double(B)<=double(Sides(j+1)))))
        j=j+1;
    end
    if(j>Np)                            %精度不足，增加小数位
        i=i+1;
        if(i<=DeSeqL)
            Q=Q*10;
            A=A+DeSeq(i)/Q;
            B=A+1/Q;
        else
            break
        end
    else                                %当前精度可以确定某一区间（一位输出），然后重新分布概率区间                         
        if(j==Np)                       %遇到终止符则停止解码（系统需要）
            break
        end
        Original=[Original,j];          %非终止符则输出一位解码,如需屏显，则disp(j)即可
        Nn=Nn+1;                        %重新分布概率区间，同编码
        Cal(j)=Cal(j)+1;
        Sides(1)=Sides(j);
        Sides(Np+1)=Sides(j+1);
        Stepv=(Sides(Np+1)-Sides(1))/Nn;
        while(1)                        %提取区间小数位，减少小数位数，同编码
            Pa=floor(Sides(1)*10);      
            Pb=floor(Sides(Np+1)*10);
            if(Pa==Pb)
                Stepv=Stepv*10;
                Sides(1)=Sides(1)*10-Pa;
                Sides(Np+1)=Sides(Np+1)*10-Pa;
                Q=Q/10;                 %同时提取编码小数位
                A=A*10-floor(A*10);
                B=B*10-floor(B*10);
            else
                break
            end
        end
        for k=2:Np
            Sides(k)=Sides(k-1)+Stepv*Cal(k-1);
        end        
    end
end
A;                                      %剩余规则位
SiL=double((Sides(1)));                 %最后的区间
SiR=double((Sides(Np+1)));
Original;
