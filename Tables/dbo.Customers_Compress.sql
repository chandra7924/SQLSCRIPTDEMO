CREATE TABLE [dbo].[Customers_Compress]
(
[CustomerID] [int] NOT NULL,
[FirstName] [varbinary] (max) NOT NULL,
[LastName] [varbinary] (max) NOT NULL,
[EMail] [varbinary] (max) NOT NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF__Customers__Activ__440B1D61] DEFAULT ((1)),
[Created] [datetime] NOT NULL CONSTRAINT [DF__Customers__Creat__44FF419A] DEFAULT (sysdatetime()),
[Updated] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers_Compress] ADD CONSTRAINT [PK_Customers_Compress] PRIMARY KEY CLUSTERED  ([CustomerID]) ON [PRIMARY]
GO
