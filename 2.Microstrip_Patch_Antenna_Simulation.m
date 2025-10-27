%% Microstrip Patch Antenna Simulation
clc; clear; close all;

% Given Parameters
f0 = 2.4e9;       % Resonant frequency (Hz)
c = 3e8;          % Speed of light
er = 4.4;         % Relative permittivity (FR4)
h = 1.6e-3;       % Substrate thickness (m)

% Patch width
W = c/(2*f0)*sqrt(2/(er+1));

% Effective dielectric constant
eeff = (er+1)/2 + (er-1)/2*(1+12*h/W)^(-0.5);

% Patch length (approx)
deltaL = 0.412*h*(eeff+0.3)*(W/h + 0.264)/((eeff-0.258)*(W/h+0.8));
L = c/(2*f0*sqrt(eeff)) - 2*deltaL;

fprintf('Patch Width W = %.3f m\n', W);
fprintf('Patch Length L = %.3f m\n', L);

%% Reflection Coefficient (S11) Simulation
f = linspace(2e9, 2.8e9, 500);
S11 = 20*log10(abs((f-f0)./f0)); % Simplified placeholder formula

figure;
plot(f/1e9, S11, 'LineWidth',2);
grid on; xlabel('Frequency (GHz)'); ylabel('S11 (dB)');
title('Microstrip Patch Antenna Return Loss');

%% 2D Radiation Pattern (E-plane)
theta = linspace(0,2*pi,360);
pattern = (cos(pi*W/c*f0*cos(theta))).^2; % Simplified E-plane pattern

figure;
polarplot(theta, pattern,'LineWidth',2);
title('2D Radiation Pattern (E-plane)');
