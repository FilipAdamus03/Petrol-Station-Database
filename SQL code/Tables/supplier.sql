SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[supplier](
	[supplier_id] [int] IDENTITY(5,1) NOT NULL,
	[company_name] [varchar](50) NOT NULL,
	[postal_code] [varchar](10) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[country] [varchar](30) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[supplier]  WITH CHECK ADD  CONSTRAINT [CK_supplier_id] CHECK  (([supplier_id]>(0)))
GO

ALTER TABLE [dbo].[supplier] CHECK CONSTRAINT [CK_supplier_id]
GO
