SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_employee_transaction_count]
    @employee_id INT,
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (SELECT 1 FROM employee WHERE employee_id = @employee_id)
        BEGIN
            THROW 50001, 'Nie istnieje pracownik o podanym ID.', 1;
        END;

        SELECT 
            employee_id, 
            COUNT(transaction_id) AS transaction_count
        FROM 
            [transaction] t
        WHERE
            employee_id = @employee_id
            AND t.date >= @start_date
            AND t.date <= @end_date
        GROUP BY 
            employee_id;

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
