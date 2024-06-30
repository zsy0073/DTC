function [sys,x0,str,ts,simStateCompliance] = sector3(t,x,u,flag)
 
switch flag
 
  case 0
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;

  case 1
    sys=mdlDerivatives(t,x,u);

  case {2,4,9}
    sys=[];
 
  case 3
    sys=mdlOutputs(t,x,u);
 
 
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
 
end
 
 
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
 
sizes = simsizes;
 
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;  
 
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];
 
simStateCompliance = 'UnknownSimState';


function sys=mdlDerivatives(t,x,u)
 
sys = [];
 
 
function sys=mdlOutputs(t,x,u)
if (u(1)==0)
    N = 1;
else
    f1 = u(1);
    f2 = (-0.5)*u(1) + sqrt(3)/2*u(2);
    f3 = (-0.5)*u(1) - sqrt(3)/2*u(2);
    if f1 > 0
        a = 0;
    else
        a = 1;
    end
    if f2 > 0
        b = 0;
    else
        b = 1;
    end
    if f3 > 0
        c = 0;
    else
        c = 1;
    end
    N = 4*a+2*b+c;
end
sys = N;

 
 