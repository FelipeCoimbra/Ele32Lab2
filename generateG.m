function [ G ] = generateG( g, n )
    k = n-length(g)+1;
    G = zeros(k, n);
    for i = 1:k
        G(i, i : n-k+i) = g;
    end
end

