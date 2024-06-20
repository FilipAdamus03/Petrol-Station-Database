SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_update_distributor_status]
    @distributor_no INT,
    @new_status VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Zmieniamy status dystrybutora
        UPDATE dbo.distributor
        SET status = @new_status
        WHERE distributor_no = @distributor_no;

        -- Jeżeli nowy status dystrybutora to 'down', zmieniamy statusy powiązanych pomp na 'down'
        IF @new_status = 'down'
        BEGIN
            UPDATE dbo.pump
            SET status = 'down'
            WHERE distributor_no = @distributor_no;
        END;

        -- Jeżeli nowy status dystrybutora to 'up', zmieniamy statusy powiązanych pomp na 'up'
        IF @new_status = 'up'
        BEGIN
            UPDATE dbo.pump
            SET status = 'up'
            WHERE distributor_no = @distributor_no;
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;
        THROW;
    END CATCH;
END;
GO
