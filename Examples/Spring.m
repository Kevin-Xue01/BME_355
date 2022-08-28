%%% System Response Using Numerical Integration
function [] = Spring(k, m, initialCondition)

% Nonlinear Spring
function [dxdt] = Spring1(t, x)
dxdt = [x(2); -(k/m)*(x(1)+x(1)^3)];
end

% Linearized Spring
function [dxdt] = Spring2(t, x)
dxdt = [x(2); -(k/m)*x(1)];
end

%%% Numerical Integration
T = 15;
time = [0 T]; % simulation time from 0 to T seconds
[time1, sys1_state] = ode45(@Spring1, time, initialCondition);
[time2, sys2_state] = ode45(@Spring2, time, initialCondition);

y1 = sys1_state(:,1);
y2 = sys2_state(:,1);

LineWidth = 1.5;
% Plot systems output as a function of time
figure(1)
subplot(211)
plot(time1, y1(:,1), 'b', 'LineWidth', LineWidth), hold on
plot(time2, y2(:,1), 'r', 'LineWidth', LineWidth), hold off
xlabel('Time (seconds)'), ylabel('Displacement (m)')
legend('Nonlinear','Linearized'), set(gca, 'FontSize', 12)

subplot(212)
% plot system states
plot(sys1_state(:,1), sys1_state(:,2), 'b', ...
    sys2_state(:,1), sys2_state(:,2), 'r', 'LineWidth', 1.5)
xlabel('Displacement (m)'), ylabel('Velocity (m/s)')
legend('Nonlinear','Linearized', 'orientation', 'horizontal')
set(gca, 'FontSize', 12)

% Vecotr Plot
figure(2)
[x1, x2] = meshgrid(-2:0.3:2, -2:0.3:2);
x1_dot = x2; x2_dot =  -(k/m)*(x1+x1.^3);
figure(2), quiver(x1, x2, x1_dot, x2_dot, 1.2)
xlabel('x_1'), ylabel('x_2')
axis([-2.5 2.5 -2.5 2.5])
set(gca, 'FontSize', 12)

% system response of a new initial condition
hold on
[~, sys1_state] = ode45(@Spring1,  [0 8], [1 -0.5]);
plot(sys1_state(:,1), sys1_state(:,2), 'rp')

[~, sys1_state] = ode45(@Spring1,  [0 8], [-0.5 -0.5]);
plot(sys1_state(:,1), sys1_state(:,2), 'gp')
hold off

end

