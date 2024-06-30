function [sys,x0,str,ts] = sw(t,x,u,flag)
 
switch flag
 
  case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
 
    
  case {1,2,4,9}
    sys=[];
 
  case 3
    sys=mdlOutputs(t,x,u);
 
 
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
 
end
 
 
function [sys,x0,str,ts]=mdlInitializeSizes
 
sizes = simsizes;
 
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;  
 
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];

function sys=mdlOutputs(t,x,u)

V_Table=[2 4 6 1 3 5;4 1 5 2 6 3;3 6 2 5 1 4;5 3 1 6 4 2];
x=2*u(1)+u(2)+1;
sys=V_Table(x,u(3));

 
 