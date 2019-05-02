function [L,U,P,varargout] = luFactor(A)
%% luFactor
% Created by Hunter Pearson
%
%   [L,U,P] = luFactor(A) returns unit lower triangular matrix L, upper
%   triangular matrix U, and permutation matrix P such that P*A = L*U.
% Inputs:
%     A - square coefficient matrix
% Outputs:
%     L - lower triangular matrix
%     U - upper triangular matrix
%     P - the pivot matrix

%% Error Check
%Check for equal matrix side lengths
[M,N]=size(A); %Store M-ROWS and N-COLUMNS
if N~=M
    error('Matrix [A] must have equal M (rows) and N (columns)'); %equal side lengths are required to solve a system of linear equations
end

if nargout > 3
    error('Too many output arguments');
end

P=eye(size(A)); %Create identity matrix
L=zeros(size(A)); %Initalize L with matrix of zeros

%% Elimination and Pivoting
% NOTE: All lines including '+(i-1)' are used to ensure no prev rows are
% being taken into consideration when eliminating and storing values in
% matricies
for i=1:N-1 %perform this function for every row in column N
    [~,piv_r]=max(abs(A(i:N,i))); %Store largest number (~-unused) and position in col 1 (piv_r)
    %NOTE: A(i:N,1) only looks at the current columns and rows that are
    %being eliminated. This means as the function goes through more columns/rows
    %it won't look at previous rows
    
    piv_r=piv_r+(i-1); %makes sure the correct row is being chosen for pivoting
    
    %Pivot
    A([i piv_r],:)=A([piv_r i],:); %Pivot rows A
    P([i piv_r],:)=P([piv_r i],:); %Pivot rows P
    L([i piv_r],:)=L([piv_r i],:); %Pivot rows L
    
    %Elimination
    for j=1+i:M
        % NOTE: because we have a square matrix, we know A(i,i) is the
        % pivot element, which remains along the diagonal
        L(j,i)=A(j,i)/A(i,i); %Set value of L
        A(j,:)=A(j,:)-(L(j,i)*(A(i,:))); %Use value of L in elimination
    end
end
%% Output Section

% if nargout == 0
%     L=A+L;
% else
%     L=P'*L; L=L+P'; % P needs to be transposed? I'm not sure why. Just used guess and check
%     %L=L+eye(size(A));
%     U=A; %Set [U] for output
%     %L*U; %Proof that [L]*[U]=[A]
% end

%L=P'*L; L=L+P'; % P needs to be transposed? I'm not sure why. Just used guess and check
L=L+eye(size(A));
U=A; %Set [U] for output
%L*U; %Proof that [L]*[U]=[A]
end

