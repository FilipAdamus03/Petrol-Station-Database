SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[discount](
	[discount_id] [int] IDENTITY(4,1) NOT NULL,
	[discount_name] [varchar](50) NOT NULL,
	[value] [float] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[discount]  WITH CHECK ADD  CONSTRAINT [CK_discount_dates] CHECK  (([start_date]<[end_date]))
GO

ALTER TABLE [dbo].[discount] CHECK CONSTRAINT [CK_discount_dates]
GO

ALTER TABLE [dbo].[discount]  WITH CHECK ADD  CONSTRAINT [CK_discount_value] CHECK  (([value]>(0) AND [value]<=(1)))
GO

ALTER TABLE [dbo].[discount] CHECK CONSTRAINT [CK_discount_value]
GO
