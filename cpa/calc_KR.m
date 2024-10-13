% Distributed as an artifact of ‘VITI: A Tiny Self-Calibrating Sensor for Power-Variation Measurement in FPGAs’
% Copyright (c) 2021 B. Udugama, D. Jayasinghe, H. Saadat, A. Ignjatovic and S. Parameswaran

clc;
clear all;
close all;

%K = [0x4a,                 0xd8,          0x52,        0x96,           0xe2,           0x40,           0x2a,         0x5b,         0xea,           0xb7,           0xee,         0xb2,           0x66,         0xb9,          0x42,        0xce];
K = [hex2dec('4a'), hex2dec('d8'), hex2dec('52'), hex2dec('96'), hex2dec('e2'), hex2dec('40'), hex2dec('2a'), hex2dec('5b'), hex2dec('ea'), hex2dec('b7'), hex2dec('ee'), hex2dec('b2'), hex2dec('66'), hex2dec('b9'), hex2dec('42'), hex2dec('ce')];
%K = K + 1;

experiments = ["\p1\2aes\waveTDC2022-6-21_22-23-29\", "", "", "", ""];
legend_e = ["P1 - 1000ROs", "", "", "", ""];
colors = [228 26 28; 55 126 184; 152 78 163; 255 127 0; 77 175 74; 166 86 400]/255;

K = K + 1;

bins = 256;


for experiment = 1:1  %:length(experiments)
min_a = zeros(1, 100);
max_a = zeros(1, 100);
for samples = 1000:1000:150000
%M = csvread(strcat(experiments(experiment), '/', num2str(samples) , '.txt'));
%M = csvread(strcat('multiAES\p1\2-aes\2022-6-12_21-7-31\final_kr_0\', num2str(samples) , '.txt'));
filename = (strcat('noise',experiments(experiment),'final_kr_0\', num2str(samples) , '.txt'))
M = csvread(filename);
sum_M = sum(M);
sum_M = repmat(sum_M,size(M,1),1);
M = M./sum_M;
M = log2(M);



[count1,centers] = hist(M(:,1), bins);
[count2,] = hist(M(:,2), centers);



H = conv(count1, count2);
for i = 3:16
[count,] = hist(M(:,i), centers);
H = conv (H, count);
end



b = zeros(1,bins);
for i = 1:16
[count,] = hist(M(K(i),i), centers);
b = b + count;
end
b = b .* [1:bins];
b = sum(b) - 15;



min_a(1, samples/1000) = sum(H(b+(16/2)+1:length(H)));
max_a(1, samples/1000) = sum(H(b-(16/2):length(H)));
end



max_a = log2(max_a + 1);
min_a = log2(min_a + 1);



x = 1:length(min_a);
x2 = [x, fliplr(x)];
inBetween = [max_a, fliplr(min_a)];
hold on;
h = fill(x2, inBetween, colors(experiment, :), 'EdgeColor', colors(experiment, :), 'LineStyle', 'none', 'HandleVisibility', 'off');
set(h,'facealpha',.5)
plot(max_a,'DisplayName',legend_e(experiment), 'LineWidth', 1.5, 'Color', colors(experiment, :))
plot(min_a, 'LineWidth', 1.5, 'Color', colors(experiment, :), 'HandleVisibility', 'off')
legend
end

