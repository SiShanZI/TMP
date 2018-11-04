function [PSM, Inter] = Sue_Dijkstra(G, n, Sp); if nargin < 3; Sp = 1; end
%
U = ones(1, n);                                        % 剩余节点集合，“1”表存在，“0”表已剔除。
PSM = zeros(2, n); PSM(2, Sp) = 1;                     % 自己到自己的长度为0，路径数为1。
Bp = Sp; U(Bp) = 0;
flag = 1; while sum(U) > 0 && flag == 1; flag = 0;     % 有剩余节点且连通（避免陷入死循环）。
for Np = 1:n; if G(Np, Bp) ~= 0                        % 中间点Bp（Bridge point桥点）的邻接点。
lsn = PSM(1, Bp) + G(Np, Bp);
if PSM(1, Np) == 0 || lsn < PSM(1, Np); PSM(1, Np) = lsn; PSM(2, Np) = PSM(2, Bp);
% 有多条最短路径。
elseif lsn == PSM(1, Np); PSM(2, Np) = PSM(2, Np) + PSM(2, Bp);
end
end; end
% 选择新的中间点，原则是选择PSM中所有当前最短路径到U的距离为最短。
Min = inf; for Bpi = 1:n; if U(Bpi) ~= 0 && PSM(1, Bpi) ~= 0 && PSM(1, Bpi) <= Min
Min = PSM(1, Bpi); Bp = Bpi; flag = 1;
end; end
% 剔除中间点，作为中间点剔除后方可确定为最短。
U(Bp) = 0;
end
% 结束while
PSM(1, Sp) = 0; PSM(2, Sp) = 1;
if isempty(find(PSM(2, :) == 0)); Inter = 1; else Inter = 0; end
end
%