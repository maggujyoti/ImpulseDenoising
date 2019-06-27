function y  = ISTA(A,T,lambda,alpha,itr)

%%% J(x) = ||A-Tx||2 + lambda*||x||1

% L1-regularized signal restoration using the iterated soft-thresholding algorithm (ISTA)
%J = zeros(1, itr);       % Objective function
           

y = zeros(size(T,2),size(A,2));              % Initialize x
thres = lambda/(2*alpha);
for k = 1:itr
    for i= 1: size(y,2)
         Tx = T*y(:,i);
         %J(k) = sum(abs(Hx(:)-y(:)).^2) + lambda*sum(abs(x(:)));

          y(:,i) = wthresh(y(:,i) + (T'*(A(:,i) - T*y(:,i)))/alpha,'s',thres);
    end           
end


end