IF DB_ID(N'RelationsExercisesDB') IS NOT NULL
BEGIN
    ALTER DATABASE RelationsExercisesDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RelationsExercisesDB;
END;
GO

CREATE DATABASE RelationsExercisesDB;
GO
USE RelationsExercisesDB;
GO
