use master
go

if exists		 (select * from sysdatabases where name='carteam')
drop database carteam
go


create database carteam
go

use carteam
go


--序号 （子）系统 表名 中文名称和简单描述 使用方式
--TruckTeam --1 车队信息维护  车队信息表 公用
--2 车辆信息维护 Truck 车辆信息表 公用
--3 驾驶员信息维护 Driver 驾驶员信息表 公用
--4 驾驶员信息维护 Contact 驾驶员车辆绑定表 自用
--5 承运任务管理 Carriers 承运单表 公用
--6 承运任务管理 Goods 货物表 自用
--7 调度任务管理 Scheduling 调度任务信息表 公用
--8 用户管理 Role 角色表 自用
--9 用户管理 User 用户表 公用
--10 系统日志维护 LogDic 日志字典 自用
--11 系统日志维护 SysLog 系统日志表 公用





--1.表描述 车队信息表用于存放和管理车队信息
create table TruckTeam
(
--字段名 数据类型 空/非空 字段简单描述
TeamID int NOT NULL  primary key identity (1,1),      --车队编号（字段自动编号）
TeamName varchar(50) NOT NULL,              --车队名称
Leader varchar(20) NULL,             --车队负责人
Remark varchar(200) NULL,             -- 备注
CheckInTime datetime NULL,              --创队时间
IsDelete tinyint NULL        check(IsDelete='0' or IsDelete='1'),        --数据记录状态 0:使用中 1:该记录已删除
AlterTime datetime NULL,                --修改时间
--表描述 车队信息表用于存放和管理车队信息
---主键 PK_TruckTeam 主键表：TruckTeam
--外键 无 外键表：无
--索引 PK_TruckTeam 聚集索引
--约束 无
)
insert  into TruckTeam(TeamName,Leader,Remark,CheckInTime,IsDelete,AlterTime)
values('大众队','周某','很强的队伍','2015-3-12',0,'2018-03-03')
insert  into TruckTeam(TeamName,Leader,Remark,CheckInTime,IsDelete,AlterTime)
values('奥迪队','杨某','很强强的队伍','2015-8-12',1,'2017-03-03')
insert  into TruckTeam(TeamName,Leader,Remark,CheckInTime,IsDelete,AlterTime)
values('奔驰队','刘某','超级强的队伍','2015-7-12',1,'2016-03-03')



--2.表描述 驾驶员信息表用于存放和管理驾驶员信息

create table Truck
(
TruckID int NOT NULL primary key identity(101,1),     --车辆编号（字段自动编号）
Number varchar(50) NOT NULL    ,       --车牌号码
BuyDate datetime NULL        ,    -- 购车日期
Type varchar(20) NULL        ,     --车辆类型
Length varchar(20) NULL      ,    -- 创队时间
Tonnage int NULL            ,      -- 吨位
FK_TeamID int NULL        ,      -- 所属车队编号
State tinyint NULL    check(State='1' or State='2'),-- 工作状态 : 1:承运中 2:空闲
Remark varchar(500) NULL    ,   -- 备注
CheckInTime datetime NULL   ,    --   加入时间
IsDelete tinyint  NULL  check(IsDelete='0' or IsDelete='1') ,     --  数据记录状态 : 0:使用中 1:该记录已删除
AlterTime datetime NULL     ,     --  修改时间


--表描述 车辆信息表用于存放和管理车辆信息
--主键 PK_Truck 主键表：Truck
--外键 FK_Truck_TruckTeam 外键表：TruckTeam
--索引 PK_Truck 聚集索引
--约束 无
)
--insert into Truck(FK_TeamID,Number,Type,Tonnage,t1.Remark)
--values(2,'京S9965','汽车',100,'大家好我是新增的')


insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('鄂A3240','2018-1-1','一汽大众','2013-1-1',50,1,1,'性能很好，可以运输大量物品','2015-5-5',0,'2018-3-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('京B6652','2018-10-1','商务用车','2019-1-1',50,2,2,'跑得很快，能很快到达指定地点','2014-5-5',1,'2017-2-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('桂C1234','2018-7-1','奔驰运输','2018-1-1',50,3,1,'运的很多，能安全运输需要的东西','2017-5-5',1,'2016-1-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('鄂A9940','2018-6-1','一汽大众','2013-1-1',50,1,1,'速度很快','2015-6-5',0,'2018-9-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('京B4452','2018-1-5','商务用车','2019-1-1',50,2,2,'运输很多','2014-4-5',1,'2017-1-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('桂C1134','2018-7-6','奔驰运输','2018-1-1',50,3,1,'吃得很少','2017-3-5',1,'2016-2-3')

--3.表描述 驾驶员信息表用于存放和管理驾驶员信息

create table Driver
(
--驾驶员信息表
--字段名 数据类型 空/非空 字段简单描述
DriverID int NOT NULL   primary key identity(101,1),        --司机编号（字段自动编号）
Name varchar(20) NOT NULL        ,      --司机姓名
Sex tinyint NULL     check(Sex='0' or Sex='1')           ,--性别 ： 0 男 1 女
Birth datetime NULL             ,  --出生日期
Phone varchar(20) NULL          ,     --联系电话
IDCard varchar(50) NULL         ,     --身份证号码
FK_TeamID int NULL             ,  --车队编号
State tinyint NULL           check(State='0' or State='1')   ,  --工作状态 : 1:承运中 2:空闲
Remark varchar(500) NULL        ,      --备注
CheckInTime datetime NULL       ,        -- 加入时间
IsDelete tinyint NOT NULL     check(IsDelete='0' or IsDelete='1')   ,        -- 数据记录状态 : 0:使用中 1:该记录已删除
AlterTime datetime NULL         ,          --修改时间

--主键 PK_Driver 主键表：Driver
--外键 FK_Driver_TruckTeam 外键表：TruckTeam
--索引 PK_Driver 聚集索引
--约束 无
)
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('周大哥',0,'2000-03-03',125466265,42695685526545,1,1,'睡眠很好','2015-2-6',0,'2018-01-1')
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('刘大哥',1,'2000-01-03',1254656265,42691285526545,2,0,'耐心很好','2013-2-6',0,'2018-02-1')
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('冯大哥',0,'2000-02-03',126566265,426953216526545,3,1,'很喜欢跑','2012-2-6',0,'2018-02-1')



--4.车辆司机关联表用于连接车辆与驾驶员
create table Contact
(
--驾驶员车辆绑定表
--字段名 数据类型 空/非空 字段简单描述
ContactID int NOT NULL  primary key identity(1001,1),              --联系编号（字段自动编号）
FK_TruckID int NULL       ,      --车辆编号
FK_DriverID int NULL            ,                 --司机编号

--主键 PK_Contact 主键表：Contact
--外键 FK_Contact_Driver 外键表：Driver
--FK_Contact_Truck 外键表：Truck
--索引 PK_Contact 聚集索引
--约束 无
--承运单表
)
insert into Contact(FK_TruckID,FK_DriverID)values(1,101)
insert into Contact(FK_TruckID,FK_DriverID)values(2,102)
insert into Contact(FK_TruckID,FK_DriverID)values(3,103)

--8.表描述 系统角色表用于存放系统权限数据，管理用户权限
create table Role
(
--角色表
--字段名 数据类型 空/非空 字段简单描述
RoleID int NOT NULL  primary key identity(10000001,1)              ,--   角色编号（字段自动编号）
RoleName nvarchar(50) NULL          ,--    角色名称
RolePurview nvarchar(50) NULL       ,--       角色权限

--主键 RoleID 主键表：Role
--外键 无 外键表：无
--索引 PK_Role 聚集索引
--约束 无
)


insert into  Role(RoleName,RolePurview) values('运输员','跑车大队队长')
insert into  Role(RoleName,RolePurview) values('运输员','跑车大队副队长')
insert into  Role(RoleName,RolePurview) values('运输员','跑车大队队员')

--9.--表描述 系统用户表用于存放用户账户密码信息及用户信息
create table [User]
(
--用户表
--字段名 数据类型 空/非空 字段简单描述
UserID int NOT NULL     primary key identity(100000001,1)                   ,--   角色编号（字段自动编号）
UserName varchar(20) NOT NULL             ,--             用户姓名
Sex tinyint NULL            check(Sex='0' or Sex='1')               ,--     性别
Account varchar(20) NOT NULL              ,--   用户账号
Password varchar(100) NOT NULL           ,--            用户密码
Phone varchar(20) NULL                    ,-- 联系电话
Email varchar(50) NULL                   ,--  电子邮箱
FK_RoleID int          ,--    用户角色编号
CheckInTime datetime              ,--        加入时间
IsDelete tinyint       check(IsDelete='0' or IsDelete='1')            ,--       数据记录状态 0:使用中 1:该记录已删除
AlterTime datetime               ,--      修改时间

--主键 PK_User 主键表：User
--外键 FK_User_Role 外键表：Role
--索引 PK_User 聚集索引
--约束 无
)

insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('周爸爸',0,123,123,123456,'126@qq.com',10000001,'2015-5-5',0,'2018-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('张妈妈',1,456,4564,123567,'333312312@qq.com',10000002,'2014-5-5',0,'2019-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('杨爸爸',0,789,789,1234568,'1264@qq.com',10000003,'2013-5-5',0,'2018-9-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('周先生',0,12523,122223,123456,'1556526@qq.com',10000003,'2015-5-5',0,'2018-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('张妈妈',1,45556,4564,123567,'1264@qq.com',10000002,'2014-5-5',0,'2019-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('皮爸爸',0,78933,755559,1234568,'1264@qq.com',10000003,'2013-5-5',0,'2018-9-5')



--5.表描述 承运单信息表用于存放和管理承运单信息
create table Carriers
(
--字段名 数据类型 空/非空 字段简单描述
CarriersID int NOT NULL    primary key    identity(10001,1)           ,-- 承运单编号（字段自动编号）
SendCompany varchar(50) NULL            ,--  发货单位
SendAddress varchar(100) NULL          ,-- 发货单位地址
SendLinkman varchar(20) NULL           ,--    发货人
SendPhone varchar(20) NULL             ,--  发货人电话
ReceiveCompany varchar(50) NULL        ,--     收货单位
FK_ReceiveAddress varchar(100) NULL    ,--     收货单位地址
ReceiveLinkman varchar(20) NULL         ,--     收货人/联系人
ReceivePhone varchar(20) NULL           ,--   收货人电话/联系人电话
LeaverDate datetime NULL               ,--  承运日期
ReceiveDate datetime NULL               ,--    收货时间 
FinishedState tinyint NOT NULL    check(FinishedState='0' or FinishedState='1' or FinishedState='2' or FinishedState='3')      ,--      完成情况：0:待调度 1:已调度 2:已签收 3:已结算
InsuranceCost float NULL               ,--   保险费
TransportCost float NULL               ,--   运费
OtherCost float NULL                 ,-- 其他费用
TotalCost float NULL                 ,--  合计费用
Remark varchar(500) NULL              ,--    备注
FK_UserID int NOT NULL             ,--    业务员
CheckInTime datetime NOT NULL         ,--         录入时间
IsDelete tinyint NOT NULL        check(IsDelete='0' or IsDelete='1')     ,-- 数据记录状态 : 0:使用中 1:该记录已删除
AlterTime datetime NULL              ,--         修改时间

--主键 PK_AcceptanceForm 主键表：Carriers
--外键 FK_Carriers_User 外键表：User
--索引 PK_AcceptanceForm 聚集索引
--约束 无
)
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers where CarriersID like'%%' and SendLinkman like'%%' and SendAddress like'%%'and ReceiveLinkman like'%%' and FK_ReceiveAddress like'%%'
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers where CarriersID like'%%' and SendAddress like'%澳门%' and SendLinkman like'%%'and FK_ReceiveAddress like'%%' and ReceiveLinkman like'%%'
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers where CarriersID='10001'
insert into Carriers(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,LeaverDate,ReceiveDate,FinishedState,InsuranceCost,
TransportCost,OtherCost,TotalCost,Remark,FK_UserID,CheckInTime,IsDelete,AlterTime)
values('武汉公司','武汉','周某',123456,'仙桃公司','仙桃','杨某',12345,'2015-9-9','2015-9-10',2,20,10,0,30,'顺利',100000001,'2018-5-5',0,'2019-6-9')
insert into Carriers(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,LeaverDate,ReceiveDate,FinishedState,InsuranceCost,
TransportCost,OtherCost,TotalCost,Remark,FK_UserID,CheckInTime,IsDelete,AlterTime)
values('杭州公司','香港','样某',123456,'天津公司','天津','杨某',12345,'2015-6-9','2015-8-10',3,20,10,0,30,'顺利得很',100000002,'2017-5-5',0,'2018-6-9')
insert into Carriers(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,LeaverDate,ReceiveDate,FinishedState,InsuranceCost,
TransportCost,OtherCost,TotalCost,Remark,FK_UserID,CheckInTime,IsDelete,AlterTime)
values('上海公司','澳门','胡某',123456,'河南公司','河南','杨某',12345,'2015-4-9','2015-7-10',2,20,10,0,30,'超级顺利',100000003,'2016-5-5',0,'2017-6-9')

--6.表描述 货物单信息表用于存放和管理货物单信息
create table Goods
(
--货物表
--字段名 数据类型 空/非空 字段简单描述
GoodsID int NOT NULL    primary key identity(100001,1)         ,--货物编号（字段自动编号）
GoodsName varchar(50) NULL        ,--        货物名称
Amount int NULL                  ,--  货物数量
Weight float NULL               ,--  货物重量
Volume float NULL               ,--   货物体积
FK_CarriersID int NULL        ,--        承运单编号
IsDelete tinyint NOT NULL     check(IsDelete='0' or IsDelete='1')  ,--      数据记录状态 : 0:使用中 1:该记录已删除

--主键 PK_Goods 主键表：Goods
--外键 FK_Goods_Carriers 外键表：Carriers
--索引 PK_Goods 聚集索引
--约束 无
)

insert into Goods(GoodsName,Amount,Weight,Volume,FK_CarriersID,IsDelete)  values('零食',200,4000,300,10001,0)
insert into Goods(GoodsName,Amount,Weight,Volume,FK_CarriersID,IsDelete)  values('玩具',400,2000,200,10002,1)
insert into Goods(GoodsName,Amount,Weight,Volume,FK_CarriersID,IsDelete)  values('工具',100,40000,400,10003,0)
--7.表描述 调度作业信息表用于存放和管理调度作业信息
create table Scheduling
(
--调度任务信息表
--字段名 数据类型 空/非空 字段简单描述
SchedulingID int NOT NULL primary key identity(1000001,1)               ,--    调度编号（字段自动编号）
StartTime datetime NULL                 ,--   出发时间
FK_CarriersID int NULL            ,--   承运单编号
FK_TruckID int NULL                ,-- 车辆编号
OilCost float NULL                    ,--     油费
Toll float NULL                    ,--   过桥费
Fine float NULL                        ,--     罚款
OtherCost float NULL                  ,--       其他费用
TotalCost float NULL                ,--     合计成本
FK_UserID int NULL                 ,--      调 度员
Remark varchar(500) NULL               ,--       备注
CheckInTime datetime NULL              ,--       调度时间
IsDelete tinyint NOT NULL    check(IsDelete='0' or IsDelete='1')            ,--    数据记录状态 : 0:使用中 1:该记录已删除
AlterTime datetime NULL                 ,--       修改时间

--主键 PK_Scheduling 主键表：Scheduling
--外键 FK_Scheduling_Truck 外键表：Truck
--FK_Scheduling_User 外键表：User
--索引 PK_Scheduling 聚集索引
--约束 无
)
insert into Scheduling(StartTime,FK_CarriersID,FK_TruckID,OilCost,Toll,Fine,OtherCost,TotalCost,FK_UserID,Remark,CheckInTime,IsDelete,AlterTime)
values('2018-5-5',10001,101,200,10,200,0,410,100000001,'很不错','2015-8-9',0,'2019-6-3')
insert into Scheduling(StartTime,FK_CarriersID,FK_TruckID,OilCost,Toll,Fine,OtherCost,TotalCost,FK_UserID,Remark,CheckInTime,IsDelete,AlterTime)
values('2018-3-5',10002,102,200,10,200,0,410,100000002,'非常不错','2017-8-9',1,'2014-6-3')
insert into Scheduling(StartTime,FK_CarriersID,FK_TruckID,OilCost,Toll,Fine,OtherCost,TotalCost,FK_UserID,Remark,CheckInTime,IsDelete,AlterTime)
values('2018-6-5',10003,103,200,10,200,0,410,100000003,'超级不错','2018-3-9',0,'2018-6-3')

--10.表描述 系统日志信息表用于存放系统日志

create table LogDic
(
--日志字典表
--字段名 数据类型 空/非空 字段简单描述
TypeID int NOT NULL     primary key identity(111,1) ,--       类型 ID（字段自动编号）
TypeName varchar(20) NULL     ,--         类型名

--主键 PK_LogDic 主键表：LogDic
--外键 无 主键表：无
--索引 PK_Log 聚集索引
--约束 无

)

insert into LogDic(TypeName) values('添加日志')
insert into LogDic(TypeName) values('删除日志')
insert into LogDic(TypeName) values('修改日志')

--11.--表描述 系统日志信息表用于存放系统日志
create table SysLog
(
--系统日志表
--字段名 数据类型 空/非空 字段简单描述
LogID int NOT NULL  primary key identity(1111,1)                     ,--    日志编号（字段自动编号）
Behavior varchar(500) NULL            ,-- 操作行为
FK_TypeID int NULL          ,--行为类型
FK_UserID int NULL                 ,--用户 ID
Parameters varchar(MAX) NULL                    ,--参 数
ProcName varchar(50) NULL                  ,--存储过程名 
IP varchar(20) NULL                    ,--登录 IP
CheckInTime datetime NULL                ,--写入时间
Exception varchar(MAX) NULL                   ,--异常信息详情
IsException tinyint NULL        check(IsException='0' or IsException='1')            ,-- 0：正常 1：异常

--主键 PK_Log 主键表：SysLog
--外键 FK_SysLog_LogDic 外键表：LogDic
--FK_SysLog_User 外键表：User
----索引 PK_Log 聚集索引
----约束 无
)

insert into SysLog (Behavior,FK_TypeID,FK_UserID,Parameters,ProcName,IP,CheckInTime,Exception,IsException)
values('添加了一条数据',111,100000001,335553,'添加',123111112,'2018-9-9','无',0)
insert into SysLog (Behavior,FK_TypeID,FK_UserID,Parameters,ProcName,IP,CheckInTime,Exception,IsException)
values('删除了一条数据',112,100000002,335523,'删除',123111212,'2019-9-9','出现报错后来解决',1)
insert into SysLog (Behavior,FK_TypeID,FK_UserID,Parameters,ProcName,IP,CheckInTime,Exception,IsException)
values('修改了一条数据',113,100000003,335539,'修改',123111612,'2017-9-9','无',0)

select * from Truck
select * from TruckTeam
select * from SysLog
select * from LogDic
select * from Scheduling
select * from Goods
select * from Carriers
select * from [User]
select * from Role
select * from Contact
select * from  Driver  

select UserName,Account,Password from [User] where  Account='123' and Password='123'

select RoleID,RolePurview,[UserID],[UserName],[Account], [Password] from [User] t1 inner join Role t2 on t1.FK_RoleID=t2.RoleID where Account='123' and Password='123'




if exists(select * from sysobjects where name='proc_delUser')
drop proc proc_delUser
go

create proc proc_delUser
@roleID  int 
as
begin
delete from  [Role] where RoleID=@roleID
delete from [User] where FK_RoleID=@roleID
end

--exec proc_delUser 10000002

--delete from [User] where UserID='100000002'
select RoleID,RolePurview,[UserID],[UserName],[Account], [Password] from [User] t1,Role t2 where t1.FK_RoleID=t2.RoleID and [UserID]='100000001'

select RoleID,RolePurview,[UserID],[UserName],[Account], [Password],Email,Sex from [User] t1,Role t2 where t1.FK_RoleID=t2.RoleID and [UserName] like '%周%' and [Email] like '%%' and Sex like '%1%'

--update [User] set UserName='',Sex='',Account='',Password='',Phone='',FK_RoleID=''where UserID=100000001

--select TruckID,TeamName,Number,TeamID,Type,Remark from Truck t1 ,TruckTeam t2 where t1.TruckID=t2.TeamID


select TruckID,TeamName,Number,BuyDate,Type,t1.Remark from Truck t1,TruckTeam t2 where t1.FK_TeamID=t2.TeamID

--delete from Truck where TruckID='101'

select TruckID,FK_TeamID,TeamName,Number,BuyDate,Type,t1.Remark from Truck t1,TruckTeam t2 where t1.FK_TeamID=t2.TeamID and TruckID='105'

update Truck set  Number='湘V9999',BuyDate='2018-01-01',Type='跑车',Remark='超级强',FK_TeamID='2' where  TruckID='101'

select TruckID,FK_TeamID,TeamName,Number,BuyDate,Type,t1.Remark from Truck t1,TruckTeam t2 where t1.FK_TeamID=t2.TeamID and Number like '%32%' 

