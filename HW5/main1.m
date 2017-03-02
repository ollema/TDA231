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


%% Problem 1.2
clc, clear
data = load('medium_100_10k.mat');
vocab = data.vocab;
wordemb = data.wordembeddings;

[~, ~, ~, D] = kmeans(wordemb, 10);
 
%% a)
clc
[~, I] = sort(D);
closestWords = vocab(I(1:10,:));
disp(closestWords)

%% b)
clc, clear D, clear closestWords, clear I
[~, ~, ~, D] = kmeans(wordemb, 10, 'Replicates', 1);

%%



