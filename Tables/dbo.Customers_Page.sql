CREATE TABLE [dbo].[Customers_Page]
(
[CustomerID] [int] NOT NULL,
[FirstName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMail] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF__Customers__Activ__3C69FB99] DEFAULT ((1)),
[Created] [datetime] NOT NULL CONSTRAINT [DF__Customers__Creat__3D5E1FD2] DEFAULT (sysdatetime()),
[Updated] [datetime] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
ALTER TABLE [dbo].[Customers_Page] ADD CONSTRAINT [PK_Customers_Page] PRIMARY KEY CLUSTERED  ([CustomerID]) WITH (DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Active_Customers_Page] ON [dbo].[Customers_Page] ([FirstName], [LastName], [EMail]) WHERE ([Active]=(1)) WITH (DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PhoneBook_Customers_Page] ON [dbo].[Customers_Page] ([LastName], [FirstName]) INCLUDE ([EMail]) WITH (DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
