function [] = SupremePlot(data)
    hold on
    plot(data(:,1),data(:,2)','.k','DisplayName','Data sample');
    [mu,sigma]=sge(data);
    distancesFromCenter=GetDistancesFromCenter(data,mu);
    radii=(1:3)*sigma;
    colorVector=['r','m','b'];
    CircleDataContainer=GenerateCircleData(radii,mu);
    nCircles=numel(CircleDataContainer);
    for i=1:nCircles
        circleCoord=CircleDataContainer{i};
        nPointsOutside=nnz(distancesFromCenter>radii(i));
        legendText=['Points outside',' ',num2str(i),'\sigma',...
            ' ',num2str(nPointsOutside)];
        plot(circleCoord(:,1),circleCoord(:,2),colorVector(i),...
            'LineWidth',1.5,'DisplayName',legendText);
    end
    legend('show');
    hold off
end

