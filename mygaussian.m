function mygaussian(num)
global num
X=importdata('temp.txt',' ');
X=X';
Y=[1:size(X,2)]
for i=1:1:size(X,1)-24
    P=lsqcurvefit(@gaussianFit,x0,Y,X(i,:));
    New= gaussianFit(P,Y);
end
end

function gaussianFit(,x)
global num
y=0;
for i=1:1:num
    k=-((x-b(i))/c(i))^2;
    y=y+a(i)*exp(k);
end
end