SELECT m.MemberID, m.Name, m.MembershipType, m.JoinDate
FROM Members m
LEFT JOIN MemberSubscriptions ms ON ms.MemberID = m.MemberID
WHERE ms.MemberID IS NULL
ORDER BY m.MemberID;
