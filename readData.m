function readData(filename,m,n)
gridname='MODIS_Grid_16DAY_250m_500m_VI';
fileid=hdfgd('open',filename,'rdonly');
gridid=hdfgd('attach',fileid,gridname);
datafieldname='250m 16 days EVI';
[evi,fail]=hdfgd('readfield',gridid,datafieldname,[m,n],[],[5,5]);
evi=evi';
str=sprintf('%s',filename);
%combinedStr=strcat('Result','_','forest','_',str); for forest data
combinedStr=strcat('Result','_',str)
outid=fopen(combinedStr,'w');
fprintf(outid,'%d ',evi);
hdfgd('detach', gridid);
hdfgd('close', fileid);
end
