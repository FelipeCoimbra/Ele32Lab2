function [ rotated ] = rotate_relative( s, g )
%     Rotate vector s relative to vector g

n = length(s);
k = n-length(g)+1;
rotated = s;
rotated = circshift(rotated, 1);
if s(n) == 1
    rotated(1) = 0;
    rotated = rotated + [g(1:n-k) zeros(1,k)];
    rotated = mod(rotated,2);
end

end

