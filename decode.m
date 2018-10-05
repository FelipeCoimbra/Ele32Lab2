function [ u ] = decode( v_rec, g )
%   Decodes v_rec according to the generation function g
%
%   v_rec   :     Matrix with each row being a received code word to decode
%   g       :     Generator Polynomial of the cyclic code
%   
%   u       :     Matrix with each row being a decoded information word

%%  Setup
%

n = size(v_rec, 2);
k = n - length(g) + 1;

no_err = zeros(1,n); % No error = vector of zeros

err = no_err;
err(1) = 1;  % One unique error at first position

synd_err = gen_synd(err, g);    % Syndrome of our reference error for the given g (cyclic code)

synd = gen_synd(v_rec, g);      % Syndromes of all code words
n_rotations = 0;                % Number of rotations made on decoding a given word 

%%  Error identification and correction
%
for i = 1:size(synd,1)
    n_rotations = 0;            % Reset number of rotations
    if synd(i,:) ~= no_err      % Check if there is an error on received word
        while synd(i,:) ~= synd_err     % While the error is not on the first position
            synd = rotate_relative(synd(i,:), g);   % Rotate syndrome
            n_rotations = mod(n_rotations + 1, n);  
            if n_rotations == 0     % n rotations leads the word back to initial settings
               break
            end
        end
        if synd(i,:) == synd_err
           v_rec(n_rotations+1) = mod(v_rec(n_rotations+1)+1,2);  % Correct error  of word
        end
    end
end

%%  Decoding of the code word
% Polynomial form of codes
polyv = fliplr(v_rec);
polyg = fliplr(g);

u = zeros(size(v_rec));

for i = 1:size(v_rec,1)
    [q,u(i,:)] = deconv(polyv(i,:), polyg); % Calculate each information word
end

u = mod(fliplr(u), 2); 

end