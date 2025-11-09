IF OBJECT_ID('sp_AddMemberWithTwoSubscriptions','P') IS NOT NULL DROP PROCEDURE sp_AddMemberWithTwoSubscriptions;
GO
CREATE PROCEDURE sp_AddMemberWithTwoSubscriptions
    @MemberID INT,
    @Name VARCHAR(100),
    @MembershipType VARCHAR(50),
    @JoinDate DATE,
    @Sub1 INT,
    @Sub2 INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO Members(MemberID, Name, MembershipType, JoinDate)
        VALUES (@MemberID, @Name, @MembershipType, @JoinDate);

        INSERT INTO MemberSubscriptions(MemberID, SubscriptionID, StartDate)
        VALUES (@MemberID, @Sub1, CAST(GETDATE() AS DATE));

        INSERT INTO MemberSubscriptions(MemberID, SubscriptionID, StartDate)
        VALUES (@MemberID, @Sub2, CAST(GETDATE() AS DATE));

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        RAISERROR ('Insert failed. Transaction rolled back.', 16, 1);
    END CATCH
END
GO
