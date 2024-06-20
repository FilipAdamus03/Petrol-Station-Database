SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[tg_update_petrol_stock]
ON [dbo].[transaction]
AFTER INSERT
AS
BEGIN
    UPDATE petrol
    SET in_stock = in_stock - i.amount
    FROM inserted i
    JOIN pump p ON p.pump_id = i.pump_id
    WHERE petrol.petrol_id = p.petrol_id;
END;
GO

ALTER TABLE [dbo].[transaction] ENABLE TRIGGER [tg_update_petrol_stock]
GO
