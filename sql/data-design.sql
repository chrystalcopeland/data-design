
ALTER DATABASE canderson73 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!

DROP TABLE IF EXISTS `like`;
DROP TABLE IF EXISTS tweet;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileId             BINARY(16)   NOT NULL,
	profileName           VARCHAR(128) NOT NULL,
	profilePhoto          VARCHAR(3600),
	profileEmail          VARCHAR(128) NOT NULL,
	profileDescription    VARCHAR(128) NOT NULL,
	profilePetDescription VARCHAR(128)

	UNIQUE (profileId),
	UNIQUE(profileEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);

-- create the tweet entity
CREATE TABLE tweet (
	-- this is for yet another primary key...
	tweetId BINARY(16) NOT NULL,
	-- this is for a foreign key
	tweetProfileId BINARY(16) NOT NULL,
	tweetContent VARCHAR(140) NOT NULL,
	tweetDate DATETIME(6) NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(tweetProfileId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(tweetProfileId) REFERENCES profile(profileId),
	-- and finally create the primary key
	PRIMARY KEY(tweetId)