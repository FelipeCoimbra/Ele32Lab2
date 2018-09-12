ns = [ 9, 11, 12, 14, 16];
ks = [ 5, 6, 7, 8, 9];

numpares = length(ns);
maiordistmin = -1;
n_otimo = 0;
k_otimo = 0;
for i = 1:numpares
   n = ns(i);
   k = ks(i);
   geradores = cyclpoly(n,k,'all');
   menordist = inf;
   qtdcodigos = size(geradores,1)
   for j = 1:qtdcodigos-1
       for k = j+1:qtdcodigos
           dist = distancia(geradores(j), geradores(k));
           if dist < menordist
               menordist = dist;
           end
       end
   end
   
   if menordist > maiordistmin
        maiordistmin = menordist;
        n_otimo = n;
        k_otimo = k;
   end
end

n_otimo
k_otimo
