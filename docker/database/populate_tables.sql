-- Create User agusmazzeo 
INSERT INTO Users (username, password) VALUES ('amazzeo', 'amazzeo');

-- Create Router
INSERT INTO Routers (latitude, longitude, description) VALUES ('-34.559870', '-58.456222', 'My first router');

-- Create ENDPOINT DeviceType
INSERT INTO DeviceType (name, description) VALUES ('ENDPOINT', 'Endpoint device directly connected to physical inputs/outpus.');

-- Create OUTPUT PinType
INSERT INTO PinType (name, description) VALUES ('OUTPUT', 'Output pin with boolean values.');

-- Create a CronPeriod example (Start Hour 00:00:0000, Time ON 1000ms, Time OFF 1000ms)
INSERT INTO CronPeriods (start_offset, time_on, time_off) VALUES (0, 1000, 1000);

-- Create One Device
INSERT INTO Devices (mac_id, description, type_id, router_id) VALUES ('ABCDEFG', 'My first created device.', 1, 1);

-- Create One DevicePin
INSERT INTO DevicePin (device_id, description, type_id, value, device_pin_id, cron_id) VALUES (1, 'One invented pin.', 1, 0, 'D6', 1);

-- Create UsersToDevice register
INSERT INTO UsersToDevices (user_id, device_id) VALUES (1, 1);
