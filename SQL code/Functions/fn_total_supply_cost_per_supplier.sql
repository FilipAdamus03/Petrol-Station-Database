SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_total_supply_cost_per_supplier] (@supplier_id INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @total_cost MONEY;

    SELECT @total_cost = SUM(amount * price)
    FROM supply
    WHERE supplier_id = @supplier_id;

    RETURN @total_cost;
END;
GO
