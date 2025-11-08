SELECT m.MemberID, m.Name, COUNT(ms.SubscriptionID) AS SubscriptionCount
FROM Members m
JOIN MemberSubscriptions ms ON ms.MemberID = m.MemberID
GROUP BY m.MemberID, m.Name
HAVING COUNT(ms.SubscriptionID) > 1
ORDER BY SubscriptionCount DESC, m.MemberID;
