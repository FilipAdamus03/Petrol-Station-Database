SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [dbo].[tg_update_stock]
ON [dbo].[supply]
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.in_stock = p.in_stock + i.amount
    FROM petrol p
    JOIN inserted i ON p.petrol_id = i.petrol_id;
END;
GO

ALTER TABLE [dbo].[supply] ENABLE TRIGGER [tg_update_stock]
GO
