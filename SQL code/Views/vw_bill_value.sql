SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   view [dbo].[vw_bill_value] AS
SELECT
  t.transaction_id,
  t.pump_id,
  t.employee_id,
  p.name,
  t.amount,
  ph.price,
  d.value as discount,
  ROUND(t.amount * ph.price * 
  CASE
  WHEN d.value IS NULL THEN 1
  ELSE (1-d.value) 
  END
  ,2) as bill_value
FROM [transaction] t
LEFT JOIN discount d ON d.discount_id = t.discount_id
JOIN pump ON pump.pump_id = t.pump_id
JOIN petrol p ON p.petrol_id = pump.petrol_id
JOIN petrol_history ph on ph.petrol_id = p.petrol_id
AND ph.date = (
	select MAX(date)
	from petrol_history
	where date <= t.date)
GO
