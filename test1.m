function test1()
mean=1;
sigma=0.1;
x=-3:0.01:3;
fx=1/sqrt(2*pi)/sigma*exp(-(x-mean).^2/2/sigma/sigma);
plot(x,fx)
end