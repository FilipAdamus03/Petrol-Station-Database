SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_avg_monthly_petrol_price] as
select p.petrol_id, year(date) as year, month(date) as month, name, avg(ph.price) as average_price
from dbo.petrol_history as ph
join dbo.petrol p on ph.petrol_id = p.petrol_id
group by p.petrol_id, year(date), month(date), name
GO
