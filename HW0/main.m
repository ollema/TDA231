hold on
mu = [1 1];
sigma = [0.1 -0.05; -0.05 0.2];
data = generate_data(mu, sigma, 1000);

scatter(data)
%%
%f=@(x,y,r)
f=@(x,r)function_p21(x,r);
ezplot(@(x,y)f([x,y]',1))


%I dont know if ezplot is the best method to use to plot the level curves
%look up other methtods.... contour plots