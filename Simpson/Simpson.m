function [I] = Simpson(x,y)
%Integration of experimental data using Simpson's 1/3 rule
%   Inputs: 
%       x - a vector containing equally spaced data points
%       y - a vector containing the values being integrated with the
%           variable x
%       
%   Outputs:
%       I - the integral of the experimental data 

Sx = size(x); % Changing the matrix x to be a vertical matrix
Numx = Sx(1,1);
if Numx == 1
    x = x';
end
Sx = size(x); 
Numx = Sx(1,1);  % The variable Numx represents how many points are in x

Sy = size(y); % Changing the matrix y to be a vertical matrix
Numy = Sy(1,1);
if Numy == 1
    y = y';
end
Sy = size(y); 
Numy = Sy(1,1);

if mod(Numx,2) ~= 1 % If the number of points are even, the trap rule is used on the last part
    disp('WARNING: The trapezodial rule was used on the final segments')
end

if Sy ~= Sx % If the size of x and y are not the same, there is an error
    error('Data inputs are not same size')
end

Dif = x(2,1) - x(1,1); % If the input x is not equally spaced, there is an error
for i = 2:Numx
    if x(i,1) ~= x(i-1,1) + Dif
        error('Please enter x as equally spaced points')
    end
end

I = zeros(Numx+1,1); % An empty matrix for the calculated integrals

if mod(Numx,2) ~= 1 % If there is an even number of points
    for a = 1:2:Numx  
    b = a + 2;
    I(a,1) = (((b - a)*(y(a,1) + (4*y((a+1),1)) + y(b,1)))/6);
    if b == Numx-1 % Once the 1/3 rule has been applied, the trap rule is used on the last segment
        a = b;
        b = Numx;
        I(a,1) = (((b - a)*(y(a,1)+y(b,1)))/2);
        break
    end
    end
else
    for a = 1:2:Numx % If there is no necessary application of the trap rule, only the 1/3 rule is used
    b = a + 2; 
    I(a,1) = (((b - a)*(y(a,1) + (4*y((a+1),1)) + y(b,1)))/6);
    if b >= Numx 
        break
    end
    end
end
I = sum(I); % The computed integrals are summed together to equal the total integral
end

