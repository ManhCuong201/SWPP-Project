--CREATE DATABASE [SWP_Project]
CREATE TABLE [Role] (
	[RoleID] int IDENTITY(1, 1) PRIMARY KEY,
	[roleName] nvarchar(255)
);

CREATE TABLE [User](
	[UserID] int IDENTITY(1, 1) PRIMARY KEY,
	[sex] bit,
	[activeStatus] bit,
	[username] varchar(255),
	[password] varchar(255),
	[dob] date,
	[email] varchar(255),
	[phoneNumber] varchar(10),
	[cash] int,
	[address] nvarchar(255),
	[RoleID] int REFERENCES [Role]([RoleID])
);

CREATE TABLE [Rating](
	[MentorID] int REFERENCES [User]([UserID]),
	[MenteeID] int REFERENCES [User]([UserID]),
	[noStar] int,
	[ratingComment] text
);

CREATE TABLE [Report](
	[ReportContent] text,
	[ReportBy] varchar(255),
	[reportTime] datetime,
	[UserID] int REFERENCES [User]([UserID])
);

CREATE TABLE [Conversation](
	[conversationID] int IDENTITY(1,1) PRIMARY KEY,
	[MentorID] int REFERENCES [User]([UserID]),
	[MenteeID] int REFERENCES [User]([UserID])
);

CREATE TABLE [Message](
	[conversationID] int REFERENCES [Conversation]([conversationID]),
	[sentBy] varchar(255),
	[sentAt] datetime,
	[msgContent] text
);

CREATE TABLE [Course](
	[courseID] int IDENTITY(1,1) PRIMARY KEY,
	[CourseTime] date,
	[CourseName] nvarchar(255),
	[courseDescription] text,
	[createAt] datetime
);

CREATE TABLE [Category](
	[categoryID] int IDENTITY(1,1) PRIMARY KEY,
	[categoryName] nvarchar(255),
);

CREATE TABLE [CourseCategory](
	[categoryID] int REFERENCES [Category]([categoryID]),
	[courseID] int REFERENCES [Course]([courseID])
);

CREATE TABLE [Participate](
	[courseID] int REFERENCES [Course]([courseID]),
	[MentorID] int REFERENCES [User]([UserID]),
	[MenteeID] int REFERENCES [User]([UserID])
);

CREATE TABLE [Skills](
	[SkillID] int IDENTITY(1,1) PRIMARY KEY,
	[SkillName] nvarchar(255)
);

CREATE TABLE [Mentee](
	[Avatar] nvarchar(255),
	fullname nvarchar(255),
	[UserID] int REFERENCES [User]([UserID])
);

CREATE TABLE [Mentor](
	[UserID] int REFERENCES [User]([UserID]),
	[Avatar] nvarchar(255),
	[Description] nvarchar(255),
	fullname nvarchar(255),
	[CV] nvarchar(255),
	[Achivement] nvarchar(255)
);

CREATE TABLE [MentorSkills](
	[SkillID] int REFERENCES [Skills]([SkillID]),
	[MentorID] int REFERENCES [User]([UserID])
);