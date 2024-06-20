SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pump](
	[pump_id] [int] IDENTITY(18,1) NOT NULL,
	[petrol_id] [int] NOT NULL,
	[distributor_no] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pump] PRIMARY KEY CLUSTERED 
(
	[pump_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[pump]  WITH CHECK ADD  CONSTRAINT [FK_pump_distributor] FOREIGN KEY([distributor_no])
REFERENCES [dbo].[distributor] ([distributor_no])
GO

ALTER TABLE [dbo].[pump] CHECK CONSTRAINT [FK_pump_distributor]
GO

ALTER TABLE [dbo].[pump]  WITH CHECK ADD  CONSTRAINT [FK_pump_petrol] FOREIGN KEY([petrol_id])
REFERENCES [dbo].[petrol] ([petrol_id])
GO

ALTER TABLE [dbo].[pump] CHECK CONSTRAINT [FK_pump_petrol]
GO

ALTER TABLE [dbo].[pump]  WITH CHECK ADD  CONSTRAINT [CK_pump_distributor_no_positive] CHECK  (([distributor_no]>(0)))
GO

ALTER TABLE [dbo].[pump] CHECK CONSTRAINT [CK_pump_distributor_no_positive]
GO

ALTER TABLE [dbo].[pump]  WITH CHECK ADD  CONSTRAINT [CK_pump_id] CHECK  (([pump_id]>(0)))
GO

ALTER TABLE [dbo].[pump] CHECK CONSTRAINT [CK_pump_id]
GO

ALTER TABLE [dbo].[pump]  WITH CHECK ADD  CONSTRAINT [CK_pump_petrol_id] CHECK  (([petrol_id]>(0)))
GO

ALTER TABLE [dbo].[pump] CHECK CONSTRAINT [CK_pump_petrol_id]
GO


