function f = CEC(InputData)
% -------------------------------------------------------------------------
% 2019.9.12
% gc
% -------------------------------------------------------------------------
% Input:  InputData ... path to the LPC

% Output: f ....... extracted SS-QCCN features
% -------------------------------------------------------------------------

%LPC = load(InputData);
matrix = int64(InputData);
Data1=matrix(:,2);
Data2=matrix(:,[1,2]);
feature1 = getTPM( Data1(1:end-1), Data1(2:end), 32);
A=Data1(1:end-1);
B=Data1(2:end)
feature1 = zeros(32);
dn =  histcounts( A(:),1:(T+1));                                            % normalization factors

for i = 1:T
    FF = B(A == i);                                                      % filtered version
    for j = 1:T
        feature1(i, j) = nnz(FF==j) / dn(i);
    end
end
feature1 = feature1(:)';

feature1 = getTPM( Data1(1:end-1), Data1(2:end), 32);
A=Data2(:,1);
B=Data2(:,2)
feature2 = zeros(256,32);
dn =  histcounts( A(:),1:(T+1));                                            % normalization factors

for i = 1:T
    FF = B(A == i);                                                      % filtered version
    for j = 1:T
        feature2(i, j) = nnz(FF==j) / dn(i);
    end
end
feature2 = feature2(:)';


f = [feature1,feature2];
