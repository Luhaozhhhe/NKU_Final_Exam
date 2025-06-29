# <center>数据库MySQL笔记</center>

<center>网络空间安全学院 &ensp;信息安全 &ensp;  陆皓喆 &ensp;  2211044</center>

# 2019年上机样题

## 信息

![image-20240525114942141](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525114942141.png)

## 解答

### 1

给出职工中所有男性的所有信息（empid,empname,age,sex,edpid）

```

```



### 2

统计来自天津的“李”性职工信息，按年龄降序排序。（empid,empname,age,location）

```

```



### 3

给出每位职员参与项目的最高预算和最低预算（empname，highestbudget，lowestbudget）

```

```



### 4

给出所有项目超过一个的员工的id和参加的项目个数

```

```



### 5

给出项目编号为“c2”且预算最多的项目。（proid，projectname，budget）

```

```



### 6

给出参加“产品推广”项目，但不担任职位的员工的员工信息，（empid,empname，age,sex.depid）

```

```



### 7

给出工号为“10102”的员工每类项目的参加总数，若没有参加过某类项目，则参加项目总数显示为0（catid，proNum）

```

```



### 8

给出没有参与“软件类”项目女性职工的信息（empid,empname, age,sex,depid)

```

```



### 9

给出有30岁以上男性员工的省份名称和该省男员工最大年龄，结果按最大年龄升序排序（location，maxAge）

```

```



### 10

给出在广州工作的、参加“'产品推广'”项目的职员id、姓名及他们参加的项目个数

```

```



# 2021年上机样题

## 信息

![image-20240505113403005](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240505113403005.png)

数据库模式如下（分别为$Department，Employee，Category，Project，Workson$）：

> - 部门（部门号，部门名称，位置）
> - 员工（员工号，姓名，年龄，性别，所在部门号）
> - 项目种类（项目种类号，项目种类名）
> - 项目（项目号，项目名称，预算，项目种类号）
> - 员工工作情况（员工号，项目号，职责，开始日期）



## 解答

### 1

给出项目名称为“软件升级”的预算（$projectname, budget$）

```sql
SELECT projectname,budget
FROM Project
WHERE projectname='软件升级';
```



### 2

给出姓王的所有员工编号和姓名，并按照员工编号排序（$empid, empname$）

```sql
SELECT empid,empname
FROM Employee
WHERE empname='王%' order by empid asc;
```



### 3

统计每个项目参与的员工人数。（$proid, projectname, count$）

```sql
SELECT proid,projectname,count(*) AS count
FROM Project natural join Workson
GROUP BY proid;
```



### 4

给出部门人数超过两人的部门信息（不包括两人）。（$depid, depname$）

```sql
SELECT depid,depname
FROM Department natural join Employee
GROUP BY depid
HAVING count(empid)>2;
```



### 5

查找没有参加过项目$p6$的雇员信息。（$empid, empname, age, sex, depid$）

```sql
SELECT empid,empname,age,sex,depid
FROM Employee
WHERE empid not in (
    select empid from Workson group by empid WHERE proid='p6');
```



### 6

找出$Workson$表中职业为空的员工姓名，编号和所在部门名称（$empid, empname, depname$）

```sql
SELECT empid,empname,depname
FROM Workson natrual join Department natrual join Employee
WHERE job is null;
```



### 7

给出所有女员工的信息及参与项目的个数，如果没有参与项目，显示$0$。（$empid, empname, procount$）

```sql
SELECT empid,empname,count(proid) AS procount
FROM Employee natrual join Workson
WHERE sex='女'
GROUP BY empid;
```



### 8

给出参与人数**最少**的项目的员工信息（$empid, empname, number$）（注：可能存在多个项目参与人数**数量相同**的情况）

```sql
SELECT empid,empname,count(empid) as number
FROM Employee natural join Workson
WHERE count(empid)<=ALL(select count(empid) from Employee natural join Workson GROUP BY proid);
```



### 9

给出不同类别项目参与总人数的详细信息，按照参与总人数降序排序，参与总人数相同的按照$catid$升序排序（$catid, catname, participantcount$）

```sql
SELECT catid,catname,count(empid) as participantcount
FROM Category natural join Workson natural join Project
GROUP BY catid order by participantcount desc,catid asc;
```



### 10

给出参与了除$c5$之外的所有类别的项目的职员信息（$empid, empname$）

```sql
SELECT empid,empname
FROM Employee
WHERE NOT EXISTS 
(select catid from Category WHERE NOT IN 
 (SELECT catid from Employee natrual join Category natrual join Project natrual join Workson
             where catid<>'c5')
);
```



# 2024年上机样题

## 信息

<img src="E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525100524141.png" alt="image-20240525100524141" style="zoom: 67%;" />

## 解答

### 1

查询 ‘选课’ 表中所有不同的课号、平时成绩、期末成绩；要求只包括期末成绩高于平时成绩且课号大于3000的记录。（cor_id, mid_score, fin_score）（10分）

```sql
SELECT cor_id,mid_score,fin_score
FROM takes
WHERE fin_score>mid_score and cor_id>3000;
```

<img src="E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525101245332.png" alt="image-20240525101245332" style="zoom: 67%;" />

### 2

查询每个学院的学生平均年龄 (注：过滤学院编号为空的数据)。(col_id, avg_age)（10分）

```sql
SELECT col_id,avg(age) as avg_age
FROM student where col_id is not null
GROUP BY col_id;
```

![image-20240525102019535](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525102019535.png)

### 3

查询开设课程数量大于1门的学院编号、开设课程数量，并按课程数量从多到少排序。(col_id, cor_num)（10分）

```sql
SELECT col_id,count(*) as cor_num
FROM course 
GROUP BY col_id 
HAVING count(*)>1
order by cor_num desc;
```

![image-20240525102639924](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525102639924.png)

### 4

查询身份证号码中包含‘X’的学生的学号、姓名、性别、身份证号。(stu_id, stu_name, gender, idcard)（10分）

```sql
SELECT stu_id,stu_name,gender,idcard
FROM student
WHERE idcard LIKE '%X%';
```

![image-20240525103010114](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525103010114.png)

### 5

查询每门课程的平均成绩和选课人数，其中课程最终成绩=0.3\*平时成绩+0.7*期末成绩，按选课人数降序。（cor_id，cor_name，avg_score，student_count）（10分）

```sql
SELECT c.cor_id,c.cor_name,AVG(0.3*t.mid_score+0.7*t.fin_score) as avg_score,count(t.stu_id) as student_count
FROM course c join takes t on c.cor_id=t.cor_id
group by c.cor_name,c.cor_id
order by student_count desc;
```

<img src="E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525104236314.png" alt="image-20240525104236314" style="zoom:50%;" />

### 6

查询属于同一学院开设且在同一天上课的课程信息对儿。（cor_id, cor_name, dup_id, dup_name）（10分）

```sql
SELECT c1.cor_id as cor_id,c1.cor_name as cor_name,c2.cor_id as dup_id,c2.cor_name as dup_name
FROM course c1 join course c2
WHERE c1.cor_id>c2.cor_id and c1.col_id=c2.col_id and c1.day=c2.day;
```

![image-20240525105334165](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525105334165.png)

### 7

找出“高等数学A”课程成绩排名第十的学生信息，其中课程最终成绩=0.3\*平时成绩+0.7*期末成绩。（stu_id，stu_name，mid_score，fin_score）（10分）

```sql
SELECT t1.stu_id, s.stu_name, t1.mid_score, t1.fin_score
FROM takes t1
INNER JOIN student s ON t1.stu_id = s.stu_id
INNER JOIN course c ON t1.cor_id = c.cor_id
WHERE c.cor_name = '高等数学A'
AND (
    SELECT COUNT(*)
    FROM takes t2
    INNER JOIN course c2 ON t2.cor_id = c2.cor_id
    WHERE c2.cor_name = '高等数学A' AND ((t2.mid_score * 0.3) + (t2.fin_score * 0.7)) > ((t1.mid_score * 0.3) + (t1.fin_score * 0.7))
) = 9;
```

![image-20240525112126788](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525112126788.png)

### 8

查询所有没在周末（周末对应星期属性值为S）开设课程的学院的编号及院名。（col_id, col_name）(10分)

```sql
SELECT c1.col_id,c1.col_name
FROM college c1
WHERE NOT EXISTS(select * from course c2 where c2.col_id=c1.col_id and c2.day='S');
```

![image-20240525112542874](E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525112542874.png)

### 9

查询至少选修了6门课程的学生的学号、姓名。（stu_id, stu_name）(10分)

```sql
SELECT 
    s.stu_id,
    s.stu_name
FROM 
    student s
JOIN (
    SELECT 
        sc.stu_id
    FROM 
        takes sc
    GROUP BY 
        sc.stu_id
    HAVING 
        COUNT(sc.cor_id) >= 6
) AS subquery ON s.stu_id = subquery.stu_id;
```

<img src="E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525113543882.png" alt="image-20240525113543882" style="zoom:50%;" />

### 10

查询至少选修了一门课程的学生的学号、姓名、学院编号以及他们的加权平均分，并且按照加权平均分从高到低排序。其中，加权平均分计算方式：[(课程A期末成绩\*课程A学分)+ (课程B期末成绩*课程B学分)] / 总课程学分。（stu_id, stu_name, col_id, w_score）（10分）

```sql
SELECT s1.stu_id, s1.stu_name, s1.col_id, sum(t1.fin_score*c1.credits)/sum(c1.credits) as w_score
FROM student s1 join takes t1 on s1.stu_id=t1.stu_id
join course c1 on c1.cor_id=t1.cor_id
GROUP BY s1.stu_id
HAVING sum(c1.credits)>0
order by w_score desc;
```

<img src="E:\学学学\本科\大二下\数据库系统\数据库MySQL笔记_陆皓喆\MySQL复习\数据库MySQL笔记.assets\image-20240525114722114.png" alt="image-20240525114722114" style="zoom: 67%;" />
