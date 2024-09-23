function output = FrequencyWeighting(fc, sig, ff)
output = exp(-(log2(ff) - log2(fc) ).^2/(2*sig^2));
end

