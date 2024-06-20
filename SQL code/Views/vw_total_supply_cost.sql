SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vw_total_supply_cost] AS
SELECT 
    s.supply_id,
    s.amount,
    s.date,
    p.name AS petrol_name,
    s.price AS unit_price,
    (s.amount * s.price) AS total_cost,
    supp.company_name,
    supp.address AS supplier_address,
    supp.city AS supplier_city,
    supp.country AS supplier_country,
    supp.phone AS supplier_phone
FROM 
    supply s
JOIN 
    petrol p ON s.petrol_id = p.petrol_id
JOIN 
    supplier supp ON s.supplier_id = supp.supplier_id;
GO
