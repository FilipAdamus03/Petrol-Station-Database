SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[petrol_history](
	[petrol_history_id] [int] IDENTITY(15,1) NOT NULL,
	[petrol_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_petrol_history_1] PRIMARY KEY CLUSTERED 
(
	[petrol_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[petrol_history]  WITH CHECK ADD  CONSTRAINT [FK_petrol_history_petrol] FOREIGN KEY([petrol_id])
REFERENCES [dbo].[petrol] ([petrol_id])
GO

ALTER TABLE [dbo].[petrol_history] CHECK CONSTRAINT [FK_petrol_history_petrol]
GO

ALTER TABLE [dbo].[petrol_history]  WITH CHECK ADD  CONSTRAINT [CK_petrol_history_id] CHECK  (([petrol_history_id]>(0)))
GO

ALTER TABLE [dbo].[petrol_history] CHECK CONSTRAINT [CK_petrol_history_id]
GO

ALTER TABLE [dbo].[petrol_history]  WITH CHECK ADD  CONSTRAINT [CK_petrol_history_price_positive] CHECK  (([price]>(0)))
GO

ALTER TABLE [dbo].[petrol_history] CHECK CONSTRAINT [CK_petrol_history_price_positive]
GO
