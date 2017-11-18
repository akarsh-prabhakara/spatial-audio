function [l,r] = binaural_process(x,phi,theta,range,fs)
kp = 1;
ka = 0.5;

%Time delay and head shadow
[~,l] = delay_and_headshadow(theta,x,fs);
[~,r] = delay_and_headshadow(-theta,x,fs);

%Shoulder delay
Tsh = 1.2 * ((180 - theta) / 180) * ((1 - (0.00004 * ((phi - 80) * (180 / (180 + theta)))))^2);
Tsh = Tsh / 1000 * fs;
l1 = vertcat(zeros(round(Tsh),1),x);
r1 = vertcat(zeros(round(Tsh),1),x);
l = vertcat(l,zeros(length(l1) - length(l),1));
r = vertcat(r,zeros(length(r1) - length(r),1));
l = l + l1;
r = r + r1;


%pinna
Ak = [1 5 5 5 5];
Bk = [2 4 7 11 13];
Dk = [0.85 0.35 0.35 0.35 0.35];
Pk = [0.5 -1 0.5 -0.25 0.25];
Tk = [];

for i = 1:5
    Tk(i) = (Ak(i) * cos(theta * pi / 360) * sin(Dk(i) * (90 - phi) * pi / 180)) + Bk(i);
end   

Tk = round(Tk);
l = real(l);
r = real(r);

l1 = vertcat(zeros(Tk(1),1),l) * Pk(1);
l2 = vertcat(zeros(Tk(2),1),l) * Pk(2);
l3 = vertcat(zeros(Tk(3),1),l) * Pk(3);
l4 = vertcat(zeros(Tk(4),1),l) * Pk(4);
l5 = vertcat(zeros(Tk(5),1),l) * Pk(5);
lmax = max([length(l1),length(l2),length(l3),length(l4),length(l5)]);
l1 = vertcat(l1,zeros(lmax - length(l1),1));
l2 = vertcat(l2,zeros(lmax - length(l2),1));
l3 = vertcat(l3,zeros(lmax - length(l3),1));
l4 = vertcat(l4,zeros(lmax - length(l4),1));
l5 = vertcat(l5,zeros(lmax - length(l5),1));

r1 = vertcat(zeros(Tk(1),1),r) * Pk(1);
r2 = vertcat(zeros(Tk(2),1),r) * Pk(2);
r3 = vertcat(zeros(Tk(3),1),r) * Pk(3);
r4 = vertcat(zeros(Tk(4),1),r) * Pk(4);
r5 = vertcat(zeros(Tk(5),1),r) * Pk(5);
rmax = max([length(r1),length(r2),length(r3),length(r4),length(r5)]);
r1 = vertcat(r1,zeros(rmax - length(r1),1));
r2 = vertcat(r2,zeros(rmax - length(r2),1));
r3 = vertcat(r3,zeros(rmax - length(r3),1));
r4 = vertcat(r4,zeros(rmax - length(r4),1));
r5 = vertcat(r5,zeros(rmax - length(r5),1));

l = vertcat(l,zeros(lmax - length(l),1)) + l1 + l2 + l3 + l4 + l5;
r = vertcat(r,zeros(rmax - length(r),1)) + r1 + r2 + r3 + r4 + r5;


%room
x = vertcat(zeros(round(fs * 0.01),1),x);
l = real(l);
r = real(r);
l = vertcat(l,zeros(length(x) - length(l),1));
r = vertcat(r,zeros(length(x) - length(r),1));
l = l * 15;
r = r * 15;
x = x * 7;
l = l + x;
r = r + x;


%range
l = l / (range ) * ka;
r = r / (range ) * ka;

end