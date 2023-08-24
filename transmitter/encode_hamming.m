function [c] = encode_hamming(b, parity_check_matrix, n_zero_padded_bits, switch_off)

%parity_check_matrix = [1 1 1 0 1 0 0; 1 1 0 1 0 1 0; 1 0 1 1 0 0 1]; % considered parity check matrix for (7,4) hamming code

generator_matrix = [eye(4),(parity_check_matrix(1:3,1:4))']; % Generator matrix(4*7)is constructed from transpose of parity check matrix (3*7)& identity matrix

if switch_off == 1 %When channel coding is not used.

     c = [b; zeros(n_zero_padded_bits, 1)]; % padding b vector with zeros so that modulation block gets required number of bits
    
else %When channel coding is used.
 
    c_without_padding= zeros((length(b)*7)/4,1); % generating a column vector containing only 0's (dimension according to hamming code)
    j=1;
    
    for i = 1 : 4 : length(b)
        b_temporary=b(i:i+3);
        codeword_temporary_without_normalization = b_temporary' * generator_matrix; % codewords are generated from binary signals and generator matrix
        codeword_temporary=mod(codeword_temporary_without_normalization,2); % Codewords are normalized so that only 1's and 0's remain
        c_without_padding(j:j+6)= (codeword_temporary(1:7))'; % generated codewords are stored 
        j=j+7;
        
    end
    
    c = [c_without_padding; zeros(n_zero_padded_bits, 1)];    
end

end