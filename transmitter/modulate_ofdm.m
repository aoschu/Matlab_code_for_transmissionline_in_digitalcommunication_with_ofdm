function [z] = modulate_ofdm(D, fft_size, cp_size, switch_graph)

D_ifft = sqrt(fft_size) * ifft(D, fft_size, 1);    % IFFT operation of OFDM symbols

cyclic_prefix = D_ifft(fft_size - cp_size + 1 : fft_size, :); %considering last 64 subcarriers of OFDM Symbol as cyclic prefix
D_ifft_cp = [cyclic_prefix; D_ifft];    % Insertion of cyclic prefix

z = reshape(D_ifft_cp, numel(D_ifft_cp), 1);

if switch_graph == 1
    
    figure('name','One OFDM Symbol in Time Domain')
    plot(abs(z(fft_size + cp_size + 1 : 2 * (fft_size + cp_size))),'b')
    title('One OFDM Symbol in Time Domain')
    xlabel('Time')
    ylabel('Amplitude')
    
    figure('name','One OFDM Symbol in Frequency Domain')
    plot(abs(D( : , 2)),'b')
    xlabel('Subcarrier')
    ylabel('|H|')
    title('One OFDM Symbol in Frequency Domain')
    
end

end