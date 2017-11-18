% Implementing cross cancellation filter
% Refer to the Report for mathematical details

function [l,r]=loudspeaker(x,phi,theta,range,fs,dist,ang,D)
    
    % Binaural signals
    [l,r] = binaural_process(x,phi,theta,range,fs);
    
    
    del = fs / 334 * dist;
    g = D / (D + sin(ang * pi / 180)*del);
    d = 1.5 * sin(ang * pi / 180) * del;
    
    [H,~] = delay_and_headshadow(0,l,fs);
    if mod(length(H),2)==0
        H = horzcat(H(1:length(H)-1),H(length(H)),H(length(H)),H(length(H)),fliplr(H(1:length(H)-1)));
    else
        H = horzcat(H,fliplr(H));
    end
    
    H = g * H;
    k = 0:length(l)-1;
    H = H .* exp(-1i * 2 * pi / length(x) * d * k);
    l = l - real(ifft(fft(r,length(r)) .* H',length(l)));
    r = r - real(ifft(fft(l,length(l)) .* H',length(r)));
    
    l = comb(l,g,d,fs);
    r = comb(r,g,d,fs);
end