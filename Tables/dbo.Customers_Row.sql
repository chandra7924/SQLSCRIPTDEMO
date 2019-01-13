CREATE TABLE [dbo].[Customers_Row]
(
[CustomerID] [int] NOT NULL,
[FirstName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMail] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF__Customers__Activ__403A8C7D] DEFAULT ((1)),
[Created] [datetime] NOT NULL CONSTRAINT [DF__Customers__Creat__412EB0B6] DEFAULT (sysdatetime()),
[Updated] [datetime] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = ROW
)
GO
ALTER TABLE [dbo].[Customers_Row] ADD CONSTRAINT [PK_Customers_Row] PRIMARY KEY CLUSTERED  ([CustomerID]) WITH (DATA_COMPRESSION = ROW) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Active_Customers_Row] ON [dbo].[Customers_Row] ([FirstName], [LastName], [EMail]) WHERE ([Active]=(1)) WITH (DATA_COMPRESSION = ROW) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PhoneBook_Customers_Row] ON [dbo].[Customers_Row] ([LastName], [FirstName]) INCLUDE ([EMail]) WITH (DATA_COMPRESSION = ROW) ON [PRIMARY]
GO
