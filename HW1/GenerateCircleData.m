function [CircleDataContainer] = GenerateCircleData(radii,center)
    nCircles=numel(radii);
    CircleDataContainer=cell(1,nCircles);
    for i=1:nCircles
        radius=radii(i);
        angles=linspace(0,2*pi,round(100*radius))';
        nAngles=numel(angles);
        CircleDataContainer{i}=radius*(...
            [cos(angles),sin(angles)])+...
            repmat(center,nAngles,1);
    end
end

