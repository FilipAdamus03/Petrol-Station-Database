SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[vw_distributor_fuel_usage] as
select d.distributor_no, p.petrol_id,YEAR(date) as year,MONTH(date) as month, pet.name, SUM(t.amount) as total_amount
from dbo.pump p
join dbo.[transaction] t ON p.pump_id = t.pump_id
join dbo.distributor d ON p.distributor_no = d.distributor_no
join dbo.petrol pet on pet.petrol_id = p.petrol_id
group by d.distributor_no,p.petrol_id, YEAR(date),MONTH(date), pet.name
GO

