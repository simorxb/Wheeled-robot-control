# Wheeled-robot-control
A model in Xcos of a two wheeled mobile robot and its control system, to control yaw and speed.

Code created to support a Linkedin post. https://www.linkedin.com/posts/simone-bertoni-control-eng_wheeled-robot-control-activity-7052943644076433408-ZRnS?utm_source=share&utm_medium=member_desktop

Follow me on Linkedin! https://www.linkedin.com/in/simone-bertoni-control-eng/

Mobile robots are cool, no doubt about that.

Curious about how they are controlled? 👇

A two-wheeled robot is one of the simplest architectures used for mobile robots.

It's also really interesting to study non-linear control algorithms and guidance techniques.

I explained how the works in a previous post, link in the comments. Here's a recap:

omega1 and omega2 are the angular speed (in rad/s) of wheel 1 and wheel 2.

 u1 and u2 are their linear speed:

✅ u1 = omega1\*r
✅ u2 = omega2\*r

u and v are the linear speed of the robot (the centre of mass) along xr and yr (frame of reference attached to the robot):

✅ u = omega1\*r/2 + omega2\*r/2
✅ v = 0

And finally the equation of motion, where the state variables are [x, y, psi]:

✅ dx/dt = u\*cos(psi)
✅ dy/dt = u\*sin(psi)
✅ dpsi/dt = omega2\*r/d - omega1\*r/d

To make the model more realistic we assume that each wheel's speed controller responds as a first order with transfer function 1/(s+1) and has an error factor respectively of 1.02 and 1.06. The error factor is there to simulate speed controllers that don't control properly.

The control system assumes 2 setpoints (that could be from a user or from a path planner):

✅ psi_deg_des: yaw angle in degrees
✅ u_des: linear speed in m/s

To control the linear speed we assume that we have no access to the actual speed measurement, therefore we simply use the knowledge of the system:

✅ omega_avg_des = u_des/r (our average desired wheel speed)

To control the yaw angle we use a PI controller that outputs Delta_omega_des. We assume that we can measure the yaw, for example using a magnetic compass.

Then we have:

✅ omega_1_des = omega_avg_des - Delta_omega_des
✅ omega_2_des = omega_avg_des + Delta_omega_des

This way we have decoupled the MIMO system and we treat it like two SISO systems.

There is an important point to make here. When working with angles it's easy to get in trouble due to their periodicity.

For example, let's say the setpoint is 350 degrees and the measurement is 10. Our error will be 340 and will cause the robot to turn 340 degrees left! That's obviously not convenient as all we needed was to turn 20 degrees right.

To fix this problem we can use a function that converts all angles so that they are within -180 and 180, including the error.

You can see the function that I wrote in the slides. If you try the previous case, the setpoint will be converted to -10, and then the error will be -20.

Job done. The robot as you can see always turns the right way.

The link to the code is in the comments.

If you enjoyed this follow me for more tips on control and embedded software engineering.

Hit the 🔔 on my profile to get a notification for all my new posts.

What do you want to know? Ask in the comments!

#controlsystems #embeddedsystems #softwareengineering #embeddedsoftware #controltheory #robotics #robots #algorithms
