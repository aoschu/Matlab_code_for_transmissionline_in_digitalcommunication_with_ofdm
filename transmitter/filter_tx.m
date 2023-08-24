function [s] = filter_tx(z, oversampling_factor, switch_graph, switch_off)

if switch_off == 0
    
    %z_upsampled = zeros(length(z) * oversampling_factor, 1);
    %z_upsampled(1: oversampling_factor : end) = z; 
    
    z_upsampled = upsample(z,oversampling_factor); % Upsampling by oversampling factor
    
    tx_filter = sqrt(oversampling_factor) * rcosdesign(0.25,12,20); % designing raised cosine filter
    s_filtered = conv(z_upsampled, tx_filter); %convolution will generate a matrix which has(length(d_upsampled)+length(tx_filter)-1)rows and 1 column
    
    normalization_value = sqrt(max(abs(s_filtered).^2));
    
    s = s_filtered / normalization_value;    % Filter output signal power is normalized to 1
    
    if switch_graph == 1
        
        fvtool(tx_filter,"impulse")
        fvtool(tx_filter)
        figure('Name', 'Transmitter Filter Output')
        subplot(2,1,1)
        plot(real(s),'b')
        grid on
        title('Tx Filter Output')
        xlabel('Time')
        ylabel('Amplitude')
        legend ('Real Portion')
        subplot(2,1,2)
        plot(imag(s),'y')
        grid on
        xlabel('Time')
        ylabel('Amplitude')
        legend ('Imaginary Portion')
        
    end
    
else
    
    s = z;
    
end

end