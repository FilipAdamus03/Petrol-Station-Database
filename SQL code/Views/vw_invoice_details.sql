SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_invoice_details] AS
SELECT 
    i.invoice_id,
    i.transaction_id,
    i.NIP,
    i.plate,
    t.date AS transaction_date,
    p.name AS petrol_name,
	t.amount,
	ph.price,
    ROUND(t.amount * ph.price * 
          CASE 
              WHEN d.value IS NULL THEN 1 
              ELSE (1 - d.value) 
          END, 2) AS final_cost, 
	t.employee_id
FROM invoice i
JOIN [transaction] t ON i.transaction_id = t.transaction_id
JOIN pump pmp ON t.pump_id = pmp.pump_id
JOIN petrol p ON pmp.petrol_id = p.petrol_id
join petrol_history ph on ph.petrol_id = p.petrol_id
AND ph.date = (
	select MAX(date)
	from petrol_history
	where date <= t.date)
LEFT JOIN discount d ON t.discount_id = d.discount_id;
GO
