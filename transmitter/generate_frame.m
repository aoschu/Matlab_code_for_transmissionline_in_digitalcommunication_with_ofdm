function [b] = generate_frame(frame_size, switch_graph)

b = rand(frame_size, 1) > 0.5; % Generating a column vector which has (frame_size) rows containing only 1's and 0's;

% Frame size depends on fft_size,N_blocks,constellation_order and hamming code

if switch_graph == 1
    
    figure('name', 'Binary Pattern of Digital Source')
    stem(b)
    title('Binary Pattern of Digital Source')
    
end

end