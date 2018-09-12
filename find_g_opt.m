function [ g_otimo ] = find_g_opt(n,k)
   plvrs_info = gen_plvrs_info(k);
   maiordistmin = -1;
   g_otimo = [];
   
   geradores = cyclpoly(n,k,'all');
   qtdcodigos = size(geradores,1);
   
   for j = 1:qtdcodigos
       g = geradores(j,:);
       G = generateG(g,n);
       plvrs_cod = mod(plvrs_info * G,2);
       
       menordist = inf;
       pesos = sum(plvrs_cod,2);
       for idx = 1:length(pesos)
        if pesos(idx) < menordist && pesos(idx) > 0
            menordist = pesos(idx);
        end
       
        if menordist > maiordistmin
           maiordistmin = menordist;
           g_otimo = g;
        end
       end
   end
end

