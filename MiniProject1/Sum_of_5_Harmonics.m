% Part 3.2 a of Mini Project #1
% This code plays the sum of C2, C3, C4, C5, C6
%
% getting the coefficients
fc = 440; % using A4 as the center frequency
h = 1:1:5; % identifying how many octaves we need
C = 440*2.^( ( ( ( 4 ) + ( 12.*h ) ) - 49 ) / 12 ); % generating the coeficients from C1
A = FrequencyWeighting(fc,1,C);


% getting the timing vector
fs = 8000;
ts = 1/fs;
t = 0 : ts : (2-ts);

% find the keynum of every C
key = @(octave) 40 + 12.*(octave); % centered around 4 8ve, so - below 4 + above 4

%convert to their Sinusoidal Signal 
key2 = key2note(A(1),(key(-2)),2,fs); % C2
key3 = key2note(A(2),(key(-1)),2,fs); %C3
key4 = key2note(A(3),(key(0)),2,fs); %C4
key5 = key2note(A(4),(key(1)),2,fs); %C5
key6 = key2note(A(5),(key(2)),2,fs); %C6

% Add each sine
Signal = key2 + key3 + key4 + key5 + key6;
sound(Signal,fs)

% Plot
spectrogram(Signal, hamming(2000), 1000, 2000, fs, 'yaxis');
ylim([0,1.5]);
title('Sum of 5 C Octaves');

% keyN = [key2, key3, key4, key5, key6];
CVal = {, 'C3', 'C4', 'C5', 'C6'};
% create labels
yline( .001*440*2.^((key(-2)-49)/12), "red", 'C2');
yline( .001*440*2.^((key(-1)-49)/12), "red", 'C3');
yline( .001*440*2.^((key(-0)-49)/12), "red", 'C4');
yline( .001*440*2.^((key(1)-49)/12), "red", 'C5');
yline( .001*440*2.^((key(2)-49)/12), "red", 'C6');




