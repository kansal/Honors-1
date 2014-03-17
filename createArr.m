function createArr(filename)
combinedStr='temp.txt';
outid=fopen(combinedStr,'at');
arr=importdata(filename,' ')
fprintf(outid,'%d ',arr);
fprintf(outid,'\n');
fclose(outid);
end
