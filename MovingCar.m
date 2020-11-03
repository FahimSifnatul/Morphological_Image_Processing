pkg load image
clc;
clear all;

% car co-ordinates
x = [2 2 2 5 5 5 5 6 6 6 6 5.5 5.5 5.5 5.5 4.5 4.5 4.5 4.5 3.5 3.5 3.5 3.5 2.5 2.5 2.5 2.5 2];
y = [.5 2.5 2.5 2.5 2.5 2 2 2 2 .5 .5 .5 .5 1 1 1 1 .5 .5 .5 .5 1 1 1 1 .5 .5 .5];

% car color
cxy1 = 1 : 1 : 28;
cxy2 = 28 : -1 : 1;

% step size, finish 
finish    = 4;
step_size = .02; 

% border co-ordinates
bx = [2 2 2 finish+6 finish+6 finish+6 finish+6 2];
by = [0 10 10 10 10 0 0 0];

% background color
cbxy1 = 51: 5 : 90;
cbxy2 = 90: -5: 51;

% circle
r = 0.45;
adjust = 0.025;

% back circle
cx1 = [-r : 0.01: r];
cy1 = sqrt(r^2 - cx1.^2);
cx2 = -cx1 + 3 - adjust;
cy2 = -cy1 + 0.5;
cx1 += 3 - adjust;
cy1 += 0.5;
sz  = size(cx1, 2);

% front circle
cx3 = [-r : 0.01: r];
cy3 = sqrt(r^2 - cx3.^2);
cx4 = -cx3 + 5 - adjust;
cy4 = -cy3 + 0.5;
cx3 += 5 - adjust;
cy3 += 0.5;

figure;

flg = 0;
for i = 0 : step_size : finish
  hold on;
  
  flg += 1;

  if mod(flg, 10) < 5
    patch(bx, by, cbxy1);
    patch(x, y, cxy1);
  else
    patch(bx, by, cbxy2);
    patch(x, y, cxy2);
  endif
  
  % back  circle of car
  cx1 += step_size;
  cx2 += step_size;
  
  cx1_end = cx1(1);
  cy1_end = cy1(1);
  cx2_end = cx2(1);
  cy2_end = cy2(1);
  
  cx1(1:sz-1) = cx1(2:sz);
  cy1(1:sz-1) = cy1(2:sz);
  cx2(1:sz-1) = cx2(2:sz);
  cy2(1:sz-1) = cy2(2:sz);
  
  cx1(sz) = cx2_end;
  cy1(sz) = cy2_end;
  cx2(sz) = cx1_end;
  cy2(sz) = cy1_end;
  patch(cx1, cy1, 'g');
  patch(cx2, cy2, 'r');
  
  % front circle of car
  cx3 += step_size;
  cx4 += step_size;
  
  cx3_end = cx3(1);
  cy3_end = cy3(1);
  cx4_end = cx4(1);
  cy4_end = cy4(1);
  
  cx3(1:sz-1) = cx3(2:sz);
  cy3(1:sz-1) = cy3(2:sz);
  cx4(1:sz-1) = cx4(2:sz);
  cy4(1:sz-1) = cy4(2:sz);
  
  cx3(sz) = cx4_end;
  cy3(sz) = cy4_end;
  cx4(sz) = cx3_end;
  cy4(sz) = cy3_end;
  patch(cx3, cy3, 'g');
  patch(cx4, cy4, 'r');

  
  pause(.01);
  clf;
  
  x(:) += step_size;
endfor













