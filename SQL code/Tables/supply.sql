SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[supply](
	[supply_id] [int] IDENTITY(22,1) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[date] [datetime] NOT NULL,
	[petrol_id] [int] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_supply] PRIMARY KEY CLUSTERED 
(
	[supply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_petrol] FOREIGN KEY([petrol_id])
REFERENCES [dbo].[petrol] ([petrol_id])
GO

ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_petrol]
GO

ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[supplier] ([supplier_id])
GO

ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_supplier]
GO

ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [CK_supply_id] CHECK  (([supply_id]>(0)))
GO

ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [CK_supply_id]
GO

ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [CK_supply_price] CHECK  (([price]>(0)))
GO

ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [CK_supply_price]
GO

ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [CK_supply_supplierid] CHECK  (([supplier_id]>(0)))
GO

ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [CK_supply_supplierid]
GO


