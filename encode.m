function [v] = encode(u,g)
%   Encodes an information word u using a generator g
%       u : Matrix with each row being an information word of size K
%       g : Generator polynomial
%   v : Matrix with each row being an encoded Word of size N
%

    polyu = fliplr(u);  % Conversão para a forma polinomial
    polyg = fliplr(g);

    v = mod(conv(polyu, polyg), 2); % Codificação
    v = fliplr(v);
end

