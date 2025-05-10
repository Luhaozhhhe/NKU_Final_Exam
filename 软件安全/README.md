# 软件安全

- **授课时间：** 2024Spring
- **授课教师：** 刘哲理

不知道为什么之前的评论被吞了，就再来补充一下。

## 总体评价

一门很好的漏洞分析和利用的课程，可惜讲的太浅了。建议和暑期的实习实训360配合食用，效果更佳。课程上到后面就变成了一门背诵课程，也没啥好说的，是一门期末三天也能速通的课程。

## 得分情况

该课程的分数占比：

- **期末 55%**
  - 选择题（30分）
  - 判断题（20分）
  - 简单题（34分）
  - 综合题（16分）
- **平时 45%**
  - 论文阅读汇报，5人一组，占5%的分。
  - 实验报告，占25%的分。
  - 雨课堂答题，占10%的分。正确率算一定的分！！！
  - 雨课堂签到，占5%的分。

由于该课程基本上也是背诵+理解，比汇编的难度下来了不少，所以得分都不是很低，实际上想获得4.0的话，认真背一背还是没啥问题的。考试内容侧重平时的雨课堂习题和实验部分的内容。45分平时分的话，基本上论文汇报都不会太严，不怎么扣分，除非你上去就开摆。实验报告的话也就是复现型的实验，不知道今年会不会换。如果认真做，页数正常的话分数也不会低的。雨课堂的话记得找一找往年的答案，确定答案之后再进行答题，不然平时分会受到一些影响。签到就不用多说了，去年我们是早八的软安上课，最后考试也是早八考的，比较折磨。

## 学习策略

对于实验，需要好好掌握。不仅仅是为了应付考试，这门课的实验实际上难度适中，且已经给出了标准答案，在做的时候可以先自己尝试，然后实在不会了再查看答案。对于论文研读，一般是五人一组，但是实际上工作量不大，一个人也能完成，最后的答辩也不严。

对于期末考试，在选择题和判断题，需要熟练掌握PPT上出现过的一些细节内容，但是实际上考察的侧重点都是PPT中标红的或者画粗的内容。对于大题部分，实际上大范围涉及到了实验的内容，所以在平时完成实验的时候，需要适当的记录一下实验中需要注意的地方，以及一些重要的源代码。考试中可能会出现原封不动的代码，也有可能是考察你的理解，但是绝大部分还是知识点默写+代码片段理解，所以总体难度不是很大，比汇编容易多了。

对于课程的笔记，我都开源放到了云盘上了。还有一些同学不知道云盘的链接，实际上在我的github上主页就有。若有需要可以自取。

## 平时作业

没有纸质作业。雨课堂的题目都是课堂上完成的，如果没有记错的话。剩下的就是实验部分的作业了。

2024Spring主要有以下的实验：

- Lab1 IDE反汇编实验
- Lab2 OLLYDBG软件破解
- Lab3 堆溢出Dword Shoot攻击实验
- Lab4 格式化字符串漏洞
- Lab5 Shellcode编写及编码
- Lab6 API函数自搜索
- Lab7 AFL模糊测试
- Lab8 程序插桩及Hook实验
- Lab9 Angr应用实例
- Lab10 WEB开发实践
- Lab11 跨站脚本攻击
- Lab12 SQL盲注
- Lab13 复现反序列化漏洞

## 考试内容

由于评论区被清了，我把往年的题目都往上放一些。

### 2021-2022学年

详见https://github.com/Luhaozhhhe/NKU_Final_Exam/tree/main/%E8%BD%AF%E4%BB%B6%E5%AE%89%E5%85%A8

### 2022-2023学年

- 简答题
  - dwordshoot
  - 污点分析
  - sql盲注
  - 返回导向编程
  - pintool解释代码+插桩模式
  - php漏洞文件上传+文件包含
- 综合题
  - shellcode补全代码
  - 符号执行angr代码解释

### 2023-2024学年

#### 选择题

1.5分一个，20个——主要考察雨课堂课后题和ppt上的一些加粗字体的内容

#### 判断题

1分一个，20个——主要考察雨课堂课后题和ppt上的一些加粗字体的内容

#### 简答题

**1.有关于栈溢出**

```c++
void why_here(void)
{    printf("why u r here?!\n"); 
      exit(0); 
}
void f()
{     int buff; int * p = &buff; 
       ________= (int)why_here;
} 
int main(int argc, char * argv[])
{      f();
        return 0;
}
```

问你怎么写代码，然后让你画出对应的栈示意图，但是稍微做了改动

**2.两种破解方法**

```c++
#include <iostream>
using namespace std;
#define password "12345678"
bool verifyPwd(char * pwd)
{
	int flag;
	flag=strcmp(password, pwd);
	return flag==0;
}
void main()
{
	bool bFlag;
	char pwd[1024];
	printf("please input your password:\n");
	while (1)
	{
		scanf("%s",pwd);
		bFlag=verifyPwd(pwd);
		if (bFlag)
		{
			printf("passed\n");
			break;
		}else{
			printf("wrong password, please input again:\n");
		}
	}
}
```

**3.写出符号执行的三步骤；写出静态和动态分别的优缺点**

**4.写出pintool的原理，和对应插桩的四种类型**

**5.写出两种模式下的栈帧形态**

```c++
#include <stdio.h>
int main(int argc, char *argv[])
{
    char str[200];
    fgets(str,200,stdin);
    printf(str);
    return 0;
}
```

**6.阅读以下代码：**

```html
<h1 align=center>--Welcome To The Simple XSS Test--</h1>
<?php
ini_set("display_errors", 0);
$str =strtolower( $_GET["keyword"]);
$str2=str_replace("script","",$str);
$str3=str_replace("on","",$str2);
$str4=str_replace("src","",$str3);
echo "<h2 align=center>Hello ".htmlspecialchars($str).".</h2>".'<center>
<form action=xss_test.php method=GET>
<input type=submit name=submit value=Submit />
<input name=keyword  value="'.$str4.'">
</form>
</center>';
?>
</body>
</html>
```

此代码有什么漏洞？

分析对应的两种漏洞的利用方法：img和script

**7.C++虚表指针，虚表，内存空间的关系？写出虚函数攻击的对应方法？**

#### 综合题

**1.shellcode的编码**

- 为什么要编码？

- 说出一种编码类型

- 然后分析代码，填写代码


```c++
int main(){
   __asm  {
     call lable; 
     lable: pop eax; 
        add eax, 0x15            ;越过decoder记录shellcode起始地址
        xor ecx, ecx
    decode_loop:
        mov bl, [eax + ecx]
        xor bl, 0x44             ;用0x44作为key
        mov [eax + ecx], bl
        inc ecx
        cmp bl, 0x90             ;末尾放一个0x90作为结束符
        jne decode_loop 
    } 
	return 0;
}
```

需要填写

- call lable
- jne decode_loop 

**2.ROP返回导向编程**

ROP基本思想？

```asm
ESP -> ???????? => POP EAX # RETN
            ffffffff => we put this value in EAX
            ???????? => INC EAX # RETN
            ???????? => XCHG EAX,EDX # RETN
```

分析EDX的值

然后是一个实践题，让你将EAX的值变为7，写ROP代码进行地址的调用
