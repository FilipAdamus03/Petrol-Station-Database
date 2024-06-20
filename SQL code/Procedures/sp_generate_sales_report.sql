SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_generate_sales_report] (
    @start_date DATETIME,
    @end_date DATETIME
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

		IF @start_date >= @end_date
        BEGIN
            THROW 50002, 'Data początkowa nie może być później niż data końcowa', 1;
        END

        SELECT 
            e.firstname + ' ' + e.lastname AS employee_name,
            p.name AS petrol_name,
            SUM(t.amount) AS total_amount,
            SUM(t.amount * p.price) AS total_sales
        FROM [transaction] t
        JOIN pump pu ON t.pump_id = pu.pump_id
        JOIN petrol p ON pu.petrol_id = p.petrol_id
        JOIN employee e ON t.employee_id = e.employee_id
        WHERE t.date BETWEEN @start_date AND @end_date
        GROUP BY e.firstname, e.lastname, p.name
        ORDER BY total_sales DESC;

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
