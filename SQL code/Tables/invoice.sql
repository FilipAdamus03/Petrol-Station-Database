USE [fprzepio]
GO

/****** Object:  Table [dbo].[invoice]    Script Date: 20.06.2024 12:05:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[invoice](
	[invoice_id] [int] IDENTITY(55,1) NOT NULL,
	[transaction_id] [int] NOT NULL,
	[NIP] [varchar](10) NOT NULL,
	[plate] [varchar](20) NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[invoice]  WITH NOCHECK ADD  CONSTRAINT [FK_invoice_transaction] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transaction] ([transaction_id])
GO

ALTER TABLE [dbo].[invoice] NOCHECK CONSTRAINT [FK_invoice_transaction]
GO

ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [CK_invoice_id_positive] CHECK  (([invoice_id]>(0)))
GO

ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [CK_invoice_id_positive]
GO

ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [CK_invoice_NIP] CHECK  (([NIP] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [CK_invoice_NIP]
GO

ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [CK_transaction_id_positive] CHECK  (([transaction_id]>(0)))
GO

ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [CK_transaction_id_positive]
GO


