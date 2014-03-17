function savitzkyGolay()
X=importdata('temp.txt',' ');
X=X';
size(X,1)
for i=1:1:size(X,1)-24
newX=sgolayfilt(X(i,:),7,11);
figure,plot([1:115],X(i,:),'b',[1:115],newX(1,:),'r');
end
