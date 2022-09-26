use master
go

if exists		 (select * from sysdatabases where name='carteam')
drop database carteam
go


create database carteam
go

use carteam
go


--��� ���ӣ�ϵͳ ���� �������ƺͼ����� ʹ�÷�ʽ
--TruckTeam --1 ������Ϣά��  ������Ϣ�� ����
--2 ������Ϣά�� Truck ������Ϣ�� ����
--3 ��ʻԱ��Ϣά�� Driver ��ʻԱ��Ϣ�� ����
--4 ��ʻԱ��Ϣά�� Contact ��ʻԱ�����󶨱� ����
--5 ����������� Carriers ���˵��� ����
--6 ����������� Goods ����� ����
--7 ����������� Scheduling ����������Ϣ�� ����
--8 �û����� Role ��ɫ�� ����
--9 �û����� User �û��� ����
--10 ϵͳ��־ά�� LogDic ��־�ֵ� ����
--11 ϵͳ��־ά�� SysLog ϵͳ��־�� ����





--1.������ ������Ϣ�����ڴ�ź͹�������Ϣ
create table TruckTeam
(
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
TeamID int NOT NULL  primary key identity (1,1),      --���ӱ�ţ��ֶ��Զ���ţ�
TeamName varchar(50) NOT NULL,              --��������
Leader varchar(20) NULL,             --���Ӹ�����
Remark varchar(200) NULL,             -- ��ע
CheckInTime datetime NULL,              --����ʱ��
IsDelete tinyint NULL        check(IsDelete='0' or IsDelete='1'),        --���ݼ�¼״̬ 0:ʹ���� 1:�ü�¼��ɾ��
AlterTime datetime NULL,                --�޸�ʱ��
--������ ������Ϣ�����ڴ�ź͹�������Ϣ
---���� PK_TruckTeam ������TruckTeam
--��� �� �������
--���� PK_TruckTeam �ۼ�����
--Լ�� ��
)
insert  into TruckTeam(TeamName,Leader,Remark,CheckInTime,IsDelete,AlterTime)
values('���ڶ�','��ĳ','��ǿ�Ķ���','2015-3-12',0,'2018-03-03')
insert  into TruckTeam(TeamName,Leader,Remark,CheckInTime,IsDelete,AlterTime)
values('�µ϶�','��ĳ','��ǿǿ�Ķ���','2015-8-12',1,'2017-03-03')
insert  into TruckTeam(TeamName,Leader,Remark,CheckInTime,IsDelete,AlterTime)
values('���۶�','��ĳ','����ǿ�Ķ���','2015-7-12',1,'2016-03-03')



--2.������ ��ʻԱ��Ϣ�����ڴ�ź͹����ʻԱ��Ϣ

create table Truck
(
TruckID int NOT NULL primary key identity(101,1),     --������ţ��ֶ��Զ���ţ�
Number varchar(50) NOT NULL    ,       --���ƺ���
BuyDate datetime NULL        ,    -- ��������
Type varchar(20) NULL        ,     --��������
Length varchar(20) NULL      ,    -- ����ʱ��
Tonnage int NULL            ,      -- ��λ
FK_TeamID int NULL        ,      -- �������ӱ��
State tinyint NULL    check(State='1' or State='2'),-- ����״̬ : 1:������ 2:����
Remark varchar(500) NULL    ,   -- ��ע
CheckInTime datetime NULL   ,    --   ����ʱ��
IsDelete tinyint  NULL  check(IsDelete='0' or IsDelete='1') ,     --  ���ݼ�¼״̬ : 0:ʹ���� 1:�ü�¼��ɾ��
AlterTime datetime NULL     ,     --  �޸�ʱ��


--������ ������Ϣ�����ڴ�ź͹�������Ϣ
--���� PK_Truck ������Truck
--��� FK_Truck_TruckTeam �����TruckTeam
--���� PK_Truck �ۼ�����
--Լ�� ��
)
--insert into Truck(FK_TeamID,Number,Type,Tonnage,t1.Remark)
--values(2,'��S9965','����',100,'��Һ�����������')


insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('��A3240','2018-1-1','һ������','2013-1-1',50,1,1,'���ܺܺã��������������Ʒ','2015-5-5',0,'2018-3-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('��B6652','2018-10-1','�����ó�','2019-1-1',50,2,2,'�ܵúܿ죬�ܺܿ쵽��ָ���ص�','2014-5-5',1,'2017-2-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('��C1234','2018-7-1','��������','2018-1-1',50,3,1,'�˵ĺܶ࣬�ܰ�ȫ������Ҫ�Ķ���','2017-5-5',1,'2016-1-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('��A9940','2018-6-1','һ������','2013-1-1',50,1,1,'�ٶȺܿ�','2015-6-5',0,'2018-9-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('��B4452','2018-1-5','�����ó�','2019-1-1',50,2,2,'����ܶ�','2014-4-5',1,'2017-1-3')
insert into Truck(Number,BuyDate,Type,Length,Tonnage,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('��C1134','2018-7-6','��������','2018-1-1',50,3,1,'�Եú���','2017-3-5',1,'2016-2-3')

--3.������ ��ʻԱ��Ϣ�����ڴ�ź͹����ʻԱ��Ϣ

create table Driver
(
--��ʻԱ��Ϣ��
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
DriverID int NOT NULL   primary key identity(101,1),        --˾����ţ��ֶ��Զ���ţ�
Name varchar(20) NOT NULL        ,      --˾������
Sex tinyint NULL     check(Sex='0' or Sex='1')           ,--�Ա� �� 0 �� 1 Ů
Birth datetime NULL             ,  --��������
Phone varchar(20) NULL          ,     --��ϵ�绰
IDCard varchar(50) NULL         ,     --���֤����
FK_TeamID int NULL             ,  --���ӱ��
State tinyint NULL           check(State='0' or State='1')   ,  --����״̬ : 1:������ 2:����
Remark varchar(500) NULL        ,      --��ע
CheckInTime datetime NULL       ,        -- ����ʱ��
IsDelete tinyint NOT NULL     check(IsDelete='0' or IsDelete='1')   ,        -- ���ݼ�¼״̬ : 0:ʹ���� 1:�ü�¼��ɾ��
AlterTime datetime NULL         ,          --�޸�ʱ��

--���� PK_Driver ������Driver
--��� FK_Driver_TruckTeam �����TruckTeam
--���� PK_Driver �ۼ�����
--Լ�� ��
)
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('�ܴ��',0,'2000-03-03',125466265,42695685526545,1,1,'˯�ߺܺ�','2015-2-6',0,'2018-01-1')
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('�����',1,'2000-01-03',1254656265,42691285526545,2,0,'���ĺܺ�','2013-2-6',0,'2018-02-1')
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)
values('����',0,'2000-02-03',126566265,426953216526545,3,1,'��ϲ����','2012-2-6',0,'2018-02-1')



--4.����˾���������������ӳ������ʻԱ
create table Contact
(
--��ʻԱ�����󶨱�
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
ContactID int NOT NULL  primary key identity(1001,1),              --��ϵ��ţ��ֶ��Զ���ţ�
FK_TruckID int NULL       ,      --�������
FK_DriverID int NULL            ,                 --˾�����

--���� PK_Contact ������Contact
--��� FK_Contact_Driver �����Driver
--FK_Contact_Truck �����Truck
--���� PK_Contact �ۼ�����
--Լ�� ��
--���˵���
)
insert into Contact(FK_TruckID,FK_DriverID)values(1,101)
insert into Contact(FK_TruckID,FK_DriverID)values(2,102)
insert into Contact(FK_TruckID,FK_DriverID)values(3,103)

--8.������ ϵͳ��ɫ�����ڴ��ϵͳȨ�����ݣ������û�Ȩ��
create table Role
(
--��ɫ��
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
RoleID int NOT NULL  primary key identity(10000001,1)              ,--   ��ɫ��ţ��ֶ��Զ���ţ�
RoleName nvarchar(50) NULL          ,--    ��ɫ����
RolePurview nvarchar(50) NULL       ,--       ��ɫȨ��

--���� RoleID ������Role
--��� �� �������
--���� PK_Role �ۼ�����
--Լ�� ��
)


insert into  Role(RoleName,RolePurview) values('����Ա','�ܳ���Ӷӳ�')
insert into  Role(RoleName,RolePurview) values('����Ա','�ܳ���Ӹ��ӳ�')
insert into  Role(RoleName,RolePurview) values('����Ա','�ܳ���Ӷ�Ա')

--9.--������ ϵͳ�û������ڴ���û��˻�������Ϣ���û���Ϣ
create table [User]
(
--�û���
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
UserID int NOT NULL     primary key identity(100000001,1)                   ,--   ��ɫ��ţ��ֶ��Զ���ţ�
UserName varchar(20) NOT NULL             ,--             �û�����
Sex tinyint NULL            check(Sex='0' or Sex='1')               ,--     �Ա�
Account varchar(20) NOT NULL              ,--   �û��˺�
Password varchar(100) NOT NULL           ,--            �û�����
Phone varchar(20) NULL                    ,-- ��ϵ�绰
Email varchar(50) NULL                   ,--  ��������
FK_RoleID int          ,--    �û���ɫ���
CheckInTime datetime              ,--        ����ʱ��
IsDelete tinyint       check(IsDelete='0' or IsDelete='1')            ,--       ���ݼ�¼״̬ 0:ʹ���� 1:�ü�¼��ɾ��
AlterTime datetime               ,--      �޸�ʱ��

--���� PK_User ������User
--��� FK_User_Role �����Role
--���� PK_User �ۼ�����
--Լ�� ��
)

insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('�ְܰ�',0,123,123,123456,'126@qq.com',10000001,'2015-5-5',0,'2018-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('������',1,456,4564,123567,'333312312@qq.com',10000002,'2014-5-5',0,'2019-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('��ְ�',0,789,789,1234568,'1264@qq.com',10000003,'2013-5-5',0,'2018-9-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('������',0,12523,122223,123456,'1556526@qq.com',10000003,'2015-5-5',0,'2018-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('������',1,45556,4564,123567,'1264@qq.com',10000002,'2014-5-5',0,'2019-8-5')
insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
values ('Ƥ�ְ�',0,78933,755559,1234568,'1264@qq.com',10000003,'2013-5-5',0,'2018-9-5')



--5.������ ���˵���Ϣ�����ڴ�ź͹�����˵���Ϣ
create table Carriers
(
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
CarriersID int NOT NULL    primary key    identity(10001,1)           ,-- ���˵���ţ��ֶ��Զ���ţ�
SendCompany varchar(50) NULL            ,--  ������λ
SendAddress varchar(100) NULL          ,-- ������λ��ַ
SendLinkman varchar(20) NULL           ,--    ������
SendPhone varchar(20) NULL             ,--  �����˵绰
ReceiveCompany varchar(50) NULL        ,--     �ջ���λ
FK_ReceiveAddress varchar(100) NULL    ,--     �ջ���λ��ַ
ReceiveLinkman varchar(20) NULL         ,--     �ջ���/��ϵ��
ReceivePhone varchar(20) NULL           ,--   �ջ��˵绰/��ϵ�˵绰
LeaverDate datetime NULL               ,--  ��������
ReceiveDate datetime NULL               ,--    �ջ�ʱ�� 
FinishedState tinyint NOT NULL    check(FinishedState='0' or FinishedState='1' or FinishedState='2' or FinishedState='3')      ,--      ��������0:������ 1:�ѵ��� 2:��ǩ�� 3:�ѽ���
InsuranceCost float NULL               ,--   ���շ�
TransportCost float NULL               ,--   �˷�
OtherCost float NULL                 ,-- ��������
TotalCost float NULL                 ,--  �ϼƷ���
Remark varchar(500) NULL              ,--    ��ע
FK_UserID int NOT NULL             ,--    ҵ��Ա
CheckInTime datetime NOT NULL         ,--         ¼��ʱ��
IsDelete tinyint NOT NULL        check(IsDelete='0' or IsDelete='1')     ,-- ���ݼ�¼״̬ : 0:ʹ���� 1:�ü�¼��ɾ��
AlterTime datetime NULL              ,--         �޸�ʱ��

--���� PK_AcceptanceForm ������Carriers
--��� FK_Carriers_User �����User
--���� PK_AcceptanceForm �ۼ�����
--Լ�� ��
)
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers where CarriersID like'%%' and SendLinkman like'%%' and SendAddress like'%%'and ReceiveLinkman like'%%' and FK_ReceiveAddress like'%%'
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers where CarriersID like'%%' and SendAddress like'%����%' and SendLinkman like'%%'and FK_ReceiveAddress like'%%' and ReceiveLinkman like'%%'
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers
--select CarriersID, SendAddress,SendLinkman,SendPhone,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,ReceiveDate from Carriers where CarriersID='10001'
insert into Carriers(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,LeaverDate,ReceiveDate,FinishedState,InsuranceCost,
TransportCost,OtherCost,TotalCost,Remark,FK_UserID,CheckInTime,IsDelete,AlterTime)
values('�人��˾','�人','��ĳ',123456,'���ҹ�˾','����','��ĳ',12345,'2015-9-9','2015-9-10',2,20,10,0,30,'˳��',100000001,'2018-5-5',0,'2019-6-9')
insert into Carriers(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,LeaverDate,ReceiveDate,FinishedState,InsuranceCost,
TransportCost,OtherCost,TotalCost,Remark,FK_UserID,CheckInTime,IsDelete,AlterTime)
values('���ݹ�˾','���','��ĳ',123456,'���˾','���','��ĳ',12345,'2015-6-9','2015-8-10',3,20,10,0,30,'˳���ú�',100000002,'2017-5-5',0,'2018-6-9')
insert into Carriers(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany,FK_ReceiveAddress,ReceiveLinkman,ReceivePhone,LeaverDate,ReceiveDate,FinishedState,InsuranceCost,
TransportCost,OtherCost,TotalCost,Remark,FK_UserID,CheckInTime,IsDelete,AlterTime)
values('�Ϻ���˾','����','��ĳ',123456,'���Ϲ�˾','����','��ĳ',12345,'2015-4-9','2015-7-10',2,20,10,0,30,'����˳��',100000003,'2016-5-5',0,'2017-6-9')

--6.������ ���ﵥ��Ϣ�����ڴ�ź͹�����ﵥ��Ϣ
create table Goods
(
--�����
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
GoodsID int NOT NULL    primary key identity(100001,1)         ,--�����ţ��ֶ��Զ���ţ�
GoodsName varchar(50) NULL        ,--        ��������
Amount int NULL                  ,--  ��������
Weight float NULL               ,--  ��������
Volume float NULL               ,--   �������
FK_CarriersID int NULL        ,--        ���˵����
IsDelete tinyint NOT NULL     check(IsDelete='0' or IsDelete='1')  ,--      ���ݼ�¼״̬ : 0:ʹ���� 1:�ü�¼��ɾ��

--���� PK_Goods ������Goods
--��� FK_Goods_Carriers �����Carriers
--���� PK_Goods �ۼ�����
--Լ�� ��
)

insert into Goods(GoodsName,Amount,Weight,Volume,FK_CarriersID,IsDelete)  values('��ʳ',200,4000,300,10001,0)
insert into Goods(GoodsName,Amount,Weight,Volume,FK_CarriersID,IsDelete)  values('���',400,2000,200,10002,1)
insert into Goods(GoodsName,Amount,Weight,Volume,FK_CarriersID,IsDelete)  values('����',100,40000,400,10003,0)
--7.������ ������ҵ��Ϣ�����ڴ�ź͹��������ҵ��Ϣ
create table Scheduling
(
--����������Ϣ��
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
SchedulingID int NOT NULL primary key identity(1000001,1)               ,--    ���ȱ�ţ��ֶ��Զ���ţ�
StartTime datetime NULL                 ,--   ����ʱ��
FK_CarriersID int NULL            ,--   ���˵����
FK_TruckID int NULL                ,-- �������
OilCost float NULL                    ,--     �ͷ�
Toll float NULL                    ,--   ���ŷ�
Fine float NULL                        ,--     ����
OtherCost float NULL                  ,--       ��������
TotalCost float NULL                ,--     �ϼƳɱ�
FK_UserID int NULL                 ,--      �� ��Ա
Remark varchar(500) NULL               ,--       ��ע
CheckInTime datetime NULL              ,--       ����ʱ��
IsDelete tinyint NOT NULL    check(IsDelete='0' or IsDelete='1')            ,--    ���ݼ�¼״̬ : 0:ʹ���� 1:�ü�¼��ɾ��
AlterTime datetime NULL                 ,--       �޸�ʱ��

--���� PK_Scheduling ������Scheduling
--��� FK_Scheduling_Truck �����Truck
--FK_Scheduling_User �����User
--���� PK_Scheduling �ۼ�����
--Լ�� ��
)
insert into Scheduling(StartTime,FK_CarriersID,FK_TruckID,OilCost,Toll,Fine,OtherCost,TotalCost,FK_UserID,Remark,CheckInTime,IsDelete,AlterTime)
values('2018-5-5',10001,101,200,10,200,0,410,100000001,'�ܲ���','2015-8-9',0,'2019-6-3')
insert into Scheduling(StartTime,FK_CarriersID,FK_TruckID,OilCost,Toll,Fine,OtherCost,TotalCost,FK_UserID,Remark,CheckInTime,IsDelete,AlterTime)
values('2018-3-5',10002,102,200,10,200,0,410,100000002,'�ǳ�����','2017-8-9',1,'2014-6-3')
insert into Scheduling(StartTime,FK_CarriersID,FK_TruckID,OilCost,Toll,Fine,OtherCost,TotalCost,FK_UserID,Remark,CheckInTime,IsDelete,AlterTime)
values('2018-6-5',10003,103,200,10,200,0,410,100000003,'��������','2018-3-9',0,'2018-6-3')

--10.������ ϵͳ��־��Ϣ�����ڴ��ϵͳ��־

create table LogDic
(
--��־�ֵ��
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
TypeID int NOT NULL     primary key identity(111,1) ,--       ���� ID���ֶ��Զ���ţ�
TypeName varchar(20) NULL     ,--         ������

--���� PK_LogDic ������LogDic
--��� �� ��������
--���� PK_Log �ۼ�����
--Լ�� ��

)

insert into LogDic(TypeName) values('�����־')
insert into LogDic(TypeName) values('ɾ����־')
insert into LogDic(TypeName) values('�޸���־')

--11.--������ ϵͳ��־��Ϣ�����ڴ��ϵͳ��־
create table SysLog
(
--ϵͳ��־��
--�ֶ��� �������� ��/�ǿ� �ֶμ�����
LogID int NOT NULL  primary key identity(1111,1)                     ,--    ��־��ţ��ֶ��Զ���ţ�
Behavior varchar(500) NULL            ,-- ������Ϊ
FK_TypeID int NULL          ,--��Ϊ����
FK_UserID int NULL                 ,--�û� ID
Parameters varchar(MAX) NULL                    ,--�� ��
ProcName varchar(50) NULL                  ,--�洢������ 
IP varchar(20) NULL                    ,--��¼ IP
CheckInTime datetime NULL                ,--д��ʱ��
Exception varchar(MAX) NULL                   ,--�쳣��Ϣ����
IsException tinyint NULL        check(IsException='0' or IsException='1')            ,-- 0������ 1���쳣

--���� PK_Log ������SysLog
--��� FK_SysLog_LogDic �����LogDic
--FK_SysLog_User �����User
----���� PK_Log �ۼ�����
----Լ�� ��
)

insert into SysLog (Behavior,FK_TypeID,FK_UserID,Parameters,ProcName,IP,CheckInTime,Exception,IsException)
values('�����һ������',111,100000001,335553,'���',123111112,'2018-9-9','��',0)
insert into SysLog (Behavior,FK_TypeID,FK_UserID,Parameters,ProcName,IP,CheckInTime,Exception,IsException)
values('ɾ����һ������',112,100000002,335523,'ɾ��',123111212,'2019-9-9','���ֱ���������',1)
insert into SysLog (Behavior,FK_TypeID,FK_UserID,Parameters,ProcName,IP,CheckInTime,Exception,IsException)
values('�޸���һ������',113,100000003,335539,'�޸�',123111612,'2017-9-9','��',0)

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

select RoleID,RolePurview,[UserID],[UserName],[Account], [Password],Email,Sex from [User] t1,Role t2 where t1.FK_RoleID=t2.RoleID and [UserName] like '%��%' and [Email] like '%%' and Sex like '%1%'

--update [User] set UserName='',Sex='',Account='',Password='',Phone='',FK_RoleID=''where UserID=100000001

--select TruckID,TeamName,Number,TeamID,Type,Remark from Truck t1 ,TruckTeam t2 where t1.TruckID=t2.TeamID


select TruckID,TeamName,Number,BuyDate,Type,t1.Remark from Truck t1,TruckTeam t2 where t1.FK_TeamID=t2.TeamID

--delete from Truck where TruckID='101'

select TruckID,FK_TeamID,TeamName,Number,BuyDate,Type,t1.Remark from Truck t1,TruckTeam t2 where t1.FK_TeamID=t2.TeamID and TruckID='105'

update Truck set  Number='��V9999',BuyDate='2018-01-01',Type='�ܳ�',Remark='����ǿ',FK_TeamID='2' where  TruckID='101'

select TruckID,FK_TeamID,TeamName,Number,BuyDate,Type,t1.Remark from Truck t1,TruckTeam t2 where t1.FK_TeamID=t2.TeamID and Number like '%32%' 

