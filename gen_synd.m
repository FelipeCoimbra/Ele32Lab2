function [ synd ] = gen_synd(v_rec, g)
%   Generates syndrome of received information word according to generation
%   function g

polyv_rec = fliplr(v_rec);
polyg = fliplr(g);
synd = zeros(size(v_rec));

for i = 1:size(v_rec,1)
    [q, synd(i,:)] = deconv(polyv_rec(i,:), polyg);
    synd(i,:) = mod(fliplr(synd(i,:)), 2);
end

end

