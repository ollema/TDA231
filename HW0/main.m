%f=@(x,y,r)
hold on
f=@(x,r)function_p21(x,r);
ezplot(@(x,y)f([x,y]',1))
%I dont know if ezplot is the best method to use to plot the level curves
%look up other methtods.... contour plots