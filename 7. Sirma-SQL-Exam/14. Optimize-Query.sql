SELECT m.Name, s.TypeName, s.MonthlyFee
FROM Members m
JOIN MemberSubscriptions ms ON ms.MemberID = m.MemberID
JOIN Subscriptions s        ON s.SubscriptionID = ms.SubscriptionID
JOIN (SELECT AVG(MonthlyFee) AS AvgFee FROM Subscriptions) A ON 1=1
WHERE s.MonthlyFee > A.AvgFee
ORDER BY s.MonthlyFee DESC, m.Name;
