f=@(x)function_p21(x);
ezplot(@(x,y)f([x,y]'),1)
%t=linspace(-2,2,100);
%[X,Y]=meshgrid(t,t);
%Z=f([X,Y]')
%I dont know if ezplot is the best method to use to plot the level curves
%look up other methtods.... contour plots

%%
A=[1,0;0,1];
x=[1,1;2,1;3,1]';
%%
f([1,1]')