scheme = "Wheeled robot control\Wheeled_robot_ctrl.zcos";

// Simulate
importXcosDiagram(scheme);
// Parameters
ctx = ["d = 0.2; r = 0.05; kp = 0.02; ki = 0.0015; T = 0.1;"];
scs_m.props.context = ctx;
xcos_simulate(scs_m, 4);

// Draw
show_window(1)
subplot(311);
h = plot(omega1_out.time, omega1_out.values, 'b-', omega2_out.time, omega2_out.values, 'r-', 'LineWidth',3);
l = legend("Omega 1", "Omega 2");
l.font_size = 3;
ax=gca(),// get the handle on the current axes
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Angular speed [rad/s]', 'font_style', 'times bold', 'font_size', 3);
title('Robot wheels angular speed', 'font_style', 'times bold', 'font_size', 4);

subplot(312);
h = plot(psi_deg_out.time, psi_deg_out.values, 'b-', psi_deg_des_out.time, psi_deg_des_out.values, 'r-', 'LineWidth',3);
l = legend("Measured", "Setpoint");
l.font_size = 3;
ax=gca(),// get the handle on the current axes
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Yaw angle [deg]', 'font_style', 'times bold', 'font_size', 3);
title('Yaw angle control', 'font_style', 'times bold', 'font_size', 4);

subplot(313);
h = plot(u_out.time, u_out.values, 'b-', u_des_out.time, u_des_out.values, 'r-', 'LineWidth',3);
l = legend("Measured", "Setpoint");
l.font_size = 3;
ax=gca(),// get the handle on the current axes
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Speed [m/s]', 'font_style', 'times bold', 'font_size', 3);
title('Speed control', 'font_style', 'times bold', 'font_size', 4);

show_window(2)

h = plot(x_out.values, y_out.values, 'b-', 'LineWidth',3);
ax=gca(),// get the handle on the current axes
set(gca(),"grid",[1 1]);
xlabel('x[m]', 'font_style', 'times bold', 'font_size', 3);
ylabel('y[m]', 'font_style', 'times bold', 'font_size', 3);
title('Robot position on x-y plane', 'font_style', 'times bold', 'font_size', 4);


