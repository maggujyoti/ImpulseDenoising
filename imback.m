function xrecon = imback (x)

% [m,n]= size(256,256);
m = 256;
n = 256;
blklen = 8;
numBlk = m/blklen;
xrecon = zeros(m,n);
k = 1;

for i = 0: numBlk-1
    
    for j = 0: numBlk-1
        
        xrecon(i*blklen+1 : (i+1)*blklen, j*blklen+1 : (j+1)*blklen) = reshape(x(:,k),8,8);
        k = k+1;
        
    end
    
end

end