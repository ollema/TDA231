%%  Test 1
net(1e7, 7, 10, 0, 0, false, 4)

%% Test 2
net(0, 7, 10, 0, 0, false, 4)

%% Problem 2.2
net(0.1, 7, 10, 0, 0, false, 4)

%% Problem 2.3 Initial run
clc
net(0, 10, 70, 0.005, 0, false, 4)

%% Inital run 2
clc
net(0, 10, 70, 0.5, 0, false, 4)

%% Initial run 
clc
net(0, 10, 70, 0.5, 0.9, false, 4)

%% run i
clc
lr = [0.002 0.01 0.05 0.2 1.0 5.0 20.0];
net(0, 10, 70, lr(4), 0.9, fal  se, 4)

%% Problem 2.4 a)
clc
net(0, 200, 1000, 0.35, 0.9, false, 100)

%% Problem 2.4 b)
clc
net(0, 200, 1000, 0.35, 0.9, true, 100)
%% Problem 2.4 c)
clc
wd = [0.0001 0.001 1 5 10];
net(wd(5), 200, 1000, 0.35, 0.9, false, 100)

%% Problem 2.4 d)
clc
brain = [10 30 100 130 200];
net(0, brain(5), 1000, 0.35, 0.9, false, 100)

%% Problem 2.4 e)
clc
brain = [18 37 83 113 236];
net(0, brain(2), 1000, 0.35, 0.9, true, 100)
