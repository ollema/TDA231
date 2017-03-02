%% Problem 1.1

% b)
clc, clear
data = load('hw5_p1a.mat');
X = data.X';
k = 2;
initClass = randi(1:k, 1, size(X,2));

% profile on
tic
kmc = KMeansCluster(k, 'linear_kernel', X, initClass, 'UpdatePlot', true);
toc
gscatter(X(1,:), X(2,:), kmc{2,1})

% profile viewer

%% d)
clc, clear
data = load('hw5_p1b.mat');
X = data.X';
k = 2;
initClass = randi(1:k, 1, size(X,2));

% profile on
tic
kmc = KMeansCluster(k, 'rbf_kernel', X, initClass, 'UpdatePlot', true);
toc
gscatter(X(1,:), X(2,:), kmc{2,1})

% profile viewer
