SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[sp_add_new_supply]
    @supplier_id INT,
    @amount FLOAT,
    @date DATETIME,
    @petrol_id INT,
    @price MONEY
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (SELECT 1 FROM supplier WHERE supplier_id = @supplier_id)
        BEGIN
            THROW 50005, 'Nie ma dostawcy o takim ID', 1;
        END;

		IF NOT EXISTS (SELECT 1 FROM petrol WHERE petrol_id = @petrol_id)
        BEGIN
            THROW 50005, 'Nie ma paliwa o takim ID', 1;
        END;

        IF @date < (SELECT MAX(date) FROM supply)
        BEGIN
            THROW 50002, 'Data dostawy nie może być wcześniejsza niż ostatnia dostawa', 1;
        END;

        -- Dodanie nowej dostawy
        INSERT INTO supply (supplier_id, amount, date, petrol_id, price)
        VALUES (@supplier_id, @amount, @date, @petrol_id, @price);

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
