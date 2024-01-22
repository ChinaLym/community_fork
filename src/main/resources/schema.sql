create table if not exists ad
(
    id           int auto_increment
        primary key,
    title        varchar(256) null,
    url          varchar(512) null,
    image        varchar(256) null,
    gmt_start    bigint       null,
    gmt_end      bigint       null,
    gmt_create   bigint       null,
    gmt_modified bigint       null,
    status       int          null,
    pos          varchar(10)  not null
);

create table if not exists comment
(
    id            bigint auto_increment
        primary key,
    parent_id     bigint           not null,
    type          int              not null,
    commentator   bigint           not null,
    gmt_create    bigint           not null,
    gmt_modified  bigint           not null,
    like_count    bigint default 0 null,
    content       varchar(1024)    null,
    comment_count int    default 0 null
);

create table if not exists nav
(
    id           int auto_increment
        primary key,
    title        varchar(100)  null,
    url          varchar(256)  null,
    priority     int default 0 null,
    gmt_create   bigint        null,
    gmt_modified bigint        null,
    status       int           null
);

create table if not exists notification
(
    id            bigint auto_increment
        primary key,
    notifier      bigint        not null,
    receiver      bigint        not null,
    outerid       bigint        not null,
    type          int           not null,
    gmt_create    bigint        not null,
    status        int default 0 not null,
    notifier_name varchar(100)  null,
    outer_title   varchar(256)  null
);

create table if not exists question
(
    id            bigint auto_increment
        primary key,
    title         varchar(50)   null,
    description   text          null,
    gmt_create    bigint        null,
    gmt_modified  bigint        null,
    creator       bigint        not null,
    comment_count int default 0 null,
    view_count    int default 0 null,
    like_count    int default 0 null,
    tag           varchar(256)  null,
    sticky        int default 0 null
);

create table if not exists user
(
    id           bigint auto_increment
        primary key,
    account_id   varchar(100)                 null,
    name         varchar(50)                  null,
    token        varchar(36)                  null,
    gmt_create   bigint                       null,
    gmt_modified bigint                       null,
    bio          varchar(256)                 null,
    avatar_url   varchar(256)                 null,
    type         varchar(10) default 'github' null,
    disable      int         default 0        null
);

