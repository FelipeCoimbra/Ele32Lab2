ns = [ 8, 10, 12, 14, 16];
ks = [ 5, 6, 7, 8, 9];

numpares = length(ns);
ps = gen_ps(1e-6);
qtd_tests = 10000;

hold on;
legends = {};
for i = 1:numpares
   n = ns(i);
   k = ks(i);
   [str] = sprintf('n = %d e k = %d', n, k)
   legends{i} = str;
   [g_otimo, dist_min] = find_g_opt(n,k);
   
   erros = zeros(size(ps));
   for j = 1:length(ps)
       p = ps(j)
       noisy_code_words = gen_noisy_code_words(p, n, qtd_tests);
       decoded = decode(noisy_code_words, g);
       
       decoded = decoded ~= zeros(qtd_tests,n);
       error = sum(decoded,2);
       error = error ~= 0;
       error_rate = sum(error)/length(error);
       erros(j) = error_rate;
   end
   
   plot(log10(ps), erros);
end

legend(legends);