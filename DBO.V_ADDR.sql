

-- ---------------------------------------------------------------------------------------------  
--  
-- Purpose: Return a listing of Customer information.  
--  
--    Date        Version    Who        Control        Comment  
-- ----------    -------    -------    -----------    ----------------------------------------------------  
-- 15/02/2023       V1       Rashami                   Initial Version   
-- 31/12/2024       V2       Manish 
-- -----------------------------------------------------------------------------------------------
CREATE VIEW DBO.V_ADDR
AS
SELECT * FROM DBO.REPORT_V_ADDR(NOLOCK)          
