function f = MSDPD(InputData)
% -------------------------------------------------------------------------
% 2018.7.17
% gc
% -------------------------------------------------------------------------
% Extracts probability transfer matrix of the second-order difference of pitch
% delay (MSDPD) steganalysis featuresall presented in paper
% AMR Steganalysis Based on Second-Order Difference of Pitch Delay (TIFS) 
% -------------------------------------------------------------------------
% Input:  PD ... path to the pitch delay 
% 		  T: threshold,[-6,6]
% 		  D: order,2
% Output: f ....... extracted MSDPD features
% -------------------------------------------------------------------------

%PD = load(Input_path);

	matrix = int64(InputData);% 基音都是整数，double类型会降低运算速度，最好转换成整型
	[T,order] = deal(6,2);

	
% 2nd-order residuals are implemented using Residual.m
[Dh] = Residual(matrix,2,'hor');
[Yh] = trunc(Dh,T);
% Co-occurrence 
f = reshape(Cooc(Yh,order,'hor',T),[],1);


% %% wyt
%     %% horizontal (2T+1)^2 features     
%     feature = [];
%     A1 = Yh(:,1:end-order);
%     A2 = Yh(:,1+order:end);
%     feature = [feature;getTPM(A1,A2,T)];
% cut off %
function Z = trunc(X,T)
% Truncation to [-T,T]
Z = X;
Z(Z > T)  =  T;
Z(Z < -T) = -T;
% cut off ---done%

% matrix%
function f = Cooc(D,order,type,T)
% Co-occurrence operator to be appied to a 2D array of residuals D \in [-T,T]
% T     ... threshold
% order ... cooc order \in {1,2,3,4,5}
% type  ... cooc type \in {hor,ver,diag,mdiag,square,square-ori,hvdm}
% f     ... an array of size (2T+1)^order

B = 2*T+1;
if max(abs(D(:))) > T, fprintf('*** ERROR in Cooc.m: Residual out of range ***\n'), end

switch order
    case 1
        f = hist(D(:),-T:T);
    case 2
        f = zeros(B,B);       
        if strcmp(type,'hor'),   L = D(:,1:end-1); R = D(:,2:end);end
        if strcmp(type,'ver'),   L = D(1:end-1,:); R = D(2:end,:);end
        if strcmp(type,'diag'),  L = D(1:end-1,1:end-1); R = D(2:end,2:end);end
        if strcmp(type,'mdiag'), L = D(1:end-1,2:end); R = D(2:end,1:end-1);end
        %dn = max(hist(L(:), -T:T), 1); 
        for i = -T : T
            R2 = R(L(:)==i);
            for j = -T : T
                %f(i+T+1,j+T+1) = sum(R2(:)==j);
                f(i+T+1,j+T+1) = sum(R2(:)==j)/sum(L(:)==i);
            end
        end
    case 3
        f = zeros(B,B,B);
        if strcmp(type,'hor'),   L = D(:,1:end-2); C = D(:,2:end-1); R = D(:,3:end);end
        if strcmp(type,'ver'),   L = D(1:end-2,:); C = D(2:end-1,:); R = D(3:end,:);end
        if strcmp(type,'diag'),  L = D(1:end-2,1:end-2); C = D(2:end-1,2:end-1); R = D(3:end,3:end);end
        if strcmp(type,'mdiag'), L = D(1:end-2,3:end); C = D(2:end-1,2:end-1); R = D(3:end,1:end-2);end
        for i = -T : T
            C2 = C(L(:)==i);
            R2 = R(L(:)==i);
            for j = -T : T
                R3 = R2(C2(:)==j);
                for k = -T : T
                    f(i+T+1,j+T+1,k+T+1) = sum(R3(:)==k);
                end
            end
        end
    case 4
        f = zeros(B,B,B,B);
        if strcmp(type,'hor'),    L = D(:,1:end-3); C = D(:,2:end-2); E = D(:,3:end-1); R = D(:,4:end);end
        if strcmp(type,'ver'),    L = D(1:end-3,:); C = D(2:end-2,:); E = D(3:end-1,:); R = D(4:end,:);end
        if strcmp(type,'diag'),   L = D(1:end-3,1:end-3); C = D(2:end-2,2:end-2); E = D(3:end-1,3:end-1); R = D(4:end,4:end);end
        if strcmp(type,'mdiag'),  L = D(4:end,1:end-3); C = D(3:end-1,2:end-2); E = D(2:end-2,3:end-1); R = D(1:end-3,4:end);end
        if strcmp(type,'square'), L = D(2:end,1:end-1); C = D(2:end,2:end); E = D(1:end-1,2:end); R = D(1:end-1,1:end-1);end
        if strcmp(type,'square-ori'), [M, N] = size(D); Dh = D(:,1:M); Dv = D(:,M+1:2*M);
                                  L = Dh(2:end,1:end-1); C = Dv(2:end,2:end); E = Dh(1:end-1,2:end); R = Dv(1:end-1,1:end-1);end
        if strcmp(type,'hvdm'),   [M, N] = size(D); L = D(:,1:M); C = D(:,M+1:2*M); E = D(:,2*M+1:3*M); R = D(:,3*M+1:4*M);end
        if strcmp(type,'s-in'),   [M, N] = size(D); Dh = D(:,1:M); Dv = D(:,M+1:2*M); Dh1 = D(:,2*M+1:3*M); Dv1 = D(:,3*M+1:4*M);
                                  L = Dh(2:end,1:end-1); C = Dh1(2:end,2:end); E = Dh1(1:end-1,2:end); R = Dh(1:end-1,1:end-1);end
        if strcmp(type,'s-out'),  [M, N] = size(D); Dh = D(:,1:M); Dv = D(:,M+1:2*M); Dh1 = D(:,2*M+1:3*M); Dv1 = D(:,3*M+1:4*M);
                                  L = Dh1(2:end,1:end-1); C = Dh(2:end,2:end); E = Dh(1:end-1,2:end); R = Dh1(1:end-1,1:end-1);end
        if strcmp(type,'ori-in'), [M, N] = size(D); Dh = D(:,1:M); Dv = D(:,M+1:2*M); Dh1 = D(:,2*M+1:3*M); Dv1 = D(:,3*M+1:4*M);
                                  L = Dh(2:end,1:end-1); C = Dv1(2:end,2:end); E = Dh1(1:end-1,2:end); R = Dv(1:end-1,1:end-1);end
        if strcmp(type,'ori-out'),[M, N] = size(D); Dh = D(:,1:M); Dv = D(:,M+1:2*M); Dh1 = D(:,2*M+1:3*M); Dv1 = D(:,3*M+1:4*M);
                                  L = Dh1(2:end,1:end-1); C = Dv(2:end,2:end); E = Dh(1:end-1,2:end); R = Dv1(1:end-1,1:end-1);end
        for i = -T : T
            ind = (L(:)==i); C2 = C(ind); E2 = E(ind); R2 = R(ind);
            for j = -T : T
                ind = (C2(:)==j); E3 = E2(ind); R3 = R2(ind);
                for k = -T : T
                    R4 = R3(E3(:)==k);
                    for l = -T : T
                        f(i+T+1,j+T+1,k+T+1,l+T+1) = sum(R4(:)==l);
                    end
                end
            end
        end
    case 5
        f = zeros(B,B,B,B,B);
        if strcmp(type,'hor'),L = D(:,1:end-4); C = D(:,2:end-3); E = D(:,3:end-2); F = D(:,4:end-1); R = D(:,5:end);end
        if strcmp(type,'ver'),L = D(1:end-4,:); C = D(2:end-3,:); E = D(3:end-2,:); F = D(4:end-1,:); R = D(5:end,:);end
        
        for i = -T : T
            ind = (L(:)==i); C2 = C(ind); E2 = E(ind); F2 = F(ind); R2 = R(ind);
            for j = -T : T
                ind = (C2(:)==j); E3 = E2(ind); F3 = F2(ind); R3 = R2(ind);
                for k = -T : T
                    ind = (E3(:)==k); F4 = F3(ind); R4 = R3(ind);
                    for l = -T : T
                        R5 = R4(F4(:)==l);
                        for m = -T : T
                            f(i+T+1,j+T+1,k+T+1,l+T+1,m+T+1) = sum(R5(:)==m);
                        end
                    end
                end
            end
        end
end

% % normalization
% f = double(f);
% fsum = sum(f(:));
% if fsum>0, f = f/fsum; end
% matrix --- done%

% Compute residual%
function D = Residual(X,order,type)
% Computes the noise residual of a given type and order from MxN image X.
% residual order \in {1,2,3,4,5,6}
% type \in {hor,ver,diag,mdiag,KB,edge-h,edge-v,edge-d,edge-m}
% The resulting residual is an (M-b)x(N-b) array of the specified order,
% where b = ceil(order/2). This cropping is little more than it needs to 
% be to make sure all the residuals are easily "synchronized".
% !!!!!!!!!!!!! Use order = 2 with KB and all edge residuals !!!!!!!!!!!!!

[M N] = size(X);
% I = 1+ceil(order/2) : M-ceil(order/2);
% J = 1+ceil(order/2) : N-ceil(order/2);
I = 1;
J = 1+order/2 : N-order/2;
switch type
    case 'hor'
        switch order
            case 1, D = - X(I,J) + X(I,J+1);
            case 2, D = X(I,J-1) - 2*X(I,J) + X(I,J+1);
            case 3, D = X(I,J-1) - 3*X(I,J) + 3*X(I,J+1) - X(I,J+2);
            case 4, D = -X(I,J-2) + 4*X(I,J-1) - 6*X(I,J) + 4*X(I,J+1) - X(I,J+2);
            case 5, D = -X(I,J-2) + 5*X(I,J-1) - 10*X(I,J) + 10*X(I,J+1) - 5*X(I,J+2) + X(I,J+3);
            case 6, D = X(I,J-3) - 6*X(I,J-2) + 15*X(I,J-1) - 20*X(I,J) + 15*X(I,J+1) - 6*X(I,J+2) + X(I,J+3);
        end
    case 'ver'
        switch order
            case 1, D = - X(I,J) + X(I+1,J);
            case 2, D = X(I-1,J) - 2*X(I,J) + X(I+1,J);
            case 3, D = X(I-1,J) - 3*X(I,J) + 3*X(I+1,J) - X(I+2,J);
            case 4, D = -X(I-2,J) + 4*X(I-1,J) - 6*X(I,J) + 4*X(I+1,J) - X(I+2,J);
            case 5, D = -X(I-2,J) + 5*X(I-1,J) - 10*X(I,J) + 10*X(I+1,J) - 5*X(I+2,J) + X(I+3,J);
            case 6, D = X(I-3,J) - 6*X(I-2,J) + 15*X(I-1,J) - 20*X(I,J) + 15*X(I+1,J) - 6*X(I+2,J) + X(I+3,J);
        end
    case 'diag'
        switch order
            case 1, D = - X(I,J) + X(I+1,J+1);
            case 2, D = X(I-1,J-1) - 2*X(I,J) + X(I+1,J+1);
            case 3, D = X(I-1,J-1) - 3*X(I,J) + 3*X(I+1,J+1) - X(I+2,J+2);
            case 4, D = -X(I-2,J-2) + 4*X(I-1,J-1) - 6*X(I,J) + 4*X(I+1,J+1) - X(I+2,J+2);
            case 5, D = -X(I-2,J-2) + 5*X(I-1,J-1) - 10*X(I,J) + 10*X(I+1,J+1) - 5*X(I+2,J+2) + X(I+3,J+3);
            case 6, D = X(I-3,J-3) - 6*X(I-2,J-2) + 15*X(I-1,J-1) - 20*X(I,J) + 15*X(I+1,J+1) - 6*X(I+2,J+2) + X(I+3,J+3);
        end
    case 'mdiag'
        switch order
            case 1, D = - X(I,J) + X(I-1,J+1);
            case 2, D = X(I-1,J+1) - 2*X(I,J) + X(I+1,J-1);
            case 3, D = X(I-1,J+1) - 3*X(I,J) + 3*X(I+1,J-1) - X(I+2,J-2);
            case 4, D = -X(I-2,J+2) + 4*X(I-1,J+1) - 6*X(I,J) + 4*X(I+1,J-1) - X(I+2,J-2);
            case 5, D = -X(I-2,J+2) + 5*X(I-1,J+1) - 10*X(I,J) + 10*X(I+1,J-1) - 5*X(I+2,J-2) + X(I+3,J-3);
            case 6, D = X(I-3,J+3) - 6*X(I-2,J+2) + 15*X(I-1,J+1) - 20*X(I,J) + 15*X(I+1,J-1) - 6*X(I+2,J-2) + X(I+3,J-3);
        end
    case 'KB'
        D = -X(I-1,J-1) + 2*X(I-1,J) - X(I-1,J+1) + 2*X(I,J-1) - 4*X(I,J) + 2*X(I,J+1) - X(I+1,J-1) + 2*X(I+1,J) - X(I+1,J+1);
    case 'edge-h'
        Du = 2*X(I-1,J) + 2*X(I,J-1) + 2*X(I,J+1) - X(I-1,J-1) - X(I-1,J+1) - 4*X(I,J);   %   -1  2 -1
        Db = 2*X(I+1,J) + 2*X(I,J-1) + 2*X(I,J+1) - X(I+1,J-1) - X(I+1,J+1) - 4*X(I,J);   %    2  C  2    +  flipped vertically
        D = [Du,Db];
    case 'edge-v'
        Dl = 2*X(I,J-1) + 2*X(I-1,J) + 2*X(I+1,J) - X(I-1,J-1) - X(I+1,J-1) - 4*X(I,J);   %   -1  2
        Dr = 2*X(I,J+1) + 2*X(I-1,J) + 2*X(I+1,J) - X(I-1,J+1) - X(I+1,J+1) - 4*X(I,J);   %    2  C       +  flipped horizontally
        D = [Dl,Dr];                                                                      %   -1  2
    case 'edge-m'
        Dlu = 2*X(I,J-1) + 2*X(I-1,J) - X(I-1,J-1) - X(I+1,J-1) - X(I-1,J+1) - X(I,J); %      -1  2 -1
        Drb = 2*X(I,J+1) + 2*X(I+1,J) - X(I+1,J+1) - X(I+1,J-1) - X(I-1,J+1) - X(I,J); %       2  C       +  flipped mdiag
        D = [Dlu,Drb];                                                                 %      -1
    case 'edge-d'
        Dru = 2*X(I-1,J) + 2*X(I,J+1) - X(I-1,J+1) - X(I-1,J-1) - X(I+1,J+1) - X(I,J); %      -1  2 -1
        Dlb = 2*X(I,J-1) + 2*X(I+1,J) - X(I+1,J-1) - X(I+1,J+1) - X(I-1,J-1) - X(I,J); %          C  2    +  flipped diag
        D = [Dru,Dlb];                                                                 %            -1
    case 'KV'
        D = 8*X(I-1,J) + 8*X(I+1,J) + 8*X(I,J-1) + 8*X(I,J+1);
        D = D - 6*X(I-1,J+1) - 6*X(I-1,J-1) - 6*X(I+1,J-1) - 6*X(I+1,J+1);
        D = D - 2*X(I-2,J) - 2*X(I+2,J) - 2*X(I,J+2) - 2*X(I,J-2);
        D = D + 2*X(I-1,J-2) + 2*X(I-2,J-1) + 2*X(I-2,J+1) + 2*X(I-1,J+2) + 2*X(I+1,J+2) + 2*X(I+2,J+1) + 2*X(I+2,J-1) + 2*X(I+1,J-2);
        D = D - X(I-2,J-2) - X(I-2,J+2) - X(I+2,J-2) - X(I+2,J+2) - 12*X(I,J);

% Compute residual ---done%
end
