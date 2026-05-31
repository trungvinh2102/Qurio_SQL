SELECT
  P."fullName",
  SUM(B."totalPrice") AS total_revenue,
  COUNT(B."id") AS total_bookings,
  SUM(B."totalPrice") / COUNT(B."id") AS average_revenue_per_booking
FROM "public"."Profile" AS P
JOIN "public"."Experience" AS E
  ON P."id" = E."hostId"
JOIN "public"."Booking" AS B
  ON E."id" = B."experienceId"
GROUP BY
  P."id",
  P."fullName"
ORDER BY
  average_revenue_per_booking ASC
LIMIT 100;




