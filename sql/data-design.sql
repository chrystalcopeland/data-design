
ALTER DATABASE canderson73 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!

DROP TABLE IF EXISTS `like`;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileId             BINARY(16)   NOT NULL,
	-- Primary Key
	profileName           VARCHAR(32) NOT NULL,
	profilePhoto          VARCHAR(511),
	profileEmail          VARCHAR(144) NOT NULL,
	profileDescription    VARCHAR(144) NOT NULL,
	profilePetDescription VARCHAR(144),

	UNIQUE(profileEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);

-- create destinations
CREATE TABLE destination (
	-- Destinations Table
	destinationID          BINARY(16)    NOT NULL,
	-- this is a primary key
	destinationName        VARCHAR(128)  NOT NULL,
	destinationDescription VARCHAR(3600) NOT NULL,
	destinationLocation    VARCHAR(3600) NOT NULL
	-- this creates an index before making a foreign key
);
CREATE TABLE `savedDestination` (
	-- Capture 'saved destinations' for this user
	savedDestinationID BINARY(16) NOT NULL,
	-- foreign key
	saveDate DATETIME(6) NOT NULL,
	-- index the foreign keys
	INDEX(savedDestinationID),
	-- create the foreign key relations
	FOREIGN KEY(savedDestinationID) REFERENCES profile(profileId))
