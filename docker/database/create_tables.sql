CREATE TABLE PinType(
    type_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE DeviceType(
    type_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE Users (
	user_id INTEGER NOT NULL AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL DEFAULT '',
    password VARCHAR(255) NOT NULL DEFAULT '',
	PRIMARY KEY (user_id)
);

CREATE TABLE Routers (
	router_id INTEGER NOT NULL AUTO_INCREMENT,
    description VARCHAR(255) NULL,
	latitude DECIMAL(8,6) NULL,
    longitude DECIMAL(9,6) NULL,
	PRIMARY KEY (router_id)
);

CREATE TABLE Devices (
	device_id INTEGER NOT NULL AUTO_INCREMENT,
    mac_id VARCHAR(255) NOT NULL,
    description VARCHAR(255) NULL,
	type_id INTEGER NOT NULL,
    router_id INTEGER NULL,
	PRIMARY KEY (device_id),
    FOREIGN KEY (type_id) REFERENCES DeviceType(type_id),
    FOREIGN KEY (router_id) REFERENCES Routers(router_id)
);

-- Timedeltas saved in milliseconds
CREATE TABLE CronPeriods(
    cron_id INTEGER NOT NULL AUTO_INCREMENT,
    start_offset INTEGER NOT NULL,
    time_on INTEGER NOT NULL,
    time_off INTEGER NOT NULL,
    PRIMARY KEY (cron_id)
);

CREATE TABLE DevicePin (
	pin_id INTEGER NOT NULL AUTO_INCREMENT,
    device_id INTEGER NOT NULL,
    description VARCHAR(255) NULL,
	type_id INTEGER NULL,
    value INTEGER NULL,
    device_pin_id VARCHAR(255) NOT NULL,
    cron_id INTEGER NULL,
	PRIMARY KEY (pin_id),
    FOREIGN KEY (device_id) REFERENCES Devices(device_id),
    FOREIGN KEY (type_id) REFERENCES PinType(type_id),
    FOREIGN KEY (cron_id) REFERENCES CronPeriods(cron_id)
);

CREATE TABLE UsersToDevices(
    user_id INTEGER NOT NULL,
    device_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);
