
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/10/2015 23:22:25
-- Generated from EDMX file: C:\Users\LilyX_000\Documents\Visual Studio 2013\Projects\CMP494-594\CMP494-594\Models\ERmodel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CMPS594];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_StudentAccountConcentration_StudentAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentAccountConcentration] DROP CONSTRAINT [FK_StudentAccountConcentration_StudentAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentAccountConcentration_Concentration]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentAccountConcentration] DROP CONSTRAINT [FK_StudentAccountConcentration_Concentration];
GO
IF OBJECT_ID(N'[dbo].[FK_ConcentrationCourses_Concentration]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ConcentrationCourses] DROP CONSTRAINT [FK_ConcentrationCourses_Concentration];
GO
IF OBJECT_ID(N'[dbo].[FK_ConcentrationCourses_Courses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ConcentrationCourses] DROP CONSTRAINT [FK_ConcentrationCourses_Courses];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[StudentAccounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentAccounts];
GO
IF OBJECT_ID(N'[dbo].[Concentrations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Concentrations];
GO
IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[StudentAccountConcentration]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentAccountConcentration];
GO
IF OBJECT_ID(N'[dbo].[ConcentrationCourses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ConcentrationCourses];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'StudentAccounts'
CREATE TABLE [dbo].[StudentAccounts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Wnumber] bigint  NOT NULL,
    [GPA] smallint  NULL
);
GO

-- Creating table 'Concentrations'
CREATE TABLE [dbo].[Concentrations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ConName] nvarchar(max)  NOT NULL,
    [MiniCredit] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [Credit] nvarchar(max)  NOT NULL,
    [Grade] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StudentAccountConcentration'
CREATE TABLE [dbo].[StudentAccountConcentration] (
    [StudentAccount_Wnumber] bigint  NOT NULL,
    [Concentrations_Id] int  NOT NULL
);
GO

-- Creating table 'ConcentrationCourses'
CREATE TABLE [dbo].[ConcentrationCourses] (
    [Concentration_Id] int  NOT NULL,
    [Courses_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Wnumber] in table 'StudentAccounts'
ALTER TABLE [dbo].[StudentAccounts]
ADD CONSTRAINT [PK_StudentAccounts]
    PRIMARY KEY CLUSTERED ([Wnumber] ASC);
GO

-- Creating primary key on [Id] in table 'Concentrations'
ALTER TABLE [dbo].[Concentrations]
ADD CONSTRAINT [PK_Concentrations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [StudentAccount_Wnumber], [Concentrations_Id] in table 'StudentAccountConcentration'
ALTER TABLE [dbo].[StudentAccountConcentration]
ADD CONSTRAINT [PK_StudentAccountConcentration]
    PRIMARY KEY CLUSTERED ([StudentAccount_Wnumber], [Concentrations_Id] ASC);
GO

-- Creating primary key on [Concentration_Id], [Courses_Id] in table 'ConcentrationCourses'
ALTER TABLE [dbo].[ConcentrationCourses]
ADD CONSTRAINT [PK_ConcentrationCourses]
    PRIMARY KEY CLUSTERED ([Concentration_Id], [Courses_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StudentAccount_Wnumber] in table 'StudentAccountConcentration'
ALTER TABLE [dbo].[StudentAccountConcentration]
ADD CONSTRAINT [FK_StudentAccountConcentration_StudentAccount]
    FOREIGN KEY ([StudentAccount_Wnumber])
    REFERENCES [dbo].[StudentAccounts]
        ([Wnumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Concentrations_Id] in table 'StudentAccountConcentration'
ALTER TABLE [dbo].[StudentAccountConcentration]
ADD CONSTRAINT [FK_StudentAccountConcentration_Concentration]
    FOREIGN KEY ([Concentrations_Id])
    REFERENCES [dbo].[Concentrations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentAccountConcentration_Concentration'
CREATE INDEX [IX_FK_StudentAccountConcentration_Concentration]
ON [dbo].[StudentAccountConcentration]
    ([Concentrations_Id]);
GO

-- Creating foreign key on [Concentration_Id] in table 'ConcentrationCourses'
ALTER TABLE [dbo].[ConcentrationCourses]
ADD CONSTRAINT [FK_ConcentrationCourses_Concentration]
    FOREIGN KEY ([Concentration_Id])
    REFERENCES [dbo].[Concentrations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Courses_Id] in table 'ConcentrationCourses'
ALTER TABLE [dbo].[ConcentrationCourses]
ADD CONSTRAINT [FK_ConcentrationCourses_Courses]
    FOREIGN KEY ([Courses_Id])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConcentrationCourses_Courses'
CREATE INDEX [IX_FK_ConcentrationCourses_Courses]
ON [dbo].[ConcentrationCourses]
    ([Courses_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------