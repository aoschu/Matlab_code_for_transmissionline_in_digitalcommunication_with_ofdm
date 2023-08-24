function [D] = insert_pilots(d, fft_size, N_blocks, pilot_symbol)

d_reshaped = reshape(d, fft_size, N_blocks); % converting modulated symbols (d vector) according to FFT dimension and N_blocks

D = [pilot_symbol, d_reshaped];     % Inserting pilot symbols with d_reshaped for channel estimation and equalization at the receiver

end