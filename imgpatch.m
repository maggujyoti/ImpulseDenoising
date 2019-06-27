function xpv = imgpatch(x)

[m,n] = size(x);
blklen = 8;
numBlk = m/blklen;
xpv = [];

for i = 0: numBlk-1
    
    for j = 0: numBlk-1
        xp = x(i*blklen+1 : (i+1)*blklen, j*blklen+1 : (j+1)*blklen);
        xpv = [xpv xp(:)];
    end
    
end

end