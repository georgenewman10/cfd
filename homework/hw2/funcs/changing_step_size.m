
expEulerFunc(.025)
expEulerFunc(.01)
expEulerFunc(.001)
expEulerFunc(.0005)
legend('h = .025','h = .01', 'h = .001', 'h = .0005')
title('Explicit Euler with Changing h')


impEulerFunc(.02)
impEulerFunc(.01)
impEulerFunc(.001)
impEulerFunc(.0005)
legend('h = .02','h = .01', 'h = .001', 'h = .0005')
title('Implicit Euler with Changing h')


midpointFunc(.025)
midpointFunc(.01)
midpointFunc(.001)
midpointFunc(.0005)
legend('h = .025','h = .01', 'h = .001', 'h = .0005')
title('Midpoint with Changing h')


trapFunc(.025)
trapFunc(.01)
trapFunc(.001)
trapFunc(.0005)
legend('h = .025','h = .01', 'h = .001', 'h = .0005')
title('Trapezoidal with Changing h')


ab2Func(.025)
ab2Func(.01)
ab2Func(.001)
ab2Func(.0005)
legend('h = .025','h = .01', 'h = .001', 'h = .0005')
title('AB2 with Changing h')


rk2Func(.025)
rk2Func(.01)
rk2Func(.001)
rk2Func(.0005)
legend('h = .025','h = .01', 'h = .001', 'h = .0005')
title('RK2 with Changing h')


rk4Func(.05)
rk4Func(.01)
rk4Func(.001)
rk4Func(.0005)
legend('h = .05','h = .01', 'h = .001', 'h = .0005')
title('RK4 with Changing h')
















