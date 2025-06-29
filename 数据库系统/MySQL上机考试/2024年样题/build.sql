-- create database stu
DROP DATABASE IF EXISTS stu;
CREATE DATABASE stu;
USE stu;


-- create tables
-- create table college
CREATE TABLE college (
  col_id VARCHAR(5),
  col_name VARCHAR(20) NOT NULL,
  charge VARCHAR(20) NOT NULL,
  PRIMARY KEY (col_id)
);

-- create table student
CREATE TABLE student (
  stu_id VARCHAR(7),
  stu_name VARCHAR(20) NOT NULL,
  gender VARCHAR(1) CHECK (gender IN ('M', 'F')),
  age NUMERIC(2, 0) CHECK (age > 0 AND age < 100),
  idcard VARCHAR(18),
  col_id VARCHAR(5),
  inday DATE,
  PRIMARY KEY (stu_id),
  FOREIGN KEY (col_id) REFERENCES college (col_id) ON DELETE SET NULL
);

-- create table course
CREATE TABLE course (
  cor_id VARCHAR(10),
  cor_name VARCHAR(50) NOT NULL,
  col_id VARCHAR(5),
  credits NUMERIC(2, 1) NOT NULL CHECK (credits > 0.0),
  day VARCHAR(1) CHECK (day IN ('M', 'T', 'W', 'R', 'F', 'S', 'U')),
  start_time TIME,
  end_time TIME,
  PRIMARY KEY (cor_id),
  FOREIGN KEY (col_id) REFERENCES college (col_id) ON DELETE SET NULL
);

-- create table takes
CREATE TABLE takes (
  stu_id VARCHAR(7),
  cor_id VARCHAR(7),
  mid_score NUMERIC(4, 1) CHECK (mid_score >= 0.0 AND mid_score <= 100.0),
  fin_score NUMERIC(4, 1) CHECK (fin_score >= 0.0 AND fin_score <= 100.0),
  PRIMARY KEY (stu_id, cor_id),
  FOREIGN KEY (stu_id) REFERENCES student (stu_id) ON DELETE CASCADE,
  FOREIGN KEY (cor_id) REFERENCES course (cor_id) ON DELETE CASCADE
);


-- insert data
-- insert college
INSERT INTO college(col_id, col_name, charge) VALUES("UPEC", "通识选修课", "王安");
INSERT INTO college(col_id, col_name, charge) VALUES("ENTD", "公共英语教学部", "杨彬");
INSERT INTO college(col_id, col_name, charge) VALUES("IPTD", "马克思主义基础理论教学部", "谷庆丰");
INSERT INTO college(col_id, col_name, charge) VALUES("AMTD", "高等数学教学部", "徐兵");
INSERT INTO college(col_id, col_name, charge) VALUES("COMP", "计算机学院", "刘菲菲");
INSERT INTO college(col_id, col_name, charge) VALUES("CSSE", "网络空间安全学院", "刘菲菲");
INSERT INTO college(col_id, col_name, charge) VALUES("FINA", "金融学院", "胡金锁");
INSERT INTO college(col_id, col_name, charge) VALUES("LAWS", "法学院", "李良多");
INSERT INTO college(col_id, col_name, charge) VALUES("PETDS", "体育部", "潘广");
INSERT INTO college(col_id, col_name, charge) VALUES("SOFT", "软件学院", "张子维");

-- insert student
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0411412", "齐达雷", 'M', 22, "370102205502032514", "COMP", "2073-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0310523", "徐童帆", 'F', 21, "120106205603310180", "CSSE", "2074-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0310524", "朱鹏程", 'M', 20, "110108205612108751", "CSSE", "2074-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0311423", "董参商", 'M', 21, "120114205605312374", "COMP", "2074-09-02");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0210119", "霍京", 'M', 20, "500156205701011090", "CSSE", "2075-09-02");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0210120", "衣胜男", 'F', 20, "370211205708184961", "LAWS", "2075-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0210535", "王安", 'M', 20, "120104205707067119", "LAWS", "2075-08-31");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0210553", "李玥", 'M', 19, "13092920581124072X", "CSSE", "2075-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0210655", "王平", 'M', 20, "120104205707067012", "CSSE", "2075-08-31");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0211011", "林伊伊", 'F', 20, "331024205710232541", "COMP", "2075-08-31");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0211168", "姚童茗", 'F', 19, "110105205710010820", "FINA", "2075-08-31");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0211258", "艾之章", 'M', Null, Null, "COMP", "2075-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0211377", "张谦", 'M', 20, "14010520570430123X", "COMP", "2075-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0211666", "王安", 'F', 19, "320411205710231327", "COMP", "2075-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0110058", "郭美濑", 'F', 19, "440120205806068728", "LAWS", "2076-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0110114", "周冲", 'M', 19, "12010320580829113X", "CSSE", "2076-08-31");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0110233", "张笑语", 'F', 18, "430922205909100721", "CSSE", "2076-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0110514", "王安", 'M', 19, "220281205804291114", "CSSE", "2076-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111010", "邱依玲", 'F', 19, "410822205802120184", "COMP", "2076-09-02");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111100", "阮建国", 'M', 18, "131103205912050857", "SOFT", "2076-09-02");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111123", "王安默", 'F', 19, "120101250803319789", "COMP", "2076-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111168", "姚同铭", 'M', 18, "131104205909194039", "COMP", "2076-09-01");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111871", "魏前程", Null, Null, Null, Null, Null);
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111917", "钱曼曼", 'F', 19, "370102205805051763", "FINA", "2076-08-31");
INSERT INTO student(stu_id, stu_name, gender, age, idcard, col_id, inday) VALUES("0111996", "张睐", 'F', 17, "110108206002038885", "COMP", Null);

-- insert course
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0513", "健康教育", "UPEC", 1.5, 'S', "08:00:00", "11:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0113", "基础英语", "ENTD", 2.5, 'M', "08:00:00", "09:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0211", "高级英语", "ENTD", 2, 'T', "08:00:00", "09:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0309", "毛概", "IPTD", 3.5, 'F', "16:00:00", "17:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0310", "马原", "IPTD", 3.5, 'W', "14:00:00", "15:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0358", "高等数学B", "AMTD", 3, 'R', "08:00:00", "10:45:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0372", "高等数学A", "AMTD", 3, 'M', "08:00:00", "11:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0912", "数据库系统", "COMP", 3.5, 'M', "16:00:00", Null);
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0917", "算法导论", "COMP", 3.5, 'T', "14:00:00", "17:15:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0009", "操作系统", "COMP", 3.5, 'W', "18:30:00", "20:10:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("0010", "计算机网络", "COMP", 3.5, 'R', "08:00:00", "09:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("1012", "数据库系统", "CSSE", 3.5, 'M', "12:55:00", "15:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("1016", "算法设计", "CSSE", 2.5, 'W', "08:55:00", "11:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("1019", "嵌入式系统", "CSSE", 3.5, 'F', "12:55:00", "15:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("1027", "网络技术", "CSSE", 2.5, 'F', Null, Null);
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("1476", "专业规划", "FINA", 2.5, 'U', "10:00:00", "11:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("2177", "法律方法", "LAWS", 2, 'M', "18:30:00", "20:10:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("2841", "体育理论", "PETDS", 1, Null, Null, Null);
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("2879", "篮球", "PETDS", 1, 'W', "10:00:00", "11:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("2913", "排球", "PETDS", 1, 'F', "08:00:00", "09:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("3076", "足球", "PETDS", 1, 'T', "14:00:00", "15:40:00");
INSERT INTO course(cor_id, cor_name, col_id, credits, day, start_time, end_time) VALUES("3332", "软件测试", "SOFT", 4.5, 'M', "18:30:00", "21:15:00");

-- insert takes
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0009", 88.5, 92);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0010", 98, 91);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0113", 100, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0211", 85.5, 91.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0309", 90.5, 92);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0310", 89, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0358", 88, 71);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0372", 94, 92);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0513", 96.5, 97.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0912", 93, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "0917", 97.5, 92.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "1019", 92.5, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "1027", 90, 82);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "2841", 97, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "2879", 96.5, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "2913", 96, 91);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0411412", "3076", 97.5, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0009", 91.5, 96);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0010", 96.5, 93);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0113", 100, 86.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0211", 99.5, 93);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0309", 98.5, 91.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0310", 92.5, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0358", 100, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0372", 92, 76);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0513", 94, 99.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0912", 96, 91);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "0917", 91.5, 91);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "1027", 91, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "2841", 90.5, 84);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "2879", 97, 90.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "3076", 86, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0311423", "3332", 92.5, 95);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0113", 91, 90.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0211", 85, 94);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0309", 96, 91.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0310", 87, 92.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0358", 97.5, 74.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0372", 98, 80);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "0513", 98, 96);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "1012", 95, 98.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "1016", 93, 94);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "1019", 97, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "1027", 95, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "1476", 85.5, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "2177", 90, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "2841", 86.5, 95);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "2879", 86.5, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310524", "2913", 97.5, 83);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0113", 87, 89);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0211", 86, 82);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0309", 89, 87.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0310", 86.5, 89);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0358", 95.5, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0372", 90, 72);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "0917", 87.5, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "1012", 90, 91.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "1016", 93, 96.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "1019", 93, 92);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "1027", 90.5, 85.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "2177", 85, 88.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "2841", 93, 89.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "2913", 90, 83.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0310523", "3076", 89.5, 89.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0113", 86, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0211", 98.5, 95);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0309", 96, 89.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0310", 99.5, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0358", 90.5, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0372", 88, 76);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0513", 99, 98.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "0912", 90.5, 86.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211666", "2841", 98.5, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0113", 92.5, 89.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0211", 99, 98);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0310", 100, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0358", 89.5, 72);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0372", 99, 80);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0912", 96.5, 91.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "0917", 92, 98);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "2841", 95.5, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "2913", 94.5, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211377", "3332", 95.5, Null);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "0113", 91, 88.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "0211", 97, 98);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "0310", 86.5, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "0358", 89.5, 89.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "0372", 86, 72);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "0912", 100, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "1016", 95, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "2879", 87.5, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211258", "3076", 88.5, 82);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "0113", 100, 89);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "0211", 89, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "0309", 96.5, 94);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "0310", 88.5, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "0372", 97, 92);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "0513", 94.5, 100);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "1476", 92, 85.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "2841", 86, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211168", "3076", 91.5, 88.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0009", 92, 94);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0010", 85.5, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0113", 99, 84);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0211", 95.5, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0309", 95, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0310", 88.5, 87.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0358", 98, 83.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0372", 85, 55);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0513", 86, 98.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0912", 93, 94.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "0917", 98, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "2841", 99.5, 94.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0211011", "3332", 96, Null);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "0113", 98, 88.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "0211", 94.5, 92.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "0309", 98, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "0358", 100, 72);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "0372", 96.5, 77);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "1012", 99, 94);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "1016", 99.5, 89);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "1019", 86.5, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "2177", 91.5, 90.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "2841", 93, 90.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210655", "2913", 85, 81);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0113", 85.5, 86.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0211", 85, 60);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0309", 99.5, 86.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0310", 91.5, 85.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0358", 97.5, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0372", 100, 64);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "0513", 93.5, 98.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "1012", 95, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "1027", Null, Null);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "1476", 86, 80);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210553", "2841", 96, 89.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "0113", 93.5, 80);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "0211", 95.5, 95);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "0310", 97, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "0358", 91, 76.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "0372", 85, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "0513", 95.5, 97);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "2177", 95.5, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "2841", 97, 86.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210535", "2879", 88, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "0113", 92.5, 83.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "0211", 98, 95);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "0309", 88, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "0310", 94, 85.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "0372", 94, 73);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "2177", 94, 78.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "2841", 85.5, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210120", "3076", 87.5, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "0113", 91, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "0211", 89.5, 81);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "0310", 88, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "0358", 87.5, 58);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "0372", 88, 76.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "0513", 89.5, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "1012", 93.5, 99.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "1016", 88.5, 97);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "2177", 87.5, 86);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "2841", 95.5, 95);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0210119", "2879", 88, 87.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111917", "0113", 85, 85);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111917", "0372", 93, 72);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111917", "0513", 91.5, 98);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111917", "1476", 96.5, 81.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111917", "2177", 91.5, 76);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111917", "2913", 97.5, 91);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111168", "0113", 100, 81.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111168", "0372", 91, 92);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111168", "0513", 90.5, 97.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111123", "0113", 86, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111123", "0310", 85.5, 94);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111123", "0372", 100, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111123", "1016", 100, Null);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111123", "2913", 88, 89);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111100", "0113", 85, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111100", "0372", 93, 77);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111100", "1476", 98, 83);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111100", "2879", 90, 91.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111100", "3332", 88, 90);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111010", "0113", 91, 80);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111010", "0310", 89, 90.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111010", "0372", 87.5, 64);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111010", "0917", Null, Null);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0111010", "2841", 91.5, 95.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110514", "0113", 100, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110514", "0310", 96.5, 87);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110514", "0372", 98.5, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110514", "0513", 87.5, 99);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110514", "1016", 98.5, Null);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110514", "2177", 97.5, 75.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110233", "0113", 96.5, 80.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110233", "0310", 100, 91);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110233", "0372", 92, 73);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110114", "0113", 98.5, 85.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110114", "0372", 89, 76.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110114", "2177", 91.5, 83.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110114", "2913", 92.5, 93.5);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110058", "0113", 90.5, 83);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110058", "0310", 86, 88);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110058", "0513", 95, 98);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110058", "2177", 90, 84);
INSERT INTO takes(stu_id, cor_id, mid_score, fin_score) VALUES("0110058", "3076", 90.5, 87);
