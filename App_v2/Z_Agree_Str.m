function [Deliver]=Z_Agree_Str(Original)
for i=1:length(Original)                %暂定字符集{@ A~Z . / 0~9 : 空格 !}共41个，“！”为终止符，不作输入
    if(Original(i)>=1&Original(i)<=27)  %约定的映射关系
        Original(i)=Original(i)+63;
    elseif(Original(i)>=28&Original(i)<=40)
        Original(i)=Original(i)+18;
    else                                %不会出现终止符（由前面模块保证）
        Original(i)=32;
    end
end
Deliver=setstr(Original);               %ASCII码转换为字符串