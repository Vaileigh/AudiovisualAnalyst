function [] = audio_read ()
    for i = 1 : 20
        if i < 10
            speech(i, :) = "speech0"+i;
        else
            speech(i, :) = "speech"+i;
        end
    end
    for i = 1 : 20
        [x, FS] = audioread("speech/"+speech(i)+".wav");
        data = audio_process (x);
        writeHTK(data, speech(i));
    end
end
