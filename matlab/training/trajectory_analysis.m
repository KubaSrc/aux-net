close all; clear all; clc;
warning('off', 'all');

%%
figure(1); clf; hold on; grid on;

motor_inputs = load('./experiments/circle_2024_02_06_16_35_44/LSTM_circle_trajectory_inputs.mat').output;
wp = load('./experiments/circle_2024_02_06_16_35_44/circle_trajectory.mat').wp;
T = readtable('./experiments/circle_2024_02_06_16_35_44/positions.csv');

plot3(T.x_end_avg.*1000,T.y_end_avg.*1000,T.z_end_avg.*1000,'LineWidth',1.5,'DisplayName','measured');
plot3(wp(:,1),wp(:,2),wp(:,3),'lineWidth',1.5,'DisplayName','actual')

xlabel('x (mm)')
ylabel('y (mm)')
zlabel('z (mm)')

legend()


l_delta = load("./trajectory/delta_fast_repeat.mat").delta_fast;