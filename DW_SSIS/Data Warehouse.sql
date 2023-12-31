USE [master]
GO
/****** Object:  Database [STG_AdventureWorks]    Script Date: 8/27/2023 4:12:06 PM ******/
CREATE DATABASE [STG_AdventureWorks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STG_AdventureWorks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\STG_AdventureWorks.mdf' , SIZE = 64512KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STG_AdventureWorks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\STG_AdventureWorks_log.ldf' , SIZE = 92864KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STG_AdventureWorks] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STG_AdventureWorks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STG_AdventureWorks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET ARITHABORT OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STG_AdventureWorks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STG_AdventureWorks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STG_AdventureWorks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STG_AdventureWorks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [STG_AdventureWorks] SET  MULTI_USER 
GO
ALTER DATABASE [STG_AdventureWorks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STG_AdventureWorks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STG_AdventureWorks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STG_AdventureWorks] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STG_AdventureWorks] SET DELAYED_DURABILITY = DISABLED 
GO
USE [STG_AdventureWorks]
GO
/****** Object:  User [Helius]    Script Date: 8/27/2023 4:12:06 PM ******/
CREATE USER [Helius] FOR LOGIN [Helius] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [erp]    Script Date: 8/27/2023 4:12:06 PM ******/
CREATE SCHEMA [erp]
GO
/****** Object:  Schema [hr]    Script Date: 8/27/2023 4:12:06 PM ******/
CREATE SCHEMA [hr]
GO
/****** Object:  Table [erp].[Business_Entity]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Business_Entity](
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[BusinessEntityID] [int] NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[Currency]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Currency](
	[CurrencyCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[Customer]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [erp].[Customer](
	[CustomerID] [int] NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [varchar](10) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [erp].[Person]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Person](
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[BusinessEntityID] [int] NULL,
	[PersonType] [nvarchar](2) NULL,
	[NameStyle] [bit] NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NULL,
	[AdditionalContactInfo] [nvarchar](max) NULL,
	[Demographics] [nvarchar](max) NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [erp].[PersonAddress]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[PersonAddress](
	[BusinessEntityID] [int] NULL,
	[AddressID] [int] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[StateProvinceID] [int] NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[Product]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[MakeFlag] [bit] NULL,
	[FinishedGoodsFlag] [bit] NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nvarchar](3) NULL,
	[WeightUnitMeasureCode] [nvarchar](3) NULL,
	[Weight] [numeric](8, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nvarchar](2) NULL,
	[Class] [nvarchar](2) NULL,
	[Style] [nvarchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[ProductCategory]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[ProductCategory](
	[ModifiedDate] [datetime] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[ProductSubCategory]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[ProductSubCategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[SalesHeader]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [erp].[SalesHeader](
	[SalesOrderID] [int] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[RevisionNumber] [tinyint] NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[OnlineOrderFlag] [bit] NULL,
	[SalesOrderNumber] [nvarchar](25) NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NULL,
	[TaxAmt] [money] NULL,
	[Freight] [money] NULL,
	[TotalDue] [money] NULL,
	[Comment] [nvarchar](128) NULL,
	[SSIS_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [erp].[SalesOrderDetail]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[SalesOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL,
	[SpecialOfferID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitPriceDiscount] [money] NULL,
	[LineTotal] [numeric](38, 6) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[SalesTerritory]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[SalesTerritory](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Group] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [erp].[Store]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Store](
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Demographics] [nvarchar](max) NULL,
	[BusinessEntityID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [hr].[Employee]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [hr].[Employee](
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[OrganizationNode] [binary](892) NULL,
	[OrganizationLevel] [smallint] NULL,
	[JobTitle] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nvarchar](1) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL,
	[SalariedFlag] [bit] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[CurrentFlag] [bit] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [hr].[EmployeeDepartmentHistory]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hr].[EmployeeDepartmentHistory](
	[BusinessEntityID] [int] NULL,
	[DepartmentID] [smallint] NULL,
	[ShiftID] [tinyint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[Created_Dt] [datetime] NULL DEFAULT (getdate()),
	[SSISTrackId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [hr].[EmployeePayHistory]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hr].[EmployeePayHistory](
	[BusinessEntityID] [int] NULL,
	[RateChangeDate] [datetime] NULL,
	[Rate] [money] NULL,
	[PayFrequency] [tinyint] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Stg_vw_Erp_Customer]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  Create view [dbo].[Stg_vw_Erp_Customer]
  as

  select c.CustomerID,
         p.[Title],
	p.[FirstName],
	p.[LastName],
	p.[NameStyle],
	p.[EmailPromotion],
	pa.[AddressLine1],
	pa.City

         from [erp].[Customer] c
  inner join [erp].[Person] p
  on c.PersonID = p.BusinessEntityID

  left join [erp].[PersonAddress] pa
  on p.BusinessEntityID = pa.BusinessEntityID


GO
/****** Object:  View [dbo].[Stg_vw_Erp_Employee]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Stg_vw_Erp_Employee]
as

select  NationalIDNumber 
       ,[FirstName]
      ,[LastName]
	  ,null [NameStyle]
	  ,[Title]
	  ,[HireDate]
      ,[BirthDate]
	  ,LoginID [EmailAddress]
	  ,N'' [Phone]
	  ,[MaritalStatus]
	  ,[DepartmentName]
	  ,[StartDate]
	  ,[EndDate]
from [hr].[Employee] e

left join [erp].[Person]  p
on e.BusinessEntityID = p.BusinessEntityID

left join [hr].[EmployeeDepartmentHistory] d
on e.BusinessEntityID = d.BusinessEntityID


GO
/****** Object:  View [dbo].[Stg_vw_Erp_Fact_InternetSales]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Stg_vw_Erp_Fact_InternetSales]
as
select h.[SalesOrderID],
o.[SalesOrderDetailID],
 row_number() over(partition by h.[SalesOrderID] order by h.modifieddate) as saleLineNumber,
p.ProductNumber,
cast(h.[OrderDate] as date) [OrderDate] ,
cast(h.[DueDate] as Date) [DueDate],
cast(h.[ShipDate] as date) [ShipDate],
[CustomerID],
[TerritoryID],
N'USD' Currency,  
null [RevisionNumber],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal],
0 [TaxAmt]

 from [erp].[SalesHeader] h
left join [erp].[SalesOrderDetail]  o
on h.SalesOrderID = o.SalesOrderID

left join [erp].[Product] p 
on o.[ProductID] = p.ProductID
where OnlineOrderFlag =1 -- This is to filer Internet Sales

GO
/****** Object:  View [dbo].[Stg_vw_Erp_Fact_ResellerSales]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[Stg_vw_Erp_Fact_ResellerSales]
as
select h.[SalesOrderID],
 row_number() over(partition by h.[SalesOrderID] order by h.modifieddate) as saleLineNumber,
p.ProductNumber,
cast(h.[OrderDate] as date) [OrderDate] ,
cast(h.[DueDate] as Date) [DueDate],
cast(h.[ShipDate] as date) [ShipDate],
 cast(c.[StoreID] as nvarchar(15)) ResellerID,
h.[TerritoryID],
e.NationalIDNumber,
N'USD' Currency,  
null [RevisionNumber],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal],
0 [TaxAmt]

 from [erp].[SalesHeader] h
left join [erp].[SalesOrderDetail]  o
on h.SalesOrderID = o.SalesOrderID

left join [erp].[Product] p 
on o.[ProductID] = p.ProductID

left join [erp].[Customer] c
on h.[CustomerID] = c.[CustomerID]

left join [hr].[Employee] e
on e.[BusinessEntityID] = h.SalesPersonID
where OnlineOrderFlag=0 -- This is to filter  ResellerSales






GO
/****** Object:  View [dbo].[Stg_vw_Erp_Product]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create View [dbo].[Stg_vw_Erp_Product]
as

select  p.[ProductNumber],
        p.[Name],
		p.[StandardCost],
p.[Color],
p.[Size],
null SizeRange,
p.[Name] [EnglishDescription],
sc.[Name]  as [ProductSubcategoryCode],
c.[Name]   as  [ProductCategory]

 from [erp].[Product] p

left join [erp].[ProductSubCategory] sc
on p.ProductSubcategoryID = sc.ProductSubcategoryID

left join [erp].[ProductCategory] c
on sc.ProductCategoryID = c.ProductCategoryID


GO
/****** Object:  View [dbo].[Stg_vw_Erp_Reseller]    Script Date: 8/27/2023 4:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Stg_vw_Erp_Reseller]
as
SELECT distinct 
       [StoreID]
	   ,s.Name [ResellerName]
      ,null  [YearOpened]
      ,0 [NumberEmployees]
	  ,null [BusinessType]
	 
    
  FROM [erp].[Customer] c
  left join [erp].[Store] s
  on c.StoreId = s.BusinessEntityId

  where PersonID
is null



GO
USE [master]
GO
ALTER DATABASE [STG_AdventureWorks] SET  READ_WRITE 
GO
