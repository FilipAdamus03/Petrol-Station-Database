SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(3,1) NOT NULL,
	[firstname] [varchar](30) NOT NULL,
	[lastname] [varchar](30) NOT NULL,
	[title] [varchar](20) NOT NULL,
	[address] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[postal_code] [varchar](10) NOT NULL,
	[country] [varchar](20) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [CK_employee_id_positive] CHECK  (([employee_id]>(0)))
GO

ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [CK_employee_id_positive]
GO
