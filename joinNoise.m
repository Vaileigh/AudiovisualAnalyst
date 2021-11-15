function [mixture] = joinNoise (noise, speech)
    while length(noise) < length(speech)
        noise = [noise;noise]
    end
    if length(noise) ~= length(speech)
        noise = noise(1: length(speech))
    end
    
    mixture = speech + noise
end