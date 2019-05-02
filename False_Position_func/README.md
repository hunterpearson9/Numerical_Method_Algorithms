falsePosition.m
---
####False Position Function

Created by Hunter Pearson

    [root,fx,ea,iter] = falsePosition(func,xi,xu,es,maxiter,varargin)
<dl>
    <dt>Inputs:</dt>
    <dd>func - the function in terms of x being evaluated ('f(x)=' is
    implied). Example: 'cos(x)-0.5'.</dd>
    <dd>xl - the lower guess</dd>
    <dd>xu - the upper guess</dd>
    <dd>es - the desired relative error (default: 0.0001%)</dd>
    <dd>maxiter - the number of iterations desired (default: 200)</dd>
    
    <dt>Outputs:</dt>
    <dd>root - the estimated root location</dd>
    <dd>fx - the function evaluated at the root location</dd>
    <dd>ea - the approximate relative error (%)</dd>
    <dd>iter - how many iterations were performed</dd>
</dl>
