function [x_dot] = dynamics(x, soleus, tibialis)

% Inputs
%  x: state vector (ankle angle, angular velocity, soleus normalized CE length, TA normalized CE length)
% soleus: soleus muscle (HillTypeModel)
% tibialis: tibialis anterior muscle (HillTypeModel)

% Output
% x_dot: derivative of state vector

soleus_activation = 0.05;
tibialis_activation = 0.4;
ankle_inertia = 90;

%WRITE CODE HERE TO IMPLEMENT THE MODEL

soleus_moment_arm = 0.05;
tibialis_moment_arm = 0.03;
solues_torque = soleus_moment_arm.*soleus.get_force(soleus_length(x(1)), x(3));
tibialis_torque = tibialis_moment_arm.*tibialis.get_force(tibialis_length(x(1)), x(4));
x_dot = zeros(4,1);
x_dot(1) = x(2);
x_dot(2) = (solues_torque - tibialis_torque + gravity_moment(x(1)))/ankle_inertia;
x_dot(3) = get_velocity(soleus_activation, x(3), ...
    soleus.norm_tendon_length(soleus_length(x(1)), x(3)));
x_dot(4) = get_velocity(tibialis_activation, x(4), ...
    tibialis.norm_tendon_length(tibialis_length(x(1)), x(4)));
end