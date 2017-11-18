function [W,y] = delay_and_headshadow(theta,x,Fs)

theta = theta + 90;
alfa_min = 0.05;
theta0 = 150;
c = 334;
a = 0.08;
w0 = c / a;
alfa = 1 + alfa_min/2 + (1 - alfa_min/2) * cos(theta/theta0 * pi);
B = [(alfa+w0/Fs)/(1+w0/Fs),(-alfa+w0/Fs)/(1+w0/Fs)];
A = [1,-(1-w0/Fs)/(1+w0/Fs)];
if abs(theta) < 90
    gdelay = -Fs / w0 * (cos(theta * pi / 180) - 1);
else
    gdelay = Fs/w0*((abs(theta)-90)*pi/180 + 1);
end;
a = (1 - gdelay)/(1 + gdelay);
out_mgn = filter(B,A,x);
y = filter([a,1],[1,a],out_mgn);
W = freqz([B(1)*a,(B(1)+a*B(2)),B(2)],[1,(A(2)+a),A(2)*a],linspace(0,pi,length(y)/2));
end
    