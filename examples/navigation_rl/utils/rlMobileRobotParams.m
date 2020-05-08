% Parameters for Navigation Example
% Copyright 2019 The MathWorks, Inc.

%% Main parameters
load exampleMap
robotRadius = 0.25;
sampleTime = 0.1;

%% Lidar sensor parameters
scanAngles = [-4*pi/12;-3*pi/12;-2*pi/12;-pi/12;0;pi/12;2*pi/12;3*pi/12;4*pi/12];
maxRange = 6;
lidarNoiseVariance = 0.1^2;
lidarNoiseSeeds = randi(intmax,size(scanAngles));

%% Path planner parameters
prmConnectionDistance = 3;
prmNumNodes = 100;
prmMaxWaypoints = 100;

%% Path follower parameters
followerLinSpeed = 0.3;
followerMaxAngSpeed = 1;
followerLookaheadDistance = 1.5;
goalCheckDistance = 0.2;

%% Reinforcement learning agent parameters
%load savedAgent
maxAngSpeed = 0.5;
maxLinSpeed = 1;

%% Initial conditions
initX = 3;
initY = 3;
initTheta = 0;

%% Initial target
tarX=12;
tarY=11;

%% target distance as a state
numState=numel(scanAngles)+4;
lowerLimit=zeros(numState,1);
upperLimit=ones(numState,1)*maxRange;
upperLimit(numel(scanAngles)+1)=diff(map.XWorldLimits);
upperLimit(numel(scanAngles)+2)=diff(map.YWorldLimits);
upperLimit(numel(scanAngles)+3)=maxAngSpeed;
upperLimit(numel(scanAngles)+4)=maxLinSpeed;
