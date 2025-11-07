-- Revenue per type = sum of MonthlyFee of all subscriptions held by members of that type.
SELECT TOP 1
       m.MembershipType,
       SUM(s.MonthlyFee) AS TotalRevenue
FROM Members m
LEFT JOIN MemberSubscriptions ms ON ms.MemberID = m.MemberID
LEFT JOIN Subscriptions s        ON s.SubscriptionID = ms.SubscriptionID
GROUP BY m.MembershipType
ORDER BY TotalRevenue DESC;
