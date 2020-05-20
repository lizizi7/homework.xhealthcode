# Web应用开发系列文档

## 目录

[首页](./index.md)
[模型设计](./models.md)
[请求模型](./requestmodel.md)
[仓储](./repository.md)
[插件](./addin.md)

## 模型设计

### 用户组(Group-User)

#### 用户表(User)

@用户表用于声明用户及登录的必备属性。


| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| UserId | long | Primary |  | 用户ID |
| Uid | varchar(120) | Unique |  | 用户唯一识别号 |
| UserType | int | | @Enum | 用户类型 |
| Password | varchar(120) | | @Encrypt | 密码 |

@Enum('UserType'):0:教师;1:学生

#### 用户登陆表(UserAccess)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| UserAccessId | long | Primary | | |
| @UserId | long | Foreign | | 用户ID |
| Token | varchar(120) |  | | 登录凭证 |
| Expired | boolean | | | 是否过期 |
| Expired | timestamp | | | 过期时间 |

#### 教师信息表(Teacher)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| TeacherId | long | Primary | | |
| @UserId | long | Foreign | | |
| Name | varchar(60) | | | 姓名 |
| IdCard | varchar(60) | | | 身份证号 |
| Number | varchar(60) | | | 工号 |
| @CollegeId | long \| null  | | | 学院ID |
| Role | int | | @Enum | 角色 |

@Enum('Role'):0:普通教师,1:院级管理员,2:校级管理员,3:系统管理员

#### 学生信息表(Student)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| StudentId | long | Primary | | |
| @UserId | long | Foreign | | |
| Name | varchar(60) | | | 姓名 |
| IdCard | varchar(60) | | | 身份证号 |
| Number | varchar(60) | | | 学号 |
| @XClassId | long \| null | Foreign |  | 班级Id |

### 组织组(Organization-Group)

#### 学院(Colleage)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| CollegeId | long | Primary | | |
| Name | varchar(60) | | | 学院名 |

#### 专业(Profession)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| ProfessionId | long | Primary | | |
| @ColleageId | long | Foreign | | 学院Id |
| Name | varchar(60) | | | 专业名 |

#### 班级(XClass)

| 列名 | 属性 | 键 | 约束 | 备注 | 
| --- | --- | --- | --- | --- |
| XClassId | long | Primary | | |
| @ProfessionId | long | Foregin | | 专业Id |
| Name | varchar(60) | | | 专业名 |

### 信息组(Info-Group)

需要@ProblemResolver和@AnswerResolver来分析问题和答案。

#### 申领问题架构(ProblemSchema)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| SchemaId | long | Primary | | |
| Problem | text | | | 需要回答的问题 |
| ProblemType | int | | @Enum | 问题的类别 |
| RegionMeta | text | | | 问题的值域? | 
| ValidMeta | text | | | 验证器 |  

@Enum('ProblemType'):0:判断,1:天空（按照一切偷懒的原则，暂时只支持判断，多选，填空三种类型。）
@判断预设的验证类型:false.yellow,false.red,true.yellow,true.red

#### 用户信息(Info)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| InfoId | long | Primary | | |
| @UserId | long | Foreign | | | 
| Phone | varchar(20) | | | 手机号码 |

#### 每日打卡(DailyCard)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| DailyCardId | long | Primary | | |
| @UserId | long | Foreign | | 用户Id |
| Answer | text | | | 回答问题的结果 |
| Result | int | | @Enum | 申领的结果 |
| Date | time-stamp | | | 申领日期 |

@Enum('Result'):0:绿码,1:黄码,2:红码。

#### 结果缓存(ResultCache)

| 列名 | 属性 | 键 | 约束 | 备注 |
| --- | --- | --- | --- | --- |
| ResultCacheId | long | Primary | | | 
| @UserId | long | long | Foreign | | |
| Result | int | | @Enum | 结果 |
| CodeKey | long | | | 验证健康码的key |
| Date | time-stamp | | | 缓存的日期 | 