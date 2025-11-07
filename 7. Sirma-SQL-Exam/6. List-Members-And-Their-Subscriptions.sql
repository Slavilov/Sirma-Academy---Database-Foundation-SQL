SELECT m.MemberID,
       m.Name,
       m.MembershipType,
       m.JoinDate,
       s.TypeName,
       s.MonthlyFee,
       ms.StartDate
FROM Members m
LEFT JOIN MemberSubscriptions ms ON ms.MemberID = m.MemberID
LEFT JOIN Subscriptions s        ON s.SubscriptionID = ms.SubscriptionID
ORDER BY m.MemberID, s.TypeName;
