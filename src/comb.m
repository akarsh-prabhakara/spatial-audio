function out = comb(x,g,d,fs)
    %H
    [H,~] = delay_and_headshadow(0,x,fs);
    if mod(length(H),2)==0
        H = horzcat(H(1),H(1:length(H)-1),H(length(H)),H(length(H)),fliplr(H(1:length(H)-1)));
    else
        H = horzcat(H,fliplr(H));
    end
    
    %comb
    H = g * g * (H .* H);
    k = 0:length(H)-1;
    H = H .* exp(-1i * 2 * pi / length(x) * k * round(d) * 2);
    H = 1 - H;
    H = 1 ./ H;
    X = fft(x,length(x));
    out = real(ifft(H' .* X,length(H)));
end