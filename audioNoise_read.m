function [] = audioNoise_read (fileLoc, fileName, targetLoc, N, vectorSize)
%vectorSize = audio_read("speechTest", "testsample", "mfccsTest", 10);
%vectorSize = audio_read("speech", "speech", "mfccsTrain", 20);
    %vectorSize = 10;
    for i = 1 : N
        if i < 10
            speech(i, :) = fileName+"0"+i;
        else
            speech(i, :) = fileName+i;
        end
    end
    for i = 1 : N
        [x, FS] = audioread(fileLoc+"/"+speech(i)+".wav");
        [d, FS] = audioread("noise.wav");
        mixture = joinNoise(d, x);
        data = audio_process (mixture, vectorSize);
        writeHTK(data, speech(i), targetLoc);
    end
end
