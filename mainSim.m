%% The Main Simulation Script for Chosen One II
% Blog link to come

% Author: David Ding
% Date: May 29, 2020

close all;
clear;
clc;

%% Start of Simuation
N = 100; % Number of Participants
winningCount = zeros(N, 1);
simCount = 1e5;

for k = 1:simCount
    soleSurvivor = getWinningPlayer(N); 
    winningCount(soleSurvivor) = winningCount(soleSurvivor) + 1;
    fprintf('Simulation %d done!\n', k);
end

%% Display in Histogram
figure;
bar(winningCount./sum(winningCount));
title('Bar Graph of Number of Times Each Player is the Sole Survivor');
xlabel('Player');
ylabel('Sole Survivor Count / Total Matches Simulated');

%% Graph with 1/x
figure;
bar(winningCount./sum(winningCount));
hold on;
alpVal = log(5)/log(4); % For 80-20 rule
plot(1:N, (winningCount(1)/sum(winningCount))./(1:N).^alpVal, 'LineWidth', 3);
legend('Raw Data', 'Curve of Best Fit');
xlabel('Player');
ylabel('Normalized Winning Count');
title('Fitting a Probability Distribution Curve');