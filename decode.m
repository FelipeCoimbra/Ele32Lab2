function [ u ] = decode( v_rec, g )
%   Decodes v_rec according to the generation function g
%   
n = size(v_rec, 2);
k = n - length(g) + 1;

no_err = zeros(1,n);
err = no_err;
err(1) = 1;
synd_err = gen_synd(err, g);

synd = gen_synd(v_rec, g);
n_rotations = 0;
u = zeros(size(v_rec));
for i = 1:size(synd,1)
    if synd(i,:) ~= no_err
        while synd(i,:) ~= synd_err
            synd = rotate_relative(synd(i,:), g);
            n_rotations = mod(n_rotations + 1, n);
            if n_rotations == 0
               break
            end
        end
        if synd(i,:) == synd_err
           v_rec(n_rotations+1) = mod(v_rec(n_rotations+1)+1,2);
        end
    end
end


polyv = fliplr(v_rec);
polyg = fliplr(g);

for i = 1:size(v_rec,1)
    [alynne,u(i,:)] = deconv(polyv(i,:), polyg);
end

u = mod(fliplr(u), 2);

end