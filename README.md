Numerical Methods Algorithms Repository
--------------------------------------
*Created by Hunter Pearson*

This repository contains numerical method functions for matlab. These functions were created for MECH 105.

## falsePosition.m
False Position Function - estimate a root using the false position method

function [root,fx,ea,iter] = falsePosition(func,xi,xu,es,maxiter,varargin)

Inputs:
***func** - the function in terms of x being evaluated ('f(x)=' is
implied). Example: 'cos(x)-0.5'.
**xl** - the lower guess
**xu** - the upper guess
**es** - the desired relative error (default: 0.0001%)
**maxiter** - the number of iterations desired (default: 200)*
    
Outputs:
***root** - the estimated root location
**fx** - the function evaluated at the root location
**ea** - the approximate relative error (%)
**iter** - how many iterations were performed*
    
## luFactor.m
LU Factorization Function - returns unit lower triangular matrix L, upper triangular matrix U, and permutation matrix P such that PA = LU.

[L,U,P] = luFactor(A)
  
Inputs:
***A** - square coefficient matrix*

Outputs:
***L** - lower triangular matrix
**U** - upper triangular matrix
**P** - the pivot matrix*
    
## simpson.m 
Simpson's 1/3 Rule - Integrate experimental data using Simpson's 1/3 Rule

[I]=simson(x,y)

Inputs:
***x** - Independent values (row vector)
**y** - Dependent values (row vector)*

Outputs:
***I** - Evaluated integral sum*
