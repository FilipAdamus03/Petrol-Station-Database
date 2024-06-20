SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tg_validate_invoice_nip]
ON [dbo].[invoice]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LEN(NIP) != 10
    )
    BEGIN
        RAISERROR ('Invalid NIP number', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

GO

ALTER TABLE [dbo].[invoice] ENABLE TRIGGER [tg_validate_invoice_nip]
GO
