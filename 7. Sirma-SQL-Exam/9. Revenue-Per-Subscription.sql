SELECT s.SubscriptionID,
       s.TypeName,
       COUNT(ms.MemberID) AS MemberCount,
       COUNT(ms.MemberID) * s.MonthlyFee AS MonthlyRevenue
FROM Subscriptions s
LEFT JOIN MemberSubscriptions ms ON ms.SubscriptionID = s.SubscriptionID
GROUP BY s.SubscriptionID, s.TypeName, s.MonthlyFee
ORDER BY MonthlyRevenue DESC, s.TypeName;
