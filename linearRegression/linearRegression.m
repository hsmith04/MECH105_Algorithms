function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set

if length(x)~=length(y)
    error('Make sure x and y arrays are of the same size!')
end

%sorting x and y values
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
y = sortedY;
x = sortedX;

%outliers
n = length(x);
W= floor((length(x)+1)/4);
R = floor((3*length(x)+3)/4);
Q1 = y(W);
Q3 = y(R);
IQR = Q3-Q1;


threshold = 1.5*IQR;
outliers = y < (Q1 - threshold) | y > (Q3 + threshold);

%      fY: y-values with outliers removed
fY = y(~outliers);
%      fX: x-values with outliers removed
fX = x(~outliers);

%LinReg
n_new = length(y);
y_avg = mean(fY);
x_avg = mean(fX);
SSX = sum((fX-x_avg).^2);
SP = sum((fX-x_avg).*(fY-y_avg));
%       slope: slope from the linear regression y=mx+b
slope = SP/SSX;
%       intercept: intercept from the linear regression y=mx+b
intercept = y_avg-slope.*x_avg;

line_eq = slope.*fX + intercept;


%Calculating Rsquared

SStotal = sum((fY-y_avg).^2);
SSresid = sum((fY-line_eq).^2);
%      Rsquared: R^2, a.k.a. coefficient of determination
Rsquared = 1-(SSresid/SStotal);


end