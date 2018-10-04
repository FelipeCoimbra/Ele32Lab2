ns = [ 8, 10, 12, 14, 16];
ks = [ 5, 6, 7, 8, 9];

numpares = length(ns);
for i = 1:numpares
   n = ns(i);
   k = ks(i);
   [str] = sprintf('Para n = %d e k = %d', n, k)
   [g_otimo, dist_min] = find_g_opt(n,k);
   
   
end
