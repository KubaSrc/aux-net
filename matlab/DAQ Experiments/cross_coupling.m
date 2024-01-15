clear all; clc; close all;

% Connect to device
dq = daq("ni");
dq.Rate = 10000;
t_read = 20;

% Define output channels
ch1 = addinput(dq, "Dev1", "ai0", "Voltage");
ch2 = addinput(dq, "Dev1", "ai4", "Voltage");
ch3 = addinput(dq, "Dev1", "ai5", "Voltage");
ch4 = addinput(dq, "Dev1", "ai6", "Voltage");
ch1.TerminalConfig = "SingleEnded";
ch2.TerminalConfig = "SingleEnded";
ch3.TerminalConfig = "SingleEnded";
ch4.TerminalConfig = "SingleEnded";

save_data = true;

%% Collect data

data = read(dq, seconds(t_read), "OutputFormat", "Matrix");
t = 0:(1/dq.Rate):(t_read-(1/dq.Rate));
t = t';

% Apply threshold to data
data(data<2.5) = 0;
data(data>2.5) = 1;

chA = data(:,1);
chB = data(:,2);
chC = data(:,3);
chD = data(:,4);

input_pos = decodeQuadrature(chA,chB).*(2*pi/1024);
output_pos = decodeQuadrature(chC,chD).*(2*pi/1024);

figure(1); clf; hold on
plot(t,output_pos);
plot(t,input_pos);


if save_data
    save('theta_12.mat','input_pos','output_pos', 't');
end
%% Function for decoding signal from encoders
function pos_array = decodeQuadrature(signalA, signalB)
    pos_array = zeros(size(signalA));
    position = 0;
    lastA = signalA(1);
    lastB = signalB(1);

    for i = 2:length(signalA)
        currentA = signalA(i);
        currentB = signalB(i);

        if lastA == 0 && currentA == 1
            % A rising edge
            if currentB == 0
                position = position + 1; % Forward step
            else
                position = position - 1; % Backward step
            end
        end
        pos_array(i) = position; 
        lastA = currentA;
        lastB = currentB;
    end
end
