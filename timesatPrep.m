function timesatPrep(filename)
filename
a=importdata(filename,' ');
a=a';
combinedStr='timesat.txt';
outid=fopen(combinedStr,'at');
fprintf(outid,'2 23 25\n');
for i=1:size(a,1)
fprintf(outid,'%d ',a(i,:));
fprintf(outid,'\n');
end
fclose(outid);
end
