function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Check that the inputs are the same length

% Numerically evaluate the integral of the vector of function values y with
% respect to x using Simpson's 1/3 rule.

% Error check: make sure the inputs are the same length
if length(x) ~= length(y)
    error('Error: x and y vectors must be the same length')
end

% Error check: make sure x input is equally spaced
dx = diff(x);
if max(abs(dx-dx(1))) > eps
    error('Error: x vector must be equally spaced')
end

% Check if there are an odd number of intervals
n = length(x) - 1;
h = (x(2)-x(1));  % spacing between intervals
I = y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2));  % initialize integral with endpoints
I = I*h/3;

if mod(n,2) ~= 0  % even number of intervals
    warning('Warning: Trapezoidal rule will be used for the last interval');
    I = I + ((x(end) - x(end-1)) * (y(end) + y(end-1)) / 2);  % use Simpson's rule on all but the last interval
end

if length(x) == 2  % even number of intervals
    warning('Warning: Trapezoidal rule will be used, due to there being 2 input arguments');
    I = ((x(end) - x(end-1)) * (y(end) + y(end-1)) / 2);
end

end