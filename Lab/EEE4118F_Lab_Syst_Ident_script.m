% Make the data importable to simulink so it can be plotted over the
% simulated results.

LDisk = timeseries(ServoMotorDataLightDisk.Motor_vel, ServoMotorDataLightDisk.Time);
LDiskLBrake = timeseries(ServoMotorDataLightBrakeLightDisk.Motor_vel, ServoMotorDataLightBrakeLightDisk.Time);
LDiskHBrake = timeseries(ServoMotorDataHeavyBrakeLightDisk.Motor_vel, ServoMotorDataHeavyBrakeLightDisk.Time);
HDisk = timeseries(ServoMotorDataHeavyDisk.Motor_vel, ServoMotorDataHeavyDisk.Time);

% Use least squares regression to get smoother data.

p1 = polyfit(ServoMotorDataLightDisk.Time, ServoMotorDataLightDisk.Motor_vel, 150);
smooth1 = polyval(p1, ServoMotorDataLightDisk.Time);
LDiskSmooth = timeseries(smooth1, ServoMotorDataLightDisk.Time);

p2 = polyfit(ServoMotorDataLightBrakeLightDisk.Time, ServoMotorDataLightBrakeLightDisk.Motor_vel, 150);
smooth2 = polyval(p2, ServoMotorDataLightBrakeLightDisk.Time);
LDiskLBrakeSmooth = timeseries(smooth2, ServoMotorDataLightBrakeLightDisk.Time);

p3 = polyfit(ServoMotorDataHeavyBrakeLightDisk.Time, ServoMotorDataHeavyBrakeLightDisk.Motor_vel, 150);
smooth3 = polyval(p3, ServoMotorDataHeavyBrakeLightDisk.Time);
LDiskHBrakeSmooth = timeseries(smooth3, ServoMotorDataHeavyBrakeLightDisk.Time);

p4 = polyfit(ServoMotorDataHeavyDisk.Time, ServoMotorDataHeavyDisk.Motor_vel, 150);
smooth4 = polyval(p4, ServoMotorDataHeavyDisk.Time);
HDiskSmooth = timeseries(smooth4, ServoMotorDataHeavyDisk.Time);


% Plot the dead zone and operational zone of the motor by plotting the ramp
% test

%plot(ServoMotorDataRampTest_negative2_2.Time, ServoMotorDataRampTest_negative2_2.r_t)
%hold on
%plot(ServoMotorDataRampTest_negative2_2.Time, ServoMotorDataRampTest_negative2_2.Motor_vel)
%hold off
%legend("r_t(volts)", "Motor velocity(volts)")
%title("Ramp test showing the region of operation of the Motor")
%xlabel("Time (seconds)")
%ylabel("Voltage (volts)")

figure
plot(ServoMotorDataLightDisk.Time, ServoMotorDataLightDisk.Motor_vel);
hold on
plot(ServoMotorDataLightDisk.Time, ServoMotorDataLightDisk.r_t);
hold off
title("Step Response for Light Disk No Braking")
ylabel("Voltage (V)")
xlabel("Time (s)")

figure
plot(ServoMotorDataLightBrakeLightDisk.Time, ServoMotorDataLightBrakeLightDisk.Motor_vel);
hold on
plot(ServoMotorDataLightBrakeLightDisk.Time, ServoMotorDataLightBrakeLightDisk.r_t);
hold off
title("Step Response for Light Disk Light Braking")
ylabel("Voltage (V)")
xlabel("Time (s)")

figure
plot(ServoMotorDataHeavyBrakeLightDisk.Time, ServoMotorDataHeavyBrakeLightDisk.Motor_vel);
hold on
plot(ServoMotorDataHeavyBrakeLightDisk.Time, ServoMotorDataHeavyBrakeLightDisk.r_t);
hold off
title("Step Response for Light Disk Heavy Braking")
ylabel("Voltage (V)")
xlabel("Time (s)")

figure
plot(ServoMotorDataHeavyDisk.Time, ServoMotorDataHeavyDisk.Motor_vel);
hold on
plot(ServoMotorDataHeavyDisk.Time, ServoMotorDataHeavyDisk.r_t);
hold off
title("Step Response for Heavy Disk No Braking")
ylabel("Voltage (V)")
xlabel("Time (s)")