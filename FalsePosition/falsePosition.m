function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%falsePosition - This function is to determine the root of a function
%(where the function equals 0) using the false position method. 
%   Inputs: 
%           func: The function inputed by the user in the form:
%                  @(x) (inputed function)
%                       Example: @(x) x^2-5
%           xl: The lower bound for the brackets containing the root
%           xu: The upper bound for the brackets containing the root
%           es: The desired relative error in estimation
%           maxiter: The maximum iterations that can be performed
%   Outputs:
%           root: The final estimated root location
%           fx: The inputed function evaluated at final root
%           ea: The approximate relative error in percent
%           iter: How many iterations were actually performed


% Set defaults for the inputs of the function
if nargin < 4
    es = 0.0001; %If no value for es is inputed, set the default
end
if nargin < 5
    maxiter = 200; %If no value for maxiter is inputed, set the default
end
if nargin < 3
    error('Not enough inputs')
end
if nargin > 5
    error('Too many inputs')
end


iter = 0;
ea = 100;

% Make sure the inputed bounds contain the root of the function
Inixl = feval(func, xl);
Inixu = feval(func, xu);
Inibound = Inixl * Inixu;

if Inibound > 0 %Because one of the bounds must be negative
    error('Root is not within entered bounds')
end

% Calculate the estimated root using the false position formula.
xr = xl;
xrold = xr;
while ea > es && iter < maxiter
    Fxl = feval(func, xl);
    Fxu = feval(func, xu);
    xr = xu - ((Fxu*(xl - xu))/(Fxl-Fxu));
    Fxr = feval(func, xr);
    if sign(Fxr) == sign(Fxl) %Replace the bound that has the same sign as the 
        xl = xr;              %new estimate with xr
    else
        xu = xr;    
    end
    
    ea = abs((xr-xrold)/xr)*100; %Calculate the percent approximate relative error
    xrold = xr; 
    iter = iter + 1;
end

root = xr;
fx = feval(func,xr);

fprintf('The estimated root is %8.4f \n', root)
fprintf('The function value at the estimated root is %8.9f \n', feval(func,xr))
fprintf('The percent approximate relative error is %8.4f \n', ea)
fprintf('The number of iterations performed is %8f \n', iter)

end

