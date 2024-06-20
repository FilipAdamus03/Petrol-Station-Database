SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_finish_refueling]
    @pump_id INT,
    @employee_id INT,
    @amount FLOAT,
    @discount_id INT = NULL
AS
BEGIN
    DECLARE @petrol_id INT;
    DECLARE @current_stock FLOAT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Odczytaj jakie paliwo jest na danym pistolecie
        SELECT @petrol_id = petrol_id
        FROM pump
        WHERE pump_id = @pump_id;

        -- Odczytaj aktualny zapas paliwa
        SELECT @current_stock = in_stock
        FROM petrol
        WHERE petrol_id = @petrol_id;

        -- Sprawdź czy jest wystarczająco paliwa w zapasie
        IF @current_stock >= @amount
        BEGIN
            -- Dodaj nową transakcję
            INSERT INTO dbo.[transaction] (pump_id, amount, employee_id, date, discount_id)
            VALUES (@pump_id, @amount, @employee_id, GETDATE(), @discount_id);

            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- Jeśli brakuje paliwa
            RAISERROR('Niewystarczająca ilość paliwa.', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        RAISERROR ('Błąd w użyciu procedury', 16, 1);
    END CATCH
END;
GO
