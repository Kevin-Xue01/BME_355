function [normalize_PE_force] = force_length_parallel(lm)
%%%% TAKS 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% Output
% normalized force produced by parallel elastic element

% WRITE YOUR CODE HERE
slack_length_of_PE = 1;

if lm >= slack_length_of_PE
    normalize_PE_force = 3.*(lm-slack_length_of_PE)^2/(0.6+lm-slack_length_of_PE);
else
    normalize_PE_force = 0;
end

end