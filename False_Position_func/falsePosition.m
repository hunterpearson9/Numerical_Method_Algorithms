function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter,varargin)
% False Position Function
% Created by Hunter Pearson
% function [root,fx,ea,iter] = falsePosition(func,xi,xu,es,maxiter,varargin)
% Inputs:
%     func - the function in terms of x being evaluated ('f(x)=' is
%     implied). Example: 'cos(x)-0.5'.
%     xl - the lower guess
%     xu - the upper guess
%     es - the desired relative error (default: 0.0001%)
%     maxiter - the number of iterations desired (default: 200)
% Outputs:
%     root - the estimated root location
%     fx - the function evaluated at the root location
%     ea - the approximate relative error (%)
%     iter - how many iterations were performed

%% Check Arguments
if nargin == 3 %Assigns stopping criteria if none are given
    maxiter = 200;
    es = 0.0001;
elseif nargin == 4 %Assign stopping cirteria if none are given
    maxiter = 200;
elseif nargin < 3 %Check minimum # of arguments
    error('Not Enough Arguments');
elseif nargin > 5 %Check max # of arguments
    error('Too Many Arguments');
else
end

%% Function
func = vectorize(func);
func = str2sym(func); %Converts input 'func' to symbolic
syms f(x) %Creates a symbolic function 'f(x)'
f(x)=func; %Assign user string 'func' to 'f(x)'

fx=f(x); %Output variable
%% Check for input errors
%Check for a sign difference at endpoints
if (double(f(xl))*double(f(xu)) > 0)
    error('Invalid Bounds. Check if endpoints have sign change');
end

if es > 100 || es <= 0 % Check if stopping critera is between 100% and 0%
    error('Invalid stopping critera. Must be between 100%-0%');
end

if maxiter < 1
    error('Increase # of Iterations');
end
%% Assign variables
ea=100; %Arbitrary error for calculations (don't change)
iter=1; %Set iteration to 1
%% First Guess
root=double(xu-((f(xu)*(xl-xu))/(f(xl)-f(xu)))); %Calculate midpoint between Upper Bound and Lower Bound

guess_i=double(f(root)); %Evaluate function at 'xr'
if guess_i*double(f(xl))> 0 %Decide which bound to replace with 'xr'
    xl=root;
else
    xu=root;
end

%% Subsequential Guesses
while ea > es && iter < maxiter %Stops after either stopping critera have been met
    
    xr_old=root; %Update 'Previous Estimate'
    root=double(xu-((f(xu)*(xl-xu))/(f(xl)-f(xu)))); %Calculate New midpoint between Upper Bound and Lower Bound
    
    guess_double=double(f(root)); %Evaluate function at new 'xr'
    if guess_i*double(f(xl))> 0 %Decide which bound to replace with 'xr'
        xl=root;
    else
        xu=root;
    end
    ea = abs((root-xr_old)/root)*100; %Get percent approximate error
    iter = iter+1; %Increase iteration by 1
end

fx=double(f(root)); %Evaluate 'func' at root
end