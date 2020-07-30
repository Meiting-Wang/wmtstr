# Stata 新命令：wmtstr——对字符串进行唯一化、升序、降序处理

> 作者：王美庭  
> Email: wangmeiting92@gmail.com


## 更新记录

- 2020年7月30日：增加了不允许所输入字符串中包含单引号或双引号的提示


## 目录

- **一、引言**
- **二、命令的安装**
- **三、语法与选项**
- **四、实例**
- **五、命令运行展示**


## 一、引言

个人最近写程序的时候需要去掉字符串中重复的单词，找了一下好像没有这样的命令，于是自己写了一下。同时也扩展了一下功能，增加了排序功能。除此之外，命令运行后的结果会被储存在`r()`中，可用作后续编程使用。


## 二、命令的安装

`wmtstr`命令以及本人其他命令的代码都托管于 GitHub 上，以使读者可随时下载安装这些命令。

你可以通过系统自带的`net`命令进行安装：

```stata
net install wmtstr, from("https://raw.githubusercontent.com/Meiting-Wang/wmtstr/master")
```

也可以通过`github`外部命令进行安装（`github`命令本身可以通过`net install github, from("https://haghish.github.io/github/")`进行安装）：

```stata
github install Meiting-Wang/wmtstr
```


## 三、语法与选项

**命令语法**：

```stata
wmtstr strings [, options]
```

> - `strings`: 输入字符串，如`price mpg weight price`或`12 45 78 457 1 5 5 12`等

**选项（options）**：

- `unique`: 保留字符串中第一次出现的单词或数值
- `ascending`: 对单词首字符进行 ASCII 码值升序排列，当首字符一样时，将对单词第二个字符做类似操作，以此类推。
- `descending`: 操作与`ascending`选项类似，只不过是进行降序排列
- `digital`: 当输入的字符串全为数值时可以使用该选项。使用该选项后可以对数值本身进行操作，如此时的`ascending`选项将对数值本身大小进行升序排列。

> - 以上选项均可以缩写，详情可以在安装完命令后`help wmtstr`
> - 字符的 ASCII 码值可以使用`asciiplot`命令查看，该命令可以使用`ssc install asciiplot`安装。


## 四、实例

- **对字符串的处理**

```stata
wmtstr price mpg weight mpg price trunk //默认进行唯一化处理
wmtstr price mpg weight mpg price trunk, u //进行唯一化处理
wmtstr price mpg weight mpg price trunk, a //进行升序处理（ASCII）
wmtstr price mpg weight mpg price trunk, d //进行降序处理（ASCII）
wmtstr price mpg weight mpg price trunk, u a //进行唯一化、升序处理（ASCII）
return list //展示储存在r()里的值
```

- **对数字串的处理**

```stata
wmtstr 1 5 3 89 45 3 45 66 89 4 //默认进行唯一化处理
wmtstr 1 5 3 89 45 3 45 66 89 4, u //进行唯一化处理
wmtstr 1 5 3 89 45 3 45 66 89 4, a //进行升序处理（ASCII）
wmtstr 1 5 3 89 45 3 45 66 89 4, a di //进行升序处理（数值本身大小）
wmtstr 1 5 3 89 45 3 45 66 89 4, u a di //进行唯一化、升序处理（数值本身大小）
return list //展示储存在r()里的值
```

> 以上所有实例都可以在`wmtstr`帮助文件中直接运行。  
> ![](https://imgkr.cn-bj.ufileos.com/33dd25d1-8965-4fb9-89c7-d9abb1e5a9aa.png)


## 五、命令运行展示

```stata
. *---------------------------对字符串的处理-----------------------------------
. wmtstr price mpg weight mpg price trunk //默认进行唯一化处理
Processing method: unique
price mpg weight trunk

. wmtstr price mpg weight mpg price trunk, u //进行唯一化处理
Processing method: unique
price mpg weight trunk

. wmtstr price mpg weight mpg price trunk, a //进行升序处理（ASCII）
Processing method: ascending
mpg mpg price price trunk weight

. wmtstr price mpg weight mpg price trunk, d //进行降序处理（ASCII）
Processing method: descending
weight trunk price price mpg mpg

. wmtstr price mpg weight mpg price trunk, u a //进行唯一化、升序处理（ASCII）
Processing method: unique & ascending
mpg price trunk weight

. return list //展示储存在r()里的值

macros:
             r(wmtstr) : "mpg price trunk weight"
  r(processing_method) : "unique & ascending"

.
. *------------------------对数字串的处理-------------------------------------
. wmtstr 1 5 3 89 45 3 45 66 89 4 //默认进行唯一化处理
Processing method: unique
1 5 3 89 45 66 4

. wmtstr 1 5 3 89 45 3 45 66 89 4, u //进行唯一化处理
Processing method: unique
1 5 3 89 45 66 4

. wmtstr 1 5 3 89 45 3 45 66 89 4, a //进行升序处理（ASCII）
Processing method: ascending
1 3 3 4 45 45 5 66 89 89

. wmtstr 1 5 3 89 45 3 45 66 89 4, a di //进行升序处理（数值本身大小）
Processing method: ascending & digital
1 3 3 4 5 45 45 66 89 89

. wmtstr 1 5 3 89 45 3 45 66 89 4, u a di //进行唯一化、升序处理（数值本身大小）
Processing method: unique & ascending & digital
1 3 4 5 45 66 89

. return list //展示储存在r()里的值

macros:
             r(wmtstr) : "1 3 4 5 45 66 89"
  r(processing_method) : "unique & ascending & digital"
```
