[x1, x2] = meshgrid(-0.5:0.05:0.5,-0.5:0.05:0.5);
kp = 1;
kv = 1;
%f = 1;
%f = 1-abs(x1);
f = (1-x1*x1);
x1dot = x2; 
x2dot = -kp*x1-kv*f*x2;
quiver(x1,x2,x1dot, x2dot)
