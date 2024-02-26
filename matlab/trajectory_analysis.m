close all; clear all; clc;
warning('off', 'all');

home_pos = load('./training/state/home_measured.mat').pos;

%% Plotting out trajectory runs (circle)

% DNN
exp_DNN = 'circle_2024_02_21_15_16_35';
motor_inputs = load(['./training/experiments/',exp_DNN,'/DNN_circle_trajectory_inputs.mat']).output;
wp_DNN = load(['./training/experiments/',exp_DNN,'/circle_trajectory.mat']).wp;
T_DNN = readtable(['./training/experiments/',exp_DNN,'/positions.csv']);

figure(1); clf;
hold on; grid on; axis equal;
set(gcf, 'Color', 'white');
set(gcf,'Units', 'inches','Position',[1,1,3.5,3]); % Adjusted for 2x1 layout

% View 1: XY
xlim([-100,100]);
ylim([-100,100]);

% DNN plot for the first tile
plot3(T_DNN.x_end_avg.*1000-home_pos(1),T_DNN.y_end_avg.*1000-home_pos(2),T_DNN.z_end_avg.*1000-home_pos(3),'-x','MarkerSize',8,'LineWidth',2,'DisplayName','DNN');
plot3(wp_DNN(:,1)-home_pos(1),wp_DNN(:,2)-home_pos(2),wp_DNN(:,3)-home_pos(3),'-','Color','k','LineWidth',2,'DisplayName','actual');
legend('Location', 'northeastoutside');

% Adjusting the first plot's appearance
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 1.5;

% Tile 2: X-Z
figure(2); clf;
hold on; grid on; axis equal;
set(gcf, 'Color', 'white');
set(gcf,'Units', 'inches','Position',[1,1,3.5,1.75]); % Adjusted for 2x1 layout

xlim([-100,100]);
ylim([0,100]);

% Replotting for the second tile with X-Z view
% Note: Y-axis values are not needed for X-Z plot, so we use Z values as Y-axis here
plot(T_DNN.x_end_avg.*1000-home_pos(1),T_DNN.z_end_avg.*1000-home_pos(3),'-x','MarkerSize',8,'LineWidth',2,'DisplayName','DNN');
plot(wp_DNN(:,1)-home_pos(1),wp_DNN(:,3)-home_pos(3),'-','Color','k','LineWidth',2,'DisplayName','actual');
% legend('Location', 'bestoutside');

% Adjusting the second plot's appearance
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 1.5;


%% Plotting out trajectory runs (triangle)

% DNN
exp_DNN = 'triangle_2024_02_22_15_48_39';
motor_inputs = load(['./training/experiments/',exp_DNN,'/DNN_triangle_trajectory_inputs.mat']).output;
wp_DNN = load(['./training/experiments/',exp_DNN,'/triangle_trajectory.mat']).wp;
T_DNN = readtable(['./training/experiments/',exp_DNN,'/positions.csv']);

figure(3); clf;
hold on; grid on; axis equal;
set(gcf, 'Color', 'white');
set(gcf,'Units', 'inches','Position',[1,1,3.5,3]); % Adjusted for 2x1 layout

% View 1: XY
xlim([-100,100])
ylim([-100,100])

% DNN plot for the first tile
plot3(T_DNN.x_end_avg.*1000-home_pos(1),T_DNN.y_end_avg.*1000-home_pos(2),T_DNN.z_end_avg.*1000-home_pos(3),'-x','MarkerSize',8,'LineWidth',2,'DisplayName','DNN');
plot3(wp_DNN(:,1)-home_pos(1),wp_DNN(:,2)-home_pos(2),wp_DNN(:,3)-home_pos(3),'-','Color','k','LineWidth',2,'DisplayName','actual');
% legend('Location', 'best');

% Adjusting the first plot's appearance
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 1.5;

% Tile 2: X-Z
figure(4); clf;
hold on; grid on; axis equal;
set(gcf, 'Color', 'white');
set(gcf,'Units', 'inches','Position',[1,1,3.5,1.75]); % Adjusted for 2x1 layout

xlim([-100,100]);
ylim([0,100]);

% Replotting for the second tile with X-Z view
% Note: Y-axis values are not needed for X-Z plot, so we use Z values as Y-axis here
plot(T_DNN.x_end_avg.*1000-home_pos(1),T_DNN.z_end_avg.*1000-home_pos(3),'-x','MarkerSize',8,'LineWidth',2,'DisplayName','DNN');
plot(wp_DNN(:,1)-home_pos(1),wp_DNN(:,3)-home_pos(3),'-','Color','k','LineWidth',2,'DisplayName','actual');
% legend('Location', 'bestoutside');

% Adjusting the second plot's appearance
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 1.5;
%% Plotting out trajectory runs (line)
figure(3); clf; hold on; grid on; axis equal;

% DNN
exp_DNN = 'line_2024_02_22_17_32_07';
motor_inputs = load(['./training/experiments/',exp_DNN,'/DNN_line_trajectory_inputs.mat']).output;
wp_DNN = load(['./training/experiments/',exp_DNN,'/line_trajectory.mat']).wp;
T_DNN = readtable(['./training/experiments/',exp_DNN,'/positions.csv']);


figure(5); clf;
hold on; grid on; axis equal;
set(gcf, 'Color', 'white');
set(gcf,'Units', 'inches','Position',[1,1,3.5,3]); % Adjusted for 2x1 layout


% DNN plot for the first tile
plot(-(T_DNN.y_end_avg.*1000-home_pos(2)),T_DNN.x_end_avg.*1000-home_pos(1),'-x','MarkerSize',5,'LineWidth',1.5,'DisplayName','DNN');
plot(-(wp_DNN(:,2)-home_pos(2)),wp_DNN(:,1)-home_pos(1),'-','Color','k','LineWidth',1.5,'DisplayName','actual');
xlim([-100,100])
ylim([-100,100])


% Adjusting the first plot's appearance
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 1.5;

% Tile 2: X-Z
figure(6); clf;
hold on; grid on; axis equal;
set(gcf, 'Color', 'white');
set(gcf,'Units', 'inches','Position',[1,1,3.5,1.75]); % Adjusted for 2x1 layout

xlim([-100,100])
ylim([0,100])

% Replotting for the second tile with X-Z view
% Note: Y-axis values are not needed for X-Z plot, so we use Z values as Y-axis here
plot(-(T_DNN.y_end_avg.*1000-home_pos(2)),T_DNN.z_end_avg.*1000-home_pos(3),'-x','MarkerSize',8,'LineWidth',2,'DisplayName','DNN');
plot(-(wp_DNN(:,2)-home_pos(2)),wp_DNN(:,3)-home_pos(3),'-','Color','k','LineWidth',2,'DisplayName','actual');
% legend('Location', 'bestoutside');

% Adjusting the second plot's appearance
ax = gca;
ax.FontSize = 14;
ax.LineWidth = 1.5;
