function graph()
X=importdata('temp.txt',' ');
X=X';
for i=1:size(X,2)
    Y(i)=i;
end
% Labels={'01Jan','17Jan','02Feb','18Feb','05Mar','21Mar','06Apr','22Apr','08May','24May','09Jun','25Jun','11Jul','27Jul','12Aug','28Aug','13Sep','29Sep','15Oct','31Oct','16Nov','02Dec','18Dec','01Jan','17Jan','02Feb','18Feb','05Mar','21Mar','06Apr','22Apr','08May','24May','09Jun','25Jun','11Jul','27Jul','12Aug','28Aug','13Sep','29Sep','15Oct','31Oct','16Nov','02Dec','18Dec'};               
size(X,1)

for i=1:1:size(X,1)-24
    P=polyfit(Y,X(i,:),5);
    F=polyval(P,Y);
    figure;
    hold on;
    title('5th degree polynomial fit');
%   subplot(2,1,1);
    plot(Y,X(i,:),'b');
%     set(gca, 'XTick', 1:46, 'XTickLabel', Labels);
    grid on;
    axis([1 46 0 8000]);
%     subplot(2,1,2);
    plot(Y,F,'r');
%     set(gca, 'XTick', 1:46, 'XTickLabel', Labels);
    grid on;
    axis([1 46 0 10000]);
    hold off;
end
    
end
