SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_start_fueling]
    @pump_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Sprawdź status dystrybutora dla danego pistoletu
        DECLARE @distributor_status VARCHAR(50);
        SELECT @distributor_status = d.status
        FROM pump p
        JOIN distributor d ON p.distributor_no = d.distributor_no
        WHERE p.pump_id = @pump_id;

        -- Jeżeli status dystrybutora jest 'down', nie można rozpocząć tankowania
        IF @distributor_status = 'down'
        BEGIN
            RAISERROR ('Dystrybutor nieczynny. Nie można rozpocząć tankowania', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Sprawdzenie, czy pistolet jest w stanie "down" / "up"
        IF EXISTS (
            SELECT 1
            FROM dbo.pump
            WHERE pump_id = @pump_id
            AND status = 'in use'
        )
        BEGIN
            RAISERROR ('Ktoś już tankuje. Proszę wybrać inny dystrybutor.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        IF EXISTS (
            SELECT 1
            FROM dbo.pump
            WHERE pump_id = @pump_id
            AND status = 'up'
        )
        BEGIN
            -- Zmiana stanu pistoletu na "in use"
            UPDATE dbo.pump
            SET status = 'in use'
            WHERE pump_id = @pump_id;

            RAISERROR ('Rozpoczęto tankowanie. Status pistoletu zmieniony na "in use".', 1, 1);
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
