[x1, x2] = meshgrid(-0.5:0.05:0.5,-0.5:0.05:0.5);
kp = 1;
kv = 0.5*(1-abs(x1));
x2dot = -(kv).*x2-(kp).*x1;
x1dot = x2;

quiver(x1,x2,x1dot,x2dot)
