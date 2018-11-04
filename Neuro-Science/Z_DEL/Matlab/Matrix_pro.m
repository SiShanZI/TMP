function Matrix_pro(precision, iter); if nargin < 2; iter = 1000; end; if nargin < 1; precision = 5; end
%
load Matrix.mat
Matrix_nor = Matrix_FibN ./ repmat(sum(Matrix_FibN, 2), 1, size(Matrix_FibN, 2));
Matrix_pre = Matrix_nor; i = 0;
%
while 1; i = i+1;
if i > iter || all(all((floor(-log10(Matrix_pre * Matrix_nor - Matrix_pre)) - floor(-log10(Matrix_pre))) >= precision))
break; end
Matrix_pre = Matrix_pre * Matrix_nor;
end
Dis = Matrix_pre(1, :);
save('MY_Res', 'Dis', 'i')
end
%