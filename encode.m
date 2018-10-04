function [v] = encode(u,g)
%   Encodes an information word u using a generator g
%       u : Information Word of size K
%       g : Generator vector
%   v : Encoded Word of size N
    polyu = fliplr(u);
    polyg = fliplr(g);
    v = mod(conv(polyu, polyg), 2);
    v = fliplr(v);
end

