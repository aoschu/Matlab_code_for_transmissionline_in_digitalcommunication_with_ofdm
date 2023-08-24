function [x] = impair_tx_hardware(s, clipping_threshold_tx, switch_graph)

magnitude_ = abs(s);
angle_ = angle(s);

for j=1:length(magnitude_)
    
    if magnitude_(j)>=clipping_threshold_tx
        magnitude_(j)=clipping_threshold_tx; %values equal or greater than clipping_threshold_tx is set to clipping_threshold_tx
    else
        magnitude_(j)= magnitude_(j); %values less than clipping_threshold_tx remains unchanged
    end
end

[a, b] = pol2cart(angle_,magnitude_);% calculating real part and imaginary part
x = a + b * 1i; %  Transformation from polar to cartesian

if switch_graph == 1
    
    figure('name','Input and Output of Tx Hardware')
    subplot(2, 1, 1)
    plot(abs(s),'r')
    title('Input of Tx Hardware')
    xlabel('Time')
    ylabel('Magnitude')
    grid on
    subplot(2, 1, 2)
    plot(abs(x),'r')
    grid on
    title('Output of Tx Hardware')
    xlabel('Time')
    ylabel('Magnitude')
    
end

end