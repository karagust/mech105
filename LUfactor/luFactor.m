function [L,P,U] = luFactor(A)
%luFactor LU Factorization of a square matrix using partial pivoting
% Inputs: 
%       A - a square matrix representing the coefficients of the system
%       being solved
% Outputs:
%       L - lower triangular matrix
%       U - upper triangular matrix
%       P - pivot matrix

%Test for correct inputs
if nargin ~= 1 
    error('Check number of inputs')
end

%Determine size of A
S = size(A);
P = eye(S(1,1),S(1,2));
L = eye(S(1,1),S(1,2));
U = A;
rows = S(1,1);
columns = S(1,2);

%Test for if input was square matrix
if S(1,1) ~= S(1,2)
    error('Please enter a square matrix')
end


r = 0;
c = 0;
while r <= rows
   
    c = c + 1;
    
          R = sum(U(:,c)~=0); %Counting the number of elements in a 
                              %column that are non zero
          while R >= rows-1
             r = r + 1;
             if r >= rows || c >= columns
                 break
             end
              [value, row] = max(abs(U(:, c)));
              if value > abs(U(r,c))
              pivot = row; %Pivoting the matrixes
                Unewpivot = U(r,:);
                U(r,:) = U(pivot,:);
                U(pivot,:) = Unewpivot;
                
                Pnewpivot = P(r,:);
                P(r,:) = P(pivot,:);
                P(pivot,:) = Pnewpivot;

            if r > 1  && pivot > 1
                Lnewpivot = L(r,c);
                L(r,c) = L(pivot,c);
                L(pivot,c) = Lnewpivot;
            end
              end
              
            if r < rows %Elimination of elements to form upper triangular
                Row = r + 1;
                L(Row,c) = U(Row,c)/U(c,c);
                U(Row,:) = U(Row,:)-(L(Row,c)*U(c,:));
       
            else
                L(r,c) = U(r,c)/U(r-1,c);
                U(r,:) = U(r,:)-(L(r,c)*U(c,:));
            end
             %R = nnz(U(:,c));
              R = sum(U(:,c)~=0);
              
        if r >= rows
           break
        end
        
          end
            c = c + 1;
            
end

  disp('The P matrix is: '), disp(P);
    disp('The A matrix is: '), disp(A);
    disp('The L matrix is: '), disp(L);
    disp('The U matrix is: '), disp(U);
end
            
            
