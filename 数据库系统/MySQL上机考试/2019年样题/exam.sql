CREATE TABLE Department
(
depid	varchar(20)	not null	PRIMARY KEY,
depname	varchar(20)	not null,
location	varchar(20)	not null,
)
CREATE TABLE Employee
(
empid	varchar(20)	not null	PRIMARY KEY,
empname	varchar(20)	not null,
age int not null,
sex varchar(10) not null,
depid	varchar(20)	not null	foreign key(depid) references Department(depid)
)
CREATE TABLE Category
(
catid	varchar(20)	not null	PRIMARY KEY,
catname	varchar(20)	not null
)
CREATE TABLE Project
(
proid		varchar(20)	not null	PRIMARY KEY,
projectname varchar(20) not null,
budget	int	not null,
catid	varchar(20)	not null	foreign key(catid) references Category(catid)
)
CREATE TABLE Workson
(
empid	varchar(20)	not null	foreign key(empid) references Employee(empid),
proid		varchar(20)	not null	foreign key(proid) references Project(proid),
job	varchar(20)	,
enterdate	date	not null,
PRIMARY KEY (empid,proid)
)
INSERT INTO Department
SELECT 'd1', '开发部', '天津' union
SELECT 'd2', '财务部', '北京' union
SELECT 'd3', '市场部', '广州' union
SELECT 'd4', '人才管理部', '天津'
INSERT INTO Employee
SELECT '10102', '张三', 34, '男','d1' union
SELECT '10211', '李飞', 24, '男','d2' union
SELECT '18316', '王玲', 29, '女','d4' union
SELECT '22020', '周城', 39, '男','d2' union
SELECT '22135', '徐晶', 35, '女','d3' union
SELECT '25348', '冯昕', 27, '男','d1' union
SELECT '28559', '李风', 41, '女','d3' union
SELECT '29346', '王新', 32, '男','d1' union
SELECT '30678', '孙浩文', 28, '女','d4' 


INSERT INTO Category
SELECT 'c1', '设计类' union
SELECT 'c2', '采购类' union
SELECT 'c3', '营销类' union
SELECT 'c4', '软件类' union
SELECT 'c5', '硬件类'



INSERT INTO Project
SELECT 'p1','产品推广', 120000, 'c3' union
SELECT 'p2', '广告设计',40000, 'c1' union
SELECT 'p3', '软件升级', 185000, 'c4' union
SELECT 'p4', '服务器采购',150000, 'c2' union
SELECT 'p5', '办公用品采购',80000, 'c2' union
SELECT 'p6', '软件开发',85000, 'c4' 


INSERT INTO Workson 
SELECT '10211', 'p1', '分析员', '2017-01-01' union
SELECT '25348', 'p6', '职员', '2018-02-01' union
SELECT '10102', 'p3', '管理员', '2018-08-05' union
SELECT '25348', 'p4', '职员', '2018-03-23' union
SELECT '22020', 'p6', '管理员', '2019-03-01' union
SELECT '28559', 'p5', '职员', '2019-02-20' union
SELECT '29346', 'p5',  null, '2018-04-12' union
SELECT '25348', 'p1',  null, '2017-06-04' union
SELECT '25348', 'p2',  null, '2018-11-15' union
SELECT '22020', 'p3', '职员', '2017-07-16' union
SELECT '22135', 'p2', '管理员', '2017-12-18' union
SELECT '18316', 'p5', '职员', '2018-06-22' union
SELECT '10102', 'p4', '管理员', '2018-10-29' union
SELECT '28559', 'p1', '管理员', '2019-02-11' union
SELECT '10102', 'p5', '职员', '2018-12-10' union
SELECT '18316', 'p1', '职员', '2017-09-28' union
SELECT '10211', 'p6', '分析员', '2018-05-27' union
SELECT '10102', 'p2', '职员', '2018-11-27' union
SELECT '29346', 'p2', '职员', '2018-02-03' union
SELECT '18316', 'p6', '职员', '2018-05-01' 
