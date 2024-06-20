SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[distributor](
	[distributor_no] [int] IDENTITY(3,1) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_distributor] PRIMARY KEY CLUSTERED 
(
	[distributor_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[distributor]  WITH CHECK ADD  CONSTRAINT [CK_distributor_no_positive] CHECK  (([distributor_no]>(0)))
GO

ALTER TABLE [dbo].[distributor] CHECK CONSTRAINT [CK_distributor_no_positive]
GO


