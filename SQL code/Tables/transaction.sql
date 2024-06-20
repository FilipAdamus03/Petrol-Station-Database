SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[transaction](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[pump_id] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[employee_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[discount_id] [int] NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_transaction_discounts] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discount] ([discount_id])
GO

ALTER TABLE [dbo].[transaction] NOCHECK CONSTRAINT [FK_transaction_discounts]
GO

ALTER TABLE [dbo].[transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_transaction_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[transaction] NOCHECK CONSTRAINT [FK_transaction_Employee]
GO

ALTER TABLE [dbo].[transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_transaction_pump] FOREIGN KEY([pump_id])
REFERENCES [dbo].[pump] ([pump_id])
GO

ALTER TABLE [dbo].[transaction] NOCHECK CONSTRAINT [FK_transaction_pump]
GO

ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [CK_transaction_amount] CHECK  (([amount]>(0)))
GO

ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [CK_transaction_amount]
GO


