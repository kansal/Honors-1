function graphNonLinear()
X=importdata('temp.txt',' ');
X=X';
for i=1:size(X,2)
    Y(i)=i;
end
% Labels={'01Jan','17Jan','02Feb','18Feb','05Mar','21Mar','06Apr','22Apr','08May','24May','09Jun','25Jun','11Jul','27Jul','12Aug','28Aug','13Sep','29Sep','15Oct','31Oct','16Nov','02Dec','18Dec','01Jan','17Jan','02Feb','18Feb','05Mar','21Mar','06Apr','22Apr','08May','24May','09Jun','25Jun','11Jul','27Jul','12Aug','28Aug','13Sep','29Sep','15Oct','31Oct','16Nov','02Dec','18Dec'};
% Labels={'09Jun','25Jun','11Jul','27Jul','12Aug','28Aug','13Sep','29Sep','15Oct','31Oct','16Nov','02Dec','18Dec','01Jan','17Jan','02Feb','18Feb','05Mar','21Mar','06Apr','22Apr','08May','24May','09Jun','25Jun','11Jul','27Jul','12Aug','28Aug','13Sep','29Sep','15Oct','31Oct','16Nov','02Dec','18Dec','01Jan','17Jan','02Feb','18Feb','05Mar','21Mar','06Apr','22Apr','08May','24May'};
x=[];
% x0=[1 1 1 1 1 1 1 1 1];
x0=[1 1 1 1 1 1 1];
size(X)
for i=1:1:size(X,1)-24
    
    P=lsqcurvefit(@myfun,x0,Y,X(i,:));
    New= myfun(P,Y);
    
    hold on;
    grid on;
    format long g
    title('Combination of linear and Harmonic basis');
%     plot(Y,X(i,:),'b',Y,New,'r');
    plot(Y,X(i,:),'b')
    [maxtab, mintab]=peakdet(New,50,Y);
%     plot(mintab(:,1), mintab(:,2), 'g*');
%     plot(maxtab(:,1), maxtab(:,2), 'r*');
    X(mintab(:,1))
    New(mintab(:,1))
    mindiff=(X(mintab(:,1))' - New(mintab(:,1))).^2
    sum(mindiff)
    hold off;
end
end

function F=myfun(c,xdata)
w=2*pi/23;
% F=c(1) + c(2)*xdata + c(3)*sin(w*xdata) + c(4)*cos(w*xdata) + c(5)*sin(2*w*xdata) + c(6)*cos(2*w*xdata);
% F=c(1) + c(2)*xdata + c(3)*power(xdata,2) + c(4)*sin(w*xdata) + c(5)*cos(w*xdata) + c(6)*sin(2*w*xdata) + c(7)*cos(2*w*xdata) + c(8)*sin(3*w*xdata) + c(9)*cos(3*w*xdata);
F=c(1) + c(2)*xdata + c(3)*power(xdata,2) + c(4)*sin(w*xdata) + c(5)*cos(w*xdata) + c(6)*sin(2*w*xdata) + c(7)*cos(2*w*xdata);
end
    