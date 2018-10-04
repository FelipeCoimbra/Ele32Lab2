ns = [ 8, 10, 12, 14, 16]
ks = [ 5, 6, 7, 8, 9]

geradores = {};

for i = 1: length(ns)
    n = ns(i);
    k = ks(i);
    
    geradores{length(geradores)+1} = cyclpoly(n,k,'all');
end

geradores