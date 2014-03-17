function [i j]=findCoordinate(filename,m,n)
gridname='MODIS_Grid_16DAY_250m_500m_VI';
fileid=hdfgd('open',filename,'rdonly');
gridid=hdfgd('attach',fileid,gridname);
[i j]=hdfgd('ll2ij',gridid,m,n);
end