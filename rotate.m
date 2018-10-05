function [ rotated ] = rotate( v )
    % Rotaciona o vetor v da maneira usual
    n = length(v);
    rotated = zeros(1,n);
    rotated(1) = v(n);
    rotated(2:n) = v(1:n-1);
end

