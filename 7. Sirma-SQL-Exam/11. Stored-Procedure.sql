IF OBJECT_ID('sp_GetMembersByType','P') IS NOT NULL DROP PROCEDURE sp_GetMembersByType;
GO
CREATE PROCEDURE sp_GetMembersByType
    @MembershipType VARCHAR(50)
AS
BEGIN
    SELECT MemberID, Name, MembershipType, JoinDate
    FROM Members
    WHERE MembershipType = @MembershipType
    ORDER BY Name;
END
GO
