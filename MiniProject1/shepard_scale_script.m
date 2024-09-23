%  Mini Project #1 Shephard scale
% code that plays a chord for each note in c major scale

% getting the timing vector
fs = 22050;
ts = 1/fs;
t = 0 : ts : (2-ts);

pauseVec = zeros(1,round(.25*fs));
audiovector = 0;

   for i = 0:11 %each note
       keynum = 40 + 1*i; %c4 and 3 octaves below
       h = -4:1:4; % inc octave
       %if (i ~= [1,3,6,8,10])
           freq = 440*2.^( ( ( ( keynum ) + ( 12.*h ) ) - 49 ) / 12 );
           fc = 500;
           A = FrequencyWeighting(fc,.75,freq);
          
           key = @(octave) keynum + 12.*(octave); % centered around 4 8ve, so - below 4 + above 4
           key1 = key2note(A(1),(key(-4)),1,fs);
           key2 = key2note(A(2),(key(-3)),1,fs);
           key3 = key2note(A(3),(key(-2)),1,fs);
           key4 = key2note(A(4),(key(-1)),1,fs);
           key5 = key2note(A(5),(key(0)),1,fs);
           key6 = key2note(A(6),(key(1)),1,fs);
           key7 = key2note(A(7),(key(2)),1,fs);
           key8 = key2note(A(8),(key(3)),1,fs);
           key9 = key2note(A(9),(key(4)),1,fs);
           Signal = key1 + key2 + key3 + key4 + key5 + key6 +  key7 +key8 + key9;
        
           audiovector = [audiovector pauseVec Signal];
       %end
   end
audiovector = [audiovector audiovector audiovector audiovector audiovector];

spectrogram(audiovector, hamming(2000), 1000, 2000, fs, 'yaxis');

ylim([0,4])

%  avoid clipping
audiovector = audiovector / (max(abs(audiovector)));

sound(audiovector,fs);

audiowrite("shepard_tone.wav", audiovector, fs);
      