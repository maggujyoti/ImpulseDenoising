function [D,Z] =  Dict_Learning (X, numOfAtoms, iterations)

[Q,R] = qr(X);
% size(Q)

D = Q(:,1:numOfAtoms);

for ii = 1:numOfAtoms
        D(:,ii) = D(:,ii)/norm(D(:,ii));
end

for i = 1:iterations
lambda = 0.1;
alpha = max(eig(D'*D))+.1;
itr = 10;

Z = ISTA(X,D,lambda,alpha,itr);

D = X*Z'*inv(Z*Z'+lambda*eye(size(Z*Z')));

for ii = 1:numOfAtoms
    
    D(:,ii) = D(:,ii)/norm(D(:,ii));
    
end

end
