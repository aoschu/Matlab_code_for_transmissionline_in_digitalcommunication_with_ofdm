function [z_tilde] = filter_rx(s_tilde, downsampling_factor, switch_graph, switch_off)

if switch_off == 0
        
    rx_filter = 1 / sqrt(downsampling_factor) * transpose(rcosdesign(0.25,12,20));
    filtered_output = conv(s_tilde, rx_filter);
    %convolution will generate a matrix which has(length(s_tilde)+length(rx_filter)-1)rows and 1 column
    
    samples = filtered_output(length(rx_filter) :1: end - length(rx_filter) - 1);
    z_tilde_filtered = downsample(samples,downsampling_factor); % Downsampling by dsf_filter factor
    
    
    normalization_value = sqrt(mean(abs(z_tilde_filtered).^2));
    z_tilde = z_tilde_filtered / normalization_value; % Signal power is normalized to 1

    
    if switch_graph == 1
               
        figure('Name', 'Receiver Filter Output')
        subplot(2,1,1)
        plot(real(z_tilde),'b')
        grid on
        title('Output of Rx Filter')
        xlabel('Time')
        ylabel('Amplitude')
        legend ('Real Portion')
        subplot(2,1,2)
        plot(imag(z_tilde),'y')
        grid on
        xlabel('Time')
        ylabel('Amplitude')
        legend ('Imaginary Portion')
        
    end
    
else
    
    z_tilde = s_tilde;
    
end

end