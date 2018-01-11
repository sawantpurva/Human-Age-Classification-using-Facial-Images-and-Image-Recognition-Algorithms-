function w = cplx(x, J, Faf, af)

% complex dual-tree 2D DWT
%
 %w = cplxdual2D(x, J, Faf, af)
% x: 2-D signal
% J: number of stages
% Faf{i}: first stage filters for tree i
% af{i}:  filters for remaining stages on tree i
%
% Faf{i}(:,1), af{i}(:,1):   lowpass filter
% Faf{i}(:,2), af{i}(:, 2):  highpass filter 
%
% w: wavelet coefficients
%  w{1..J}{part}{d1}{d2}: 
%    scale = 1...J
%      part = 1 (real part), or part = 2 (imag part)
%      d1 = 1,2; d2 = 1,2,3 (orientations)
%  w{J+1}{m}{n}:
%      m = 1,2; n = 1,2 (lowpass subbands)
%      
% % Example:
% x = rand(256);
% J = 5;
% [Faf, Fsf] = FSfarras;
% [af, sf] = dualfilt1;
% w = cplxdual2D(x, J, Faf, af);
% y = icplxdual2D(w, J, Fsf, sf);
% err = x - y; max(max(abs(err)))
J=1;


for m = 1:2
    for n = 1:2
        [lo w{1}{m}{n}] = afb2D(x, Faf{m}, Faf{n});
        for j = 1:J
            [lo w{j}{m}{n}] = afb2D(lo, af{m}, af{n});
        end
        w{J+1}{m}{n} = lo;
    end
end

for j = 1:J
    for m = 1:3
        [w{j}{1}{1}{m} w{j}{2}{2}{m}] = pm(w{j}{1}{1}{m},w{j}{2}{2}{m});
        [w{j}{1}{2}{m} w{j}{2}{1}{m}] = pm(w{j}{1}{2}{m},w{j}{2}{1}{m});
    end
end