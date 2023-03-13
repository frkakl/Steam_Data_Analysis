USE steam_db

--CREATE TABLE [game_details] (
--    [appid] int,
--    [name] varchar(100),
--    [developer] varchar(50),
--    [publisher] varchar(50),
--    [genre] varchar(50),
--    [overall] int,
--    [price] int,
--    )
--)

--CREATE TABLE [users_details] (
--    [appid] int,
--    [name] text,
--    [genre] varchar(50),
--    [owners] int,
--    [positive] int,
--    [negative] int,
--    [overall] int,
--    [average_forever] int,
--    [median_forever] int,
--    [ccu] int
--    )
--)

--CREATE TABLE [pricing] (
--    [appid] int,
--    [name] varchar(100),
--    [price] int,
--    [initial_price] int,
--    [discount] int,
--    )
--)

-----------------------------------------------------------------------------------------------------------------------------------------

SELECT * 
FROM steam_db..game_details

SELECT *
FROM steam_db..users_details

SELECT *
FROM steam_db..pricing

----------------------------------------------------------------------------------------------------------------------------------------

--Change column name price to price_cent because we'll add a new column like price_usd in Pricing Table
EXEC sp_rename
@objname = 'pricing.price',
@newname = 'price_cent',
@objtype = 'COLUMN';

--Add a new column price_usd and set values from price_cent
ALTER TABLE pricing
ADD price_usd float NULL;

SELECT * FROM pricing
UPDATE pricing 
SET price_usd = price_cent/100;

----------------------------------------------------------------------------------------------------------------------------------------

--Transform price cent to usd in Game_Details Table

--Change data type
ALTER TABLE steam_db..game_details
ALTER COLUMN price FLOAT NULL;

UPDATE game_details
SET price = price/100;
SELECT* FROM game_details


