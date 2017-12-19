/******************************************   ******************************************/

USE FcCommon
GO 

--  
drop table if exists Service 
create table Service (ServiceID int null, Service nvarchar(max) null)

--   
drop table if exists Unit 
create table Unit (UnitID smallint null, Unit nvarchar(max) null, UnitID2 nvarchar(max) null)

--    
drop table if exists Contractor 
create table Contractor (ContractorID smallint null, Contractor nvarchar(max) null)

--    
drop table if exists Store 
create table Store (StoreID int null, Store nvarchar(max) null)

--  FcID  
drop table if exists FC 
create table FC (FcID int IDENTITY(1,1) NOT NULL, ServiceID smallint null, UnitID smallint null, ContractorID int null,StoreID int null)

--      
drop table if exists Actual 
create table Actual (PeriodID int null,FcID int null, Value float null)

--     
drop table if exists  Forecast
CREATE TABLE [dbo].[Forecast](
	[PeriodID] [int] NULL,
	[FcID] [int] NULL,
	[FcTypeID] [int] NULL,
	[] [float] NULL,
	[] [float] NULL,
	[] [float] NULL,
	[] [float] NULL,
)

--   
drop table if exists  FcType
CREATE TABLE [dbo].[FcType](
	[FcTypeID] int IDENTITY(1,1) NOT NULL,
	[FaasFcTypeID] [int] NULL,
	[StageID] [int] NULL,
	[NameStage] nvarchar(max) null,
	[Description] nvarchar(max) null,
	[ForecastDate] [datetime] NULL,
	[Date] [int] NULL,
	[Type] nvarchar(max) NULL,
	[TypeForecast] nvarchar(max) NULL,
	[TypeForecastID] [int] NULL,
	[InAccuracy] smallint NULL,
	[InForecastTemplate] smallint NULL,
)

drop table if exists  TypeForecast
CREATE TABLE [dbo].[TypeForecast]
(
	[TypeForecastID] [int] NULL,
	[TypeForecast] nvarchar(max) NULL,
	[Correct] smallint NULL,
) 

--   
insert into [TypeForecast] values (0,'',0)
insert into [TypeForecast] values (1,'',1)
insert into [TypeForecast] values (2,'',0)

--    
drop table if exists Period 
create table Period (PeriodID int null, Period nvarchar(max) NULL,WorkDay int null,Delta float null)

--    -   FcBudgetD
drop table if exists PeriodMonth
select * 
into PeriodMonth
from  [st-mathmod-3].[FcBudgetD].[dbo].[Period]

--      
drop table if exists FCTemplate  
create table FCTemplate (
FcID int null, 
ServiceID smallint null, 
UnitID smallint null, 
ContractorID int null,
StoreID int null,
Service nvarchar(max) null, 
Unit nvarchar(max) null, 
Contractor nvarchar(max) null,
Store nvarchar(max) null)

--    ,        
drop table if exists [ActualTemplate]  
CREATE TABLE 
[dbo].[ActualTemplate](
	[PeriodID] [int] NULL,
	[FcID] [int] NULL,
	[UnitID] smallint NULL,
	[ServiceID] smallint NULL,
	[Value] [float] NOT NULL
)
