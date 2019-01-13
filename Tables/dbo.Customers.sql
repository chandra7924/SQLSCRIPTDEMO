CREATE TABLE [dbo].[Customers]
(
[CustomerID] [int] NOT NULL,
[FirstName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMail] [nvarchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF__Customers__Activ__37A5467C] DEFAULT ((1)),
[Created] [datetime] NOT NULL CONSTRAINT [DF__Customers__Creat__38996AB5] DEFAULT (sysdatetime()),
[Updated] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED  ([CustomerID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Active_Customers] ON [dbo].[Customers] ([FirstName], [LastName], [EMail]) WHERE ([Active]=(1)) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PhoneBook_Customers] ON [dbo].[Customers] ([LastName], [FirstName]) INCLUDE ([EMail]) ON [PRIMARY]
GO
