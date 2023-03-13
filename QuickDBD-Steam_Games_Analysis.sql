CREATE TABLE [game_details] (
    [appid] int  NOT NULL ,
    [name] varchar(100)  NOT NULL ,
    [developer] varchar(50)  NOT NULL ,
    [publisher] varchar(50)  NOT NULL ,
    [genre] varchar(50)  NOT NULL ,
    [overall] int  NOT NULL ,
    [price] int  NOT NULL ,
    CONSTRAINT [PK_game_details] PRIMARY KEY CLUSTERED (
        [appid] ASC
    )
)

CREATE TABLE [users_details] (
    [appid] int  NOT NULL ,
    [name] text  NOT NULL ,
    [genre] varchar(50)  NOT NULL ,
    [owners] int  NOT NULL ,
    [positive] int  NOT NULL ,
    [negative] int  NOT NULL ,
    [overall] int  NOT NULL ,
    [average_forever] int  NOT NULL ,
    [median_forever] int  NOT NULL ,
    [ccu] int  NOT NULL ,
    CONSTRAINT [PK_users_details] PRIMARY KEY CLUSTERED (
        [appid] ASC
    )
)

CREATE TABLE [pricing] (
    [appid] int  NOT NULL ,
    [name] varchar(100)  NOT NULL ,
    [price] int  NOT NULL ,
    [initial_price] int  NOT NULL ,
    [discount] int  NOT NULL ,
    CONSTRAINT [PK_pricing] PRIMARY KEY CLUSTERED (
        [appid] ASC
    )
)

ALTER TABLE [game_details] WITH CHECK ADD CONSTRAINT [FK_game_details_price] FOREIGN KEY([price])
REFERENCES [pricing] ([price])

ALTER TABLE [game_details] CHECK CONSTRAINT [FK_game_details_price]

ALTER TABLE [users_details] WITH CHECK ADD CONSTRAINT [FK_users_details_appid] FOREIGN KEY([appid])
REFERENCES [game_details] ([appid])

ALTER TABLE [users_details] CHECK CONSTRAINT [FK_users_details_appid]
