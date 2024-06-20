SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_add_new_discount_with_validation] (
    @discount_name VARCHAR(50),
    @value FLOAT,
    @start_date DATETIME,
    @end_date DATETIME
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @value <= 0 OR @value > 1
        BEGIN
            THROW 50001, 'Zniżka musi należeć do przedziału od 0 do 1', 1;
        END

        IF @start_date >= @end_date
        BEGIN
            THROW 50002, 'Data początkowa nie może być później niż data końcowa', 1;
        END

        INSERT INTO discount (discount_name, value, start_date, end_date)
        VALUES (@discount_name, @value, @start_date, @end_date);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
