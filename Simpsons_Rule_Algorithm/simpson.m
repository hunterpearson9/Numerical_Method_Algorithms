function [I] = simpson(x,y)
%Simpson - Integrate Experimental Data using Simpson's 1/3 Rule
%Created by: Hunter Pearson
%   Inputs:
%   x - Independent values (row vector)
%   y - Dependent values (row vector)
%   Outputs:
%   I - Evaluated integral sum

%% Error Checking
% Check that x and y are vectors
[xRows,xLen]=size(x);
[yRows,~]=size(y);
if xRows > 1
    error('x must be a row vector');
elseif yRows > 1
    error('y must be a row vector');
else
    % Everything is great!
end

% Error check that the x and y inputs are equal lengths
if xLen == length(y)
    % Everything is great!
else
    error('x and y inputs must be same length');
end
xDiff=diff(x); % Create matrix of interval spacing

% Error check that the x input is equally spaced
xDiffLen=length(xDiff);
for i=1:xDiffLen
    if abs(xDiff(1)-xDiff(i)) <= 1000*eps % Allow differences on the order of machine epsilon
        % Everything is great!
    else
        error('x input must be equally spaced');
    end
end

% Warn the user (not an error, just a warning) if the trapezoidal rule has to be used on the last interval.
if xDiffLen/2 == round(xDiffLen/2)
    % Everything is great!
    trapRule=0; % Don't perform Trapezoidal Rule for final interval
else
    fprintf('WARNING Trapezoidal Approximation is used for final interval (Odd number of intervals)!\n')
    trapRule=1; % Perform Trapezoidal Rule for final interval
end

%% Simpson's 1/3
I=0;
for i=1:2:(floor(xDiffLen/2)*2)
    I=I+(xDiff(1)/3*(y(i)+4*y(i+1)+y(i+2)));
end

%% Trapezoidal rule
if trapRule == 1
    I=I+xDiff(1)/2*(y(xLen-1)+y(xLen));
end
end
