% C major scale
% Mini project #1 part 4.a

%
keynum = 40; %c4 or just 3 ocataves below
h = -4:1:4; % 8ves
fs = 22050;
ts = 1/fs;
t = 0 : ts : (2-ts);

key = @(octave) 40 + 12.*(octave); % centered around 4 8ve, so - below 4 + above 4
key1 = key2note(1,key(-4),2,fs);
key2 = key2note(1,key(-3),2,fs);
key3 = key2note(1,key(-2),2,fs);
key4 = key2note(1,key(-1),2,fs);
key5 = key2note(1,key(0),2,fs);
key6 = key2note(1,key(1),2,fs);
key7 = key2note(1,key(2),2,fs);
key8 = key2note(1,key(3),2,fs);
key9 = key2note(1,key(4),2,fs);

Signal = key1 + key2 + key3 + key4 + key5 + key6 +  key7 +key8;

% Avoid Clipping
Signal = Signal / (max(abs(Signal)));
          
soundsc(Signal,fs)
      

