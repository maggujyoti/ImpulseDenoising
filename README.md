# ImpulseDenoising

This work addresses the problem of impulse denoising. Traditionally this was removed by median filtering (and its variants). In recent times, li-li denoising techniques that employ an li-norm on the data fidelity term and li-norm on the image's sparsifying transform has been proposed.

Related Paper: J. Maggu, R. Hussein, A. Majumdar and R. Ward, "Impulse denoising via transform learning," 2017 IEEE Global Conference on Signal and Information Processing (GlobalSIP), Montreal, QC, 2017, pp. 1250-1254.

URL: http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8309161&isnumber=8308583


In this, Impulse Denoising is done using
- Dictionary Learning
- Transform Learning
- Robust transform Learning



#Impulse Denoising using Robust Transform Learning 
% solves ||TX - Z||_1 - mu*logdet(T) + eps*mu||T||_Fro + tau||Z||_1

% Inputs
% X          - Training Data
% numOfAtoms - dimensionaity after Transform
% mu         - regularizer for Tranform
% lambda     - regularizer for coefficient

% Output
% T          - learnt Transform
% Z          - learnt sparse coefficients


#Impulse Denoising using Transform Learning 
% solves ||TX - Z||_2 - mu*logdet(T) + eps*mu||T||_Fro + tau||Z||_1

% Inputs
% X          - Training Data
% numOfAtoms - dimensionaity after Transform
% mu         - regularizer for Tranform
% lambda     - regularizer for coefficient

% Output
% T          - learnt Transform
% Z          - learnt sparse coefficients

#Impulse Denoising using Dictionary Learning 
% solves ||X - DZ||_2  + tau||Z||_1

% Inputs
% X          - Training Data
% numOfAtoms - dimensionaity after Dictionary

% Output
% D         - learnt Dictionary
% Z          - learnt sparse coefficients


Run Impulsedenoising_DL.m for Implulse Denoising using Dictionary Learning. The amount of salt $ pepper noise can be changed, and demo shows it for an image called barbara.png

For Impulse Denoising using Transform Learning, Run Impulsedenoising_TL.m

For Impulse Denoising using Robust Transform Learning, Run Robust_impulse_denoising_TL.m


