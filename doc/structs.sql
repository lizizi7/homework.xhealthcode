create table adminuser
(
    adminUserId bigint auto_increment
        primary key,
    teacherId   bigint        not null,
    password    varchar(120)  not null,
    role        int default 0 not null comment '角色 0:院级管理员,1:校级管理员,2:系统管理员'
)
    charset = utf8;

create table college
(
    collegeId bigint auto_increment
        primary key,
    name      varchar(60) not null
)
    charset = utf8;

create table dailycard
(
    dailyCardId bigint auto_increment
        primary key,
    userId      bigint        not null,
    answer      text          null,
    result      int default 0 not null,
    date        date          not null
)
    charset = utf8;

create table info
(
    infoId              bigint auto_increment
        primary key,
    userId              bigint      not null,
    phone               varchar(20) null,
    result              int         null,
    date                date        null,
    continuousClockDays int         null,
    constraint UserId
        unique (userId)
)
    charset = utf8;

create table profession
(
    professionId bigint auto_increment
        primary key,
    collegeId    bigint      not null,
    name         varchar(60) not null
)
    charset = utf8;

create table resultcache
(
    resultCacheId bigint auto_increment
        primary key,
    userId        bigint                              not null,
    result        int       default 0                 not null,
    codeKey       varchar(120)                        not null,
    date          date                                not null,
    expiredAt     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
)
    charset = utf8;

create table student
(
    studentId bigint auto_increment
        primary key,
    userId    bigint      not null,
    name      varchar(60) not null,
    idCard    varchar(60) not null,
    number    varchar(60) not null,
    xClassId  bigint      null,
    constraint UserId
        unique (userId)
)
    charset = utf8;

create table teacher
(
    teacherId bigint auto_increment
        primary key,
    userId    bigint      not null,
    name      varchar(60) not null,
    idCard    varchar(60) null,
    number    varchar(60) not null comment '工号',
    collegeId bigint      null,
    constraint UserId
        unique (userId)
)
    charset = utf8;

create table user
(
    userId   bigint auto_increment
        primary key,
    userType int default 0 not null comment '用户类型 0=学生;1=老师'
)
    charset = utf8;

create table useraccess
(
    userAccessId bigint auto_increment
        primary key,
    userId       bigint       not null,
    token        varchar(120) not null,
    expired      timestamp    null
)
    charset = utf8;

create table xclass
(
    xclassId     bigint auto_increment
        primary key,
    professionId bigint      not null,
    name         varchar(60) not null
)
    charset = utf8;


