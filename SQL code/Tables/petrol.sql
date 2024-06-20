SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[petrol](
	[petrol_id] [int] IDENTITY(5,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[in_stock] [float] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_petrol_1] PRIMARY KEY CLUSTERED 
(
	[petrol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[petrol]  WITH CHECK ADD  CONSTRAINT [CK_petrol_id_positive] CHECK  (([petrol_id]>(0)))
GO

ALTER TABLE [dbo].[petrol] CHECK CONSTRAINT [CK_petrol_id_positive]
GO

ALTER TABLE [dbo].[petrol]  WITH CHECK ADD  CONSTRAINT [CK_petrol_price_positive] CHECK  (([price]>(0)))
GO

ALTER TABLE [dbo].[petrol] CHECK CONSTRAINT [CK_petrol_price_positive]
GO


