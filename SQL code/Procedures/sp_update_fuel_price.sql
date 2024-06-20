SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_update_fuel_price]
    @petrol_id INT,
    @new_price MONEY
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

		IF NOT EXISTS (SELECT 1 FROM petrol WHERE petrol_id = @petrol_id)
        BEGIN
            THROW 50005, 'Nie ma paliwa o takim ID', 1;
        END;

        -- Aktualizacja ceny paliwa
        UPDATE petrol
        SET price = @new_price
        WHERE petrol_id = @petrol_id;

        -- Dodanie wpisu do historii cen paliwa
        INSERT INTO petrol_history (petrol_id, price, date)
        VALUES (@petrol_id, @new_price, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Sprawdzenie, czy transakcja jest aktywna i wycofanie jej w przypadku błędu
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;

        -- Zgłoszenie błędu
        THROW;
    END CATCH;
END;
GO
