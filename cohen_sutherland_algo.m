clc;
clear all;

xmax = input('Enter xmax = ');
xmin = input('Enter xmin = ');
ymax = input('Enter ymax = ');
ymin = input('Enter ymin = ');

windowx = [xmin xmin xmax xmax xmin];
windowy = [ymin ymax ymax ymin ymin];

line_starting_x = input('Enter staring x of line = ');
line_starting_y = input('Enter staring y of line = ');
line_ending_x = input('Enter ending x of line = ');
line_ending_y = input('Enter ending y of line = ');

starting_region_code = 0;
ending_region_code   = 0;

if line_starting_y > ymax
  starting_region_code = bitor(starting_region_code, 8); 
endif
if line_starting_y < ymin
  starting_region_code = bitor(starting_region_code, 4); 
endif
if line_starting_x > xmax
  starting_region_code = bitor(starting_region_code, 2); 
endif
if line_starting_x < xmin
  starting_region_code = bitor(starting_region_code, 1); 
endif

if line_ending_y > ymax
  ending_region_code = bitor(ending_region_code, 8); 
endif
if line_ending_y < ymin
  ending_region_code = bitor(ending_region_code, 4); 
endif
if line_ending_x > xmax
  ending_region_code = bitor(ending_region_code, 2); 
endif
if line_ending_x < xmin
  ending_region_code = bitor(ending_region_code, 1); 
endif

if starting_region_code == 0 && ending_region_code == 0
  display('Visible');
elseif bitand(starting_region_code, ending_region_code) != 0
  display('Not Visible');
elseif bitand(starting_region_code, ending_region_code) == 0
  display('Clipping Candidate');
endif


figure;
hold on;
plot(windowx, windowy);
plot([line_starting_x line_ending_x], [line_starting_y line_ending_y]);
pause(5);
clf;

if bitand(starting_region_code, 8) > 0
  line_starting_y = ymax;
endif
if bitand(starting_region_code, 4) > 0
  line_starting_y = ymin;
endif
if bitand(starting_region_code, 2) > 0
  line_starting_x = xmax;
endif
if bitand(starting_region_code, 1) > 0
  line_starting_x = xmin;
endif

if bitand(ending_region_code, 8) > 0
  line_ending_y = ymax;
endif
if bitand(ending_region_code, 4) > 0
  line_ending_y = ymin;
endif
if bitand(ending_region_code, 2) > 0
  line_ending_x = xmax;
endif
if bitand(ending_region_code, 1) > 0
  line_ending_x = xmin;
endif


hold on;
plot(windowx, windowy);
plot([line_starting_x line_ending_x], [line_starting_y line_ending_y]);










