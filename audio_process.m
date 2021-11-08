function [data] = audio_process(x, vectorSize)
    FS = 16000;
    WINDOW = 0.02;
    FRAME_LENGTH = FS * WINDOW;
    num_samples = length(x);
    num_frames = floor(num_samples / FRAME_LENGTH);
    %N = 10;
    for i=1:num_frames
       first_sample = i * FRAME_LENGTH - FRAME_LENGTH + 1;
       last_sample = i * FRAME_LENGTH;
       shortFrame = x(first_sample:last_sample);
       [magSpec, ~] = magAndPhase(shortFrame);
       featureVector = linearRectangularFilterbank(magSpec, vectorSize);
       data(i,:) = featureVector;
    end
    
end