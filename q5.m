%% Setup
%
ns = [ 7, 8, 10, 12, 14, 16];
ks = [ 4, 5, 6, 7, 8, 9];

numpares = length(ns);
ps = sort(gen_ps(1e-4), 'descend');
qtd_tests = 500000;

hold all;
grid on;
legends = {};

%% Cyclic codification correction analysis
%
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
       decoded = decode(noisy_code_words, g_otimo);
       
       decoded = decoded ~= zeros(qtd_tests,n);
       error = sum(decoded,2);
       error = error ~= 0;
       error_rate = sum(error)/length(error);
       erros(j) = error_rate;
   end
   
   loglog(ps, erros);
end

%% No correction analysis
%
no_codification_errors = zeros(length(ps));
for j = 1:length(ps)
       p = ps(j);
       noisy_code_words = gen_noisy_code_words(p, n, qtd_tests);
       
       error = sum(noisy_code_words,2);
       error = error ~= 0;
       error_rate = sum(error)/length(error);
       no_codification_errors(j) = error_rate;
end
loglog(ps, no_codification_errors);

%% Plot settings 
%
legends{numpares+1} = 'Nao codificado';
legend(legends);
set(gca,'Xdir','reverse')
title("Desempenho da Codificação Cíclica para vários pares (n,k)");
xlabel("Probabilidade de erro de canal");
ylabel("Taxa de erro de transmissão");
