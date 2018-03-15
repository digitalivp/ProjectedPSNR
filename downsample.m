function [ ptCloudB ] = downsample( name, desiredLevels )
%UNTITLED3 Voxelized downsampling of point cloud file.
%   downsample(name, desiredLevels) reads a point cloud file with name
%   'name' and voxelizes it using desiredLevels levels.

ptCloud = pcread(name);
range = max(abs([ptCloud.XLimits(2)-ptCloud.XLimits(1), ptCloud.YLimits(2)-ptCloud.YLimits(1), ptCloud.ZLimits(2)-ptCloud.ZLimits(1)]));
minLevels = ceil(log2(range));
scale = 2^(desiredLevels-minLevels-1);

shiftX = ptCloud.XLimits(2) + ptCloud.XLimits(1);
shiftY = ptCloud.YLimits(2) + ptCloud.YLimits(1);
shiftZ = ptCloud.ZLimits(2) + ptCloud.ZLimits(1);


V = ptCloud.Location;
V(:,1) = V(:,1) -  shiftX;
V(:,2) = V(:,2) -  shiftY;
V(:,3) = V(:,3) -  shiftZ;

ptCloudA = pointCloud(floor(V*scale+2^(desiredLevels-1)),'Color',ptCloud.Color,'Normal',ptCloud.Normal);
ptCloudB = pcdownsample(ptCloudA,'gridAverage',1);

end

