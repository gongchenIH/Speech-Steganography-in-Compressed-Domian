function f = SS_QCCN(InputData)
% -------------------------------------------------------------------------
% 2019.9.12
% gc
% -------------------------------------------------------------------------
% Input:  InputData ... path to the LPC

% Output: f ....... extracted SS-QCCN features
% -------------------------------------------------------------------------

%LPC = load(InputData);
matrix = int64(InputData);
Data1=matrix(:,1);
Data2=matrix(:,[2,3]);
feature1 = getTPM( Data1(1:end-1), Data1(2:end), 128);
feature2 = getTPM( Data2(:,1), Data2(:,2), 32);
f = [feature1,feature2];
    
function F = getTPM(A, B, T)
% get transition probability matrix A1 --> A2

F = zeros(T);
dn =  histcounts( A(:),1:(T+1));                                            % normalization factors

for i = 1:T
    FF = B(A == i);                                                      % filtered version
    for j = 1:T
        F(i, j) = nnz(FF==j) / dn(i);
    end
end
F = F(:)';

