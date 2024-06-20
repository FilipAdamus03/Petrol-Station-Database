SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tg_check_discount_dates]
ON [dbo].[discount]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE start_date >= end_date
    )
    BEGIN
        RAISERROR ('Start date must be earlier than end date', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

ALTER TABLE [dbo].[discount] ENABLE TRIGGER [tg_check_discount_dates]
GO
