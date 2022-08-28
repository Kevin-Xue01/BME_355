%% Section 1: Modelling
clear
clc

circulation_model = Circulation(75, 2, 0.06);

T = 5;
[time, state] = circulation_model.simulate(T);

%%% TASK 4
% Do the necessary calculation (if required based on Q (4th state)) and then generate the desired plots.

aortic_pressure = zeros([length(time) 1]);
for i=1:length(time)
    if state(i, 2) > state(i, 1)
        aortic_pressure(i) = state(i, 3);
    elseif state(i, 4) > 0 || state(i, 1) > state(i, 3)
        aortic_pressure(i) = state(i, 1) - state(i, 4)*circulation_model.R3;
    else 
        aortic_pressure(i) = state(i, 3);
    end
end

%%% Plotting
figure()
LineWidth = 1.5;
FontSize = 12;
% Your plotting code should be here

plot(time, state(:, 1), 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(time, state(:, 2), 'LineWidth', LineWidth, 'Color', 'b'), hold on
plot(time, state(:, 3), 'LineWidth', LineWidth, 'Color', 'g'), hold on
plot(time, aortic_pressure, 'LineWidth', LineWidth, 'Color', 'k'), hold off
title("Model Simulation - Atrial, Ventricular, Arterial, and Aortic Pressure")
legend('ventricular', 'atrial', 'arterial', 'aortic')
xlabel('Time (seconds)')
ylabel('Pressure (mmHg)')
set(gca, 'FontSize', FontSize)

%% Optimization (you dont need to change any code for this section)
clear
clc

% Loading the true Ventricular Pressure which we 
% need it to calculate the objective function for optimization
load VentricularPressure

% create random initial solution
w_int =  [randi([60 80],1,1); rand(2,1)]; % initial solution
options = optimoptions('simulannealbnd','PlotFcns',...
    {@saplotbestf,@saplotf}, ... 
    'FunctionTolerance', 5e-7, ...
    'MaxIterations', 500, ... % here you can change the maximum iteration
    'ReannealInterval', 25);
lb = [60 0.3 0.001]; % lower bound for solutions
ub = [80 4 0.1]; % upper bound for solutions
tic
[w, fval] = simulannealbnd(@(w) ObjectiveFunction(w, ventricularPressure, time), ...
    w_int, lb, ub, options);
toc

disp(['Objective Function Value = ' num2str(fval)])
disp(['Estimated HR = ' num2str(round(w(1)))])
disp(['Estimated E_{max} = ' num2str(w(2))])
disp(['Estimated E_{min} = ' num2str(w(3))])

%% Section 1.1: Verification - Numerical Errors
clear
clc

circulation_model = Circulation(75, 2, 0.06);

rel_tol = 1e-7;
abs_tol = 1e-9;
max_step = 9e-1;

T = 5;
[time, state] = circulation_model.simulate_verification_numerical_error(T, rel_tol, abs_tol, max_step);

%%% TASK 4
% Do the necessary calculation (if required based on Q (4th state)) and then generate the desired plots.

aortic_pressure = zeros([length(time) 1]);
for i=1:length(time)
    if state(i, 2) > state(i, 1)
        aortic_pressure(i) = state(i, 3);
    elseif state(i, 4) > 0 || state(i, 1) > state(i, 3)
        aortic_pressure(i) = state(i, 1) - state(i, 4)*circulation_model.R3;
    else 
        aortic_pressure(i) = state(i, 3);
    end
end

%%% Plotting
figure()
LineWidth = 1.5;
FontSize = 12;
% Your plotting code should be here

plot(time, state(:, 1), 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(time, state(:, 2), 'LineWidth', LineWidth, 'Color', 'b'), hold on
plot(time, state(:, 3), 'LineWidth', LineWidth, 'Color', 'g'), hold on
plot(time, aortic_pressure, 'LineWidth', LineWidth, 'Color', 'k'), hold off
title("Verification - Numerical Error - Experiment 4")
legend('ventricular', 'atrial', 'arterial', 'aortic')
xlabel('Time (seconds)')
ylabel('Pressure (mmHg)')
set(gca, 'FontSize', FontSize)

%% Section 1.2.1: Validation - Sanity Check - Initial Conditions
clear
clc
close all

circulation_model = Circulation(75, 2, 0.06);
atria_pressure_scale_factor = 10;

initialCondition = [0, atria_pressure_scale_factor*circulation_model.non_slack_blood_volume / circulation_model.C2, 0, 0];

T = 5;
[time, state] = circulation_model.simulate_validation_initial_condition(T, initialCondition);

aortic_pressure = zeros([length(time) 1]);
for i=1:length(time)
    if state(i, 2) > state(i, 1)
        aortic_pressure(i) = state(i, 3);
    elseif state(i, 4) > 0 || state(i, 1) > state(i, 3)
        aortic_pressure(i) = state(i, 1) - state(i, 4)*circulation_model.R3;
    else 
        aortic_pressure(i) = state(i, 3);
    end
end

%%% Plotting
figure()
LineWidth = 1.5;
FontSize = 12;

plot(time, state(:, 1), 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(time, state(:, 2), 'LineWidth', LineWidth, 'Color', 'b'), hold on
plot(time, state(:, 3), 'LineWidth', LineWidth, 'Color', 'g'), hold on
plot(time, aortic_pressure, 'LineWidth', LineWidth, 'Color', 'k'), hold off
title("Validation - Sanity Check - High Initial Pressure")
legend('ventricular', 'atrial', 'arterial', 'aortic')
xlabel('Time (seconds)')
ylabel('Pressure (mmHg)')
set(gca, 'FontSize', FontSize)



