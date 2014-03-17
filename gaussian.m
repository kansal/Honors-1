function gaussian()
X=importdata('temp.txt',' ');
X=X';
for i=1:size(X,2)
	Y(i)=i;
end

% hold all;
% parguess = [1500,4.85,0.05,0.05,5000,5.1,0.05,0.1];
% two_peaks(parguess,X(1,:))
xinit=[1,1,1,1];
pars = nlinfit(Y,X(1,:), @asym_peak, xinit);
new=asym_peak(pars,Y);
plot (Y,new,'g-')
% legend 'raw data' 'initial guess'
end

function f = asym_peak(pars,t)
    % from Anal. Chem. 1994, 66, 1294-1301
    a0 = pars(1);  % peak area
    a1 = pars(2);  % elution time
    a2 = pars(3);  % width of gaussian
    a3 = pars(4);  % exponential damping term
    f = a0/2/a3*exp(a2^2/2/a3^2 + (a1 - t)/a3)...
            .*(erf((t-a1)/(sqrt(2)*a2) - a2/sqrt(2)/a3) + 1);
end

%{
function f = two_peaks(pars, t)
    a10 = pars(1);  % peak area
    a11 = pars(2);  % elution time
    a12 = pars(3);  % width of gaussian
    a13 = pars(4);  % exponential damping term
    a20 = pars(5);  % peak area
    a21 = pars(6);  % elution time
    a22 = pars(7);  % width of gaussian
    a23 = pars(8);  % exponential damping term
    p1 = asym_peak([a10 a11 a12 a13],t);
    p2 = asym_peak([a20 a21 a22 a23],t);
    f = p1 + p2;
end
%}