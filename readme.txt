[y,Fs] = audioread('speech01.wav');
audio_process(y);
writeHTK(data, "speech01");
