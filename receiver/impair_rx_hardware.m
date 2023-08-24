function [s_tilde] = impair_rx_hardware(y, clipping_threshold_rx, switch_graph)

magnitude_ = abs(y);
angle_ = angle(y);

for j=1:length(magnitude_)
    
    if magnitude_(j)>=clipping_threshold_rx
        magnitude_(j)=clipping_threshold_rx; %values equal or greater than clipping_threshold_rx is set to clipping_threshold_rx
    else
        magnitude_(j)= magnitude_(j); %values less than rxthresh remains unchanged
    end
end

[a, b] = pol2cart(angle_, magnitude_); % calculating real part and imaginary part
s_tilde = a + b * 1i; % Polar to cartesian transformation


if switch_graph == 1
    
    figure('name','Input and Output of Rx Hardware')
    subplot(2,1,1)
    plot(abs(y),'r')
    title('Input Signal of Rx Hardware')
    xlabel('Time')
    ylabel('Magnitude')
    grid on
    subplot(2,1,2)
    plot(abs(s_tilde),'r')
    grid on
    title('Output Signal of Rx Hardware')
    xlabel('Time')
    ylabel('Magnitude')
    
end

end