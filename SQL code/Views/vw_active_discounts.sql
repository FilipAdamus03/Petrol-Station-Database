SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_active_discounts] AS
SELECT discount_id, discount_name, value, start_date, end_date
FROM discount
WHERE end_date IS NULL OR end_date > GETDATE();
GO
