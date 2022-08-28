function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TAKS 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% Output
% normalized tension produced by tendon

% WRITE YOUR CODE HERE
slack_length_of_SE = 1;

if lt >= slack_length_of_SE
    normalize_tendon_tension = 10.*(lt-slack_length_of_SE)+240.*(lt-slack_length_of_SE)^2;
else
    normalize_tendon_tension = 0;
end

end