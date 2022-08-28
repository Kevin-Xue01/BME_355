function [normalize_PE_force] = force_length_parallel(lm)
%%%% TAKS 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% Output
% normalized force produced by parallel elastic element

% WRITE YOUR CODE HERE
slack_length_of_PE = 1;
input_is_scalar = true;
[input_row_size, input_col_size] = size(lm);
if input_row_size > 1 || input_col_size > 1
    input_is_scalar = false;
end
if input_is_scalar
    if lm >= slack_length_of_PE
        normalize_PE_force = 3*(lm-slack_length_of_PE)^2/(0.6+lm-slack_length_of_PE);
    else
        normalize_PE_force = 0;
    end

else
    normalize_PE_force = zeros(size(lm));
    if input_row_size < input_col_size
        lm = lm';
    end
    for i=1:size(lm, 1)
        if lm(i) >= slack_length_of_PE
            normalize_PE_force(i) = 3*(lm(i)-slack_length_of_PE)^2/(0.6+lm(i)-slack_length_of_PE);
        else
            normalize_PE_force(i) = 0;
        end
    end
end
end