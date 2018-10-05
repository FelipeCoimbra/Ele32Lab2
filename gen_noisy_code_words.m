function [ noisy_code_words ] = gen_noisy_code_words( p, n, num_tests )

    noisy_code_words = rand(num_tests, n) < p;

end

