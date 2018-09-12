function [ plvrs_info ] = gen_plvrs_info( n )
    plvrs_info = [];
    if n == 0 
        return;
    end
    
    rec_plvrs_info = gen_plvrs_info(n-1);
    plvrs_info = [zeros(2^(n-1),1), rec_plvrs_info; ones(2^(n-1),1), rec_plvrs_info];
end

