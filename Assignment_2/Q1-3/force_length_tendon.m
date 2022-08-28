function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TAKS 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% Output
% normalized tension produced by tendon

% WRITE YOUR CODE HERE
slack_length_of_SE = 1;
input_is_scalar = true;
[input_row_size, input_col_size] = size(lt);
if input_row_size > 1 || input_col_size > 1
    input_is_scalar = false;
end
if input_is_scalar
    if lt >= slack_length_of_SE
        normalize_tendon_tension = 10.*(lt-slack_length_of_SE)+240.*(lt-slack_length_of_SE)^2;
    else
        normalize_tendon_tension = 0;
    end

else
    normalize_tendon_tension = zeros(size(lt));
    if input_row_size < input_col_size
        lt = lt';
    end
    for i=1:size(lt, 1)
        if lt(i) >= slack_length_of_SE
            normalize_tendon_tension(i) = 10.*(lt(i)-slack_length_of_SE)+240.*(lt(i)-slack_length_of_SE)^2;
        else
            normalize_tendon_tension(i) = 0;
        end
    end
end
end