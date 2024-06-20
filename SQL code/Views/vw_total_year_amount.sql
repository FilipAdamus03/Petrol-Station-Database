SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_total_year_amount] as
select YEAR(date) AS year, SUM(t.amount) as total_amount,name from [transaction] as t
left join discount d on d.discount_id = t.discount_id
join pump on pump.pump_id = t.pump_id
join petrol as p on p.petrol_id = pump.petrol_id
group by p.petrol_id,YEAR(date), name
GO
