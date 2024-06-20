SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tg_update_pump_status]
ON [dbo].[transaction]
AFTER INSERT
AS
BEGIN
    UPDATE pump
    SET status = 'up'
    FROM pump p
    JOIN inserted AS i
    ON p.pump_id = i.pump_id;
END;
GO

ALTER TABLE [dbo].[transaction] ENABLE TRIGGER [tg_update_pump_status]
GO
