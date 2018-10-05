n = 8;
k = 5;
g = find_g_opt(n, k)
e8 = zeros(1, n);
e8(8) = 1;
[q, r] = deconv(fliplr(e8), fliplr(g));
sindrome8 = mod(fliplr(r), 2)
e7 = zeros(1, n);
e7(7) = 1;
[q, r] = deconv(fliplr(e7), fliplr(g));
sindrome7 = mod(fliplr(r), 2)

for i = 1:n
    sindrome7 = rotate_relative(sindrome7, g)
    if sindrome7 == sindrome8
        break;
    end
end