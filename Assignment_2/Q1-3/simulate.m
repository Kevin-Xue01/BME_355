function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)

% Input Parameters
% T: simulation time (seconds)
% f0M: maximum isometric force
% resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
% resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1

muscle_tendon_length = resting_length_muscle + resting_length_tendon;

%%% TASK 1
muscle = HillTypeMuscle(f0M, resting_length_muscle, resting_length_tendon);
%%% TASK 2
function [current_velocity] = get_current_velocity(current_time, normalized_muscle_length)
    a = 1;
    if current_time < 0.5
        a = 0;
    end
    current_velocity = get_velocity(a, normalized_muscle_length, muscle.norm_tendon_length(muscle_tendon_length, normalized_muscle_length));
end

%%% TASK 3
% the outputs of ode45 must be named "time" and "norm_lm"
opts = odeset('RelTol',RelTol,'AbsTol',AbsTol);
[time, norm_lm] = ode45(@get_current_velocity, [0 2], 1, opts);

%%% TASK 4
% save the estimated forces in a vector called "forces"
forces_size = size(norm_lm);
forces = zeros(forces_size);
for i=1:forces_size(1)
    forces(i) = muscle.get_force(muscle_tendon_length, norm_lm(i));
end

% Do not alter the rest (it should not be needed)
norm_lm = norm_lm * resting_length_muscle;

% Plot results
figure()
LineWidth = 1.5;
FontSize = 12;

subplot(2,1,1)
plot(time, norm_lm, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('Normalized CE Length (m)')
set(gca,'FontSize', FontSize)

subplot(2,1,2)
plot(time, forces, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('CE Tension (N)')
set(gca,'FontSize', FontSize)
end