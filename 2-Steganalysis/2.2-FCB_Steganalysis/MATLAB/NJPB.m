function F = NJPB(FCB)
% -------------------------------------------------------------------------
% 2019.1.7
% gc
% -------------------------------------------------------------------------
%
% -------------------------------------------------------------------------
% Input:  FCB ... path to the FCB
%
% Output: f ....... extracted Miao features
% 注意，histcounts要在版本大于2014才可以运行
% -------------------------------------------------------------------------

%% feature part1
matrix1 = single(FCB);% double类型会降低运算速度，最好转换成整型

%%预处理，映射到0~7
matrix2 = matrix1;
matrix2 = floor(matrix2/5);
matrix = int8(matrix2);
X = matrix;
F1 = ExtractIntrablock(X); 
F2 = ExtractInterblock(X); 
F3 = ExtractIntraDifblock(X); 
F4 = ExtractInterDifblock(X); 
F =[F1;F2;F3;F4];

%% Intrablock
function F = ExtractIntrablock(A)
T = 7;
F = zeros(8,8); % Intrablock part;
%% horizontal

F1h = extractNB( A(:,1:end-1), A(:,2:end), T);
F1h = F1h';
F1h = normalize(F1h);
F = F+F1h;

%% vertical
F1v = extractNB( A(1:end-1,:), A(2:end,:), T);
F1v = F1v';
F1v = normalize(F1v);
F = F+F1v;

%% diagonal
F1d = extractNB( A(1:end-1,1:end-1), A(2:end,2:end), T);
F1d = F1d';
F1d = normalize(F1d);
F = F+F1d;

%% minor diagonal
F1m = extractNB( A(2:end,1:end-1), A(1:end-1,2:end), T);
F1m = normalize(F1m);
F = F+F1m;

 
%% Interblock    
function F = ExtractInterblock(A)
T = 7; 
F = zeros(8,8); % inter-block part; 
for MODE = 1:20

    AA = PlaneToVecMode(A,MODE);
    
    % horizontal
    F2h = extractNB( AA(:,1:end-1), AA(:,2:end),T);
    %F2h = F2h';
    F_temp = normalize(F2h);
    F = F+F_temp;

    % vertical
    F2v = extractNB( AA(1:end-1,:), AA(2:end,:),T); 
    %F2v = F2v';
    F_temp = normalize(F2v);
    F = F+F_temp;           

    %% diagonal
    F2d = extractNB( AA(1:end-1,1:end-1), AA(2:end,2:end), T);
    %F2d = F2d';
    F_temp = normalize(F2d);
    F = F+F_temp;

    %% minor diagonal
    F2m = extractNB( AA(2:end,1:end-1), AA(1:end-1,2:end), T);
    %F2m = F2m';
    F_temp = normalize(F2m);
    F = F+F_temp;
    
end
F = F/20;

function F = ExtractIntraDifblock(A)

T = 7;
F = zeros(8,8); % Intrablock part;
%% horizontal
Ad = conv2(A,[-1 1],'valid');    % <=> A(:,1:end-1) - A(:,2:end);
Ad = abs(Ad);
F1h = extractNB( Ad(:,1:end-1), Ad(:,2:end), T);
%F1h = F1h';
F1h = normalize(F1h);
F = F+F1h;

%% vertical
Ad = conv2(A,[-1;1],'valid');    % <=> A(1:end-1,:) - A(2:end,:);
Ad = abs(Ad);
F1v = extractNB( Ad(1:end-1,:), Ad(2:end,:), T);
%F1v = F1v';
F1v = normalize(F1v);
F = F+F1v;

%% diagonal
Ad = conv2(A,[-1 0;0 1],'valid');% <=> A(1:end-1,1:end-1) - A(2:end,2:end);
Ad = abs(Ad);
F1d = extractNB( Ad(1:end-1,1:end-1), Ad(2:end,2:end), T);
%F1d = F1d';
F1d = normalize(F1d);
F = F+F1d;

%% minor diagonal
Ad = conv2(A,[0 1;-1 0],'valid');% <=> A(2:end,1:end-1) - A(1:end-1,2:end);
Ad = abs(Ad);
F1m = extractNB( Ad(2:end,1:end-1), Ad(1:end-1,2:end), T);
%F1m = F1m';
F1m = normalize(F1m);
F = F+F1m;


function F = ExtractInterDifblock(A)
T = 7; 
F = zeros(8,8); % inter-block part; 
for MODE = 1:20

    AA = PlaneToVecMode(A,MODE);
    
    Ad = conv2(AA,[-1 1],'valid');   % <=> A(:,1:end-1) - A(:,2:end);
    Ad = abs(Ad);
    % horizontal
    F2h = extractNB( Ad(:,1:end-1), Ad(:,2:end),T);
    %F2h = F2h';
    F_temp = normalize(F2h);
    F = F+F_temp;

    % vertical
    Ad = conv2(AA,[-1;1],'valid');
    Ad = abs(Ad);
    F2v = extractNB( Ad(1:end-1,:), Ad(2:end,:),T); 
    %F2v = F2v';
    F_temp = normalize(F2v);
    F = F+F_temp;           

    %% diagonal
    Ad = conv2(AA,[-1 0;0 1],'valid');% <=> A(1:end-1,1:end-1) - A(2:end,2:end);
    Ad = abs(Ad);
    F2d = extractNB( Ad(1:end-1,1:end-1), Ad(2:end,2:end), T);
    %F2d = F2d';
    F_temp = normalize(F2d);
    F = F+F_temp;

    %% minor diagonal
    Ad = conv2(AA,[0 1;-1 0],'valid');% <=> A(2:end,1:end-1) - A(1:end-1,2:end);
    Ad = abs(Ad);
    F2m = extractNB( Ad(2:end,1:end-1), Ad(1:end-1,2:end), T);
    %F2m = F2m';
    F_temp = normalize(F2m);
    F = F+F_temp;
    
end
F = F/20;

	
function F = extractNB(A1,A2,t)

% 2nd order cooccurence
F = zeros(t+1,t+1);
for i=0:t
    FF = A2(A1==i);
    if ~isempty(FF)
        for j=0:t
            F(i+1,j+1) = sum(FF(:)==j);
        end
    end
end

function f = normalize(f)
S = sum(f(:));
if S~=0, f=f/S; end

        
function Mat=PlaneToVecMode(plane,MODE)
mask = reshape(1:20,4,5);
[i,j] = find(mask==MODE);
Mat = [plane(:,j),plane(:,j+5)]; % 行，隔4取；列，隔5取
%Mat_temp = [plane(:,j),plane(:,j+5)]; % 行，隔4取；列，隔5取

%% 不隔行
%Mat = Mat_temp(i:4:end,:); % 行，隔4取；列，隔5取
