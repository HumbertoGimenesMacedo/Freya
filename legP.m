% =========================================================================
% This code returns the vector of values of normalized/non-normalised (depends on the value of 'norm' variable) Legendre Polynomial 
% of degrees 0,...n  at the point |x|<=1 (column vector of values) using the Bonnet's recursion formula:
% nP[n] = (2n-1)xP[n-1]-(n-1)P[n-2].
% Dependencies: nil
% =========================================================================
% Author: Martin Sagradian
% Date: 10JAN2018
% =========================================================================
function [Pn] = legP(n,x,a,b,norm)
    if nargin < 3
        norm = false;
    end
    Pn = zeros(length(x),n+1);
    if n>=0 
        %Pn(:,1)= 1;
        Pn(:,1) = sqrt(2/(b-a));
    end
    if n>=1
        %Pn(:,2)= (2*x - a - b)/(b-a);
        Pn(:,2)= sqrt(2/(b-a))*(2*x - a - b)/(b-a);
    end
    if n>=2
        for m=3:n+1
            Pn(:,m)=(1/(m-1))*((2*m-3)*((2*x - a - b)/(b-a)).*Pn(:,m-1)-(m-2)*Pn(:,m-2));
            
            %Pn(:, m) = (1/(m + 1)) *((2*m + 1)* ((2*x - a - b)/(b-a)) .* Pn(:, m-1) - m * Pn(:, m - 2));
            
            %Pn(:,m)=((1/(m-1))*((2*m-3)*((2*x - a - b)/(b-a)).*Pn(:,m-1)-(m-2)*Pn(:,m-2)));
        end
    end
if norm == true
    for m=1:n+1
        Pn(:,m) = Pn(:,m)*sqrt((m-1)+1/2);
        %Pn(:,m) = Pn(:,m)*sqrt((b-a) * (2 * m + 1)) / 2;
    end
end

    
    
