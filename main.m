function main
%{
clear all; close all
datafile = 'gc-data-21.txt';
fid = fopen(datafile);
i = 0;
while 1
    line = fgetl(fid);
    sm = strmatch('# of Points',line);
    if ~isempty(sm)
        regex = '# of Points(.*)';
        [match tokens] = regexp(line,regex,'match','tokens');
        npoints = str2num(tokens{1}{1});
    elseif strcmp(line,'R.Time	Intensity')
        break
    i = i + 1;
    end
end
t = zeros(1,npoints);
intensity = zeros(1,npoints);
for j=1:npoints
    line = fgetl(fid);
    [a] = textscan(line,'%f%d');
    t(j) = a{1};
    intensity(j) = a{2};
end
fclose(fid);
%}
X=importdata('temp.txt',' ');
X=X';
t=[1:12]
X(1,:)
ainit=[2000,3,0.05,0.1];
figure,plot(t,X(1,1:12),'r-',t,asym_peak(ainit,t)+2000,'g-');
end

function f = asym_peak(pars,t)
  % from Anal. Chem. 1994, 66, 1294-1301
  a0 = pars(1);  % peak area
  a1 = pars(2);  % elution time
  a2 = pars(3);  % width of gaussian
  a3 = pars(4);  % exponential damping term
  f = a0/2/a3*exp(a2^2/2/a3^2 + (a1 - t)/a3).*(erf((t-a1)/(sqrt(2)*a2) - a2/sqrt(2)/a3) + 1);
end