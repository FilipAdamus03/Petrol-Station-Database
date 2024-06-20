SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_check_pump_status] (@pump_id INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @distributor_status VARCHAR(50);

    SELECT @distributor_status = d.status
    FROM pump p
    JOIN distributor d ON p.distributor_no = d.distributor_no
    WHERE p.pump_id = @pump_id;

    RETURN @distributor_status;
END;
GO
