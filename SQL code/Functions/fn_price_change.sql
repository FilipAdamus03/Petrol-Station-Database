SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE    FUNCTION [dbo].[fn_price_change] (
    @start_date DATETIME,
    @end_date DATETIME,
    @petrol_name VARCHAR(50)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @start_price FLOAT;
    DECLARE @end_price FLOAT;
    DECLARE @percentage_change FLOAT;

    -- Cena paliwa na początku okresu
    SELECT TOP 1 @start_price = ph.price
    FROM petrol_history ph
    JOIN petrol p ON ph.petrol_id = p.petrol_id
    WHERE p.name = @petrol_name
    ORDER BY ABS(DATEDIFF(DAY, ph.date, @start_date));

    -- Cena paliwa na końcu okresu
    SELECT TOP 1 @end_price = ph.price
    FROM petrol_history ph
    JOIN petrol p ON ph.petrol_id = p.petrol_id
    WHERE p.name = @petrol_name
    ORDER BY ABS(DATEDIFF(DAY, ph.date, @end_date));

    -- Procentowa zmiana ceny
    IF @start_price IS NULL OR @end_price IS NULL
    BEGIN
        RETURN NULL; -- Zwróć NULL, jeśli nie ma takich dat
    END

    SET @percentage_change = ((@end_price - @start_price) / @start_price) * 100;

    RETURN ROUND(@percentage_change, 1);
END;
GO
