SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_fuel_sales_by_date]
(
    @start_date DATETIME,
    @end_date DATETIME
)
RETURNS TABLE
AS
RETURN
(
    SELECT t.transaction_id, t.date, t.amount, p.name AS petrol_name, (t.amount * p.price) AS total_price
    FROM [transaction] t
    JOIN pump pu ON t.pump_id = pu.pump_id
    JOIN petrol p ON pu.petrol_id = p.petrol_id
    WHERE t.date BETWEEN @start_date AND @end_date
);
GO
