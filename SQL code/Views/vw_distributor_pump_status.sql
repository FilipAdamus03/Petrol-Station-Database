SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_distributor_pump_status] AS
SELECT 
    d.distributor_no,
    d.status AS distributor_status,
    p.pump_id,
    p.status AS pump_status,
    pet.name AS petrol_name
FROM 
    distributor d
JOIN 
    pump p ON d.distributor_no = p.distributor_no
JOIN 
    petrol pet ON p.petrol_id = pet.petrol_id;
GO
