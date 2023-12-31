frequency = 1.7e9;
wavelength = physconst('LightSpeed') / frequency;
overallHeight = 0.25 * wavelength;
bentHeight = 0.14 * wavelength;
groundPlaneLength = wavelength;
groundPlaneWidth = wavelength;
radius = 0.25e-3 * wavelength;

monopole = invertedL('Height', bentHeight, 'Width', radius * 2, 'length', overallHeight - bentHeight ,'GroundPlaneLength', groundPlaneLength, 'GroundPlaneWidth', groundPlaneWidth);


figure;
show(monopole);

freqRange = linspace(1.7e9, 1.7e9, 1);  % Single frequency point
impedance = impedance(monopole, freqRange);

disp(['Input Resistance: ' num2str(real(impedance)) ' ohms']);

vswr50 = vswr(monopole, frequency, 50);

disp(['VSWR: ' num2str(vswr50)]);

pattern(monopole, frequency);