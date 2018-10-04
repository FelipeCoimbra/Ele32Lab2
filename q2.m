ns = [ 8, 10, 12, 14, 16];
ks = [ 5, 6, 7, 8, 9];

gs_otimos = {length(ns)};

numpares = length(ns);
for i = 1:numpares
   n = ns(i);
   k = ks(i);
   [str] = sprintf('Para n = %d e k = %d', n, k)
   g_otimo = find_g_opt(n,k)
   
   gs_otimos{length(gs_otimos)+1} = g_otimo;
end
