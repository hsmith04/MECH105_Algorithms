function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

% Check that A is a square matrix
if ~ismatrix(A) || size(A,1) ~= size(A,2)
    error('Input must be a square matrix')
end

n = size(A,1);
L = eye(n);
P = eye(n);
U = A;

for k = 1:n-1
    % Find the row with the maximum absolute value in the k-th column
    [~,i_max] = max(abs(U(k:n,k)));
    i_max = i_max + k - 1;
    
    % Swap rows i_max and k in U and P
    U([i_max,k],k:n) = U([k,i_max],k:n);
    P([i_max,k],:) = P([k,i_max],:);
    
    % Swap only the elements to the left of the diagonal in L
    if k > 1
        L([i_max,k],1:k-1) = L([k,i_max],1:k-1);
    end
    
    % Compute the multipliers and eliminate the k-th column
    for i = k+1:n
        L(i,k) = U(i,k)/U(k,k);
        U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
    end
end
end