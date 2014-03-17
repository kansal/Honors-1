% function gaussianFitting()
% X=importdata('temp.txt',' ');
% X=X';
% % size(X)
% % size([1:115]')
% size(X(1,:))
% f=fit([1:115]',X(1,:)','gauss8');
% hold on;
% plot(f,[1:115],X(1,:));
% plot([1:115],X(1,:),'b')
% hold off;
% end

function mygaussian()
X=importdata('temp.txt',' ');
X=X';
Y=[1:size(X,2)]
for i=1:1:size(X,1)-24
    P=lsqcurvefit(@gaussianFit,x0,Y,X(i,:));
    New= gaussianFit(P,Y);
end
end

function gaussianFit()
global num;
end