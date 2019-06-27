function [T, Z] = TransformLearning (X, numOfAtoms, mu, lambda, eps)

% solves ||TX - Z||_Fro - mu*logdet(T) + eps*mu||T||_Fro + lambda||Z||_1

% Inputs
% X          - Training Data
% numOfAtoms - dimensionaity after Transform
% mu         - regularizer for Tranform
% lambda     - regularizer for coefficient
% eps        - regularizer for Transform
% type       - 'soft' or 'hard' update: default is 'soft'
% Output
% T          - learnt Transform
% Z          - learnt sparse coefficients

if nargin < 5
    eps = 1;
end
if nargin < 4
    lambda = 0.1;
end
if nargin < 3
    mu = 0.1;
end

maxIter = 10;
type = 'soft'; % default 'soft'

rng(1); % repeatable
T = randn(numOfAtoms, size(X,1));

invL = (X*X' + mu*eps*eye(size(X,1)))^(-0.5);

for i = 1:maxIter
    
    % update Coefficient Z
    % sparse 
    switch type
        case 'soft'
            Z = sign(T*X).*max(0,abs(T*X)-lambda); % soft thresholding
        case 'hard'
            Z = (abs(T*X) >= lambda) .* (T*X); % hard thresholding
    end
    % dense
    % Z = T*X;

    % update Transform T
    [U,S,V] = svd(invL*X*Z');
    
    D = [diag(diag(S) + (diag(S).^2 + 2*mu).^0.5) zeros(numOfAtoms, size(X,1)-numOfAtoms)];
    T = 0.5*V*D*U'*invL;
    
end