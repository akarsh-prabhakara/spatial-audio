function [play_l,play_r] = playback(x,fs,k)

% Default par
ang = 30;
D = 0.4;
dist = 0.15;

% Output arrays
play_l = [];
play_r = [];

N = 5000;

% For sweeps
azimuth = linspace(-90,90,floor(length(x)/N));
range = linspace(10,1,floor(length(x)/N));
elevation = linspace(-90,90,floor(length(x)/N));

for i = 1:floor(length(x)/N)
    
    if i < floor(length(x) / N)
        if k == 1 
            [l,r] = binaural_process(x((i-1)*N + 1:i*N),0,azimuth(i),1,fs);
        elseif k == 2
            [l,r] = binaural_process(x((i-1)*N + 1:i*N),elevation(i),0,1,fs);    
        elseif k == 3
            [l,r] = binaural_process(x((i-1)*N + 1:i*N),0,0,range(i),fs);
        elseif k == 4
            [l,r] = loudspeaker(x((i-1)*N + 1:i*N),0,azimuth(i),1,fs,dist,ang,D);
        elseif k == 5
            [l,r] = loudspeaker(x((i-1)*N + 1:i*N),elevation(i),0,1,fs,dist,ang,D);
        elseif k == 6
            [l,r] = loudspeaker(x((i-1)*N + 1:i*N),0,0,range(i),fs,dist,ang,D);
        end
    else
        if k == 1 
            [l,r] = binaural_process(x((i-1)*N + 1:end),0,azimuth(i),1,fs);    
        elseif k == 2
            [l,r] = binaural_process(x((i-1)*N + 1:i*N),elevation(i),0,1,fs); 
        elseif k == 3
            [l,r] = binaural_process(x((i-1)*N + 1:i*N),0,0,range(i),fs);  
        elseif k == 4
            [l,r] = loudspeaker(x((i-1)*N + 1:end),0,azimuth(i),1,fs,dist,ang,D);
        elseif k == 5
            [l,r] = loudspeaker(x((i-1)*N + 1:end),elevation(i),0,1,fs,dist,ang,D);
        elseif k == 6
            [l,r] = loudspeaker(x((i-1)*N + 1:end),0,0,range(i),fs,dist,ang,D);
        end
    end
    
    play_l = vertcat(play_l,l);
    play_r = vertcat(play_r,r);
end
%soundsc(horzcat(play_l,play_r),fs)
end