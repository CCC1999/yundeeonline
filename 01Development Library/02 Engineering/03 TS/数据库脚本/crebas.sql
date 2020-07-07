/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/7 15:00:32                            */
/*==============================================================*/


drop table if exists course;

drop table if exists course_content;

drop table if exists courseware;

drop table if exists ctypef;

drop table if exists ctypes;

drop table if exists direction;

drop table if exists knowledge;

drop table if exists opencourse;

drop table if exists org_info;

drop table if exists permission;

drop table if exists plan;

drop table if exists plan_course;

drop table if exists plan_teacher;

drop table if exists plan_user;

drop table if exists ptypef;

drop table if exists ptypes;

drop table if exists question;

drop table if exists role;

drop table if exists role_perm;

drop table if exists teacher;

drop table if exists truekonw;

drop table if exists user_role;

drop table if exists users;

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course
(
   course_id            int not null,
   course_name          varchar(50),
   type_id              int,
   credit               int,
   hour                 int,
   state                char(2) not null,
   update_time          date,
   author               varchar(25),
   author_id            varchar(15) not null,
   info                 text,
   primary key (course_id)
);

alter table course comment '课程';

/*==============================================================*/
/* Table: course_content                                        */
/*==============================================================*/
create table course_content
(
   course_id            int not null,
   cw_id                int not null,
   primary key (course_id, cw_id)
);

alter table course_content comment '课程内容';

/*==============================================================*/
/* Table: courseware                                            */
/*==============================================================*/
create table courseware
(
   cw_id                int not null,
   cw_name              varchar(100),
   visible              char(2) not null,
   type_id              bigint,
   total_time           int,
   author               varchar(25),
   author_id            varchar(15) not null,
   path                 varchar(100),
   primary key (cw_id)
);

alter table courseware comment '课件';

/*==============================================================*/
/* Table: ctypef                                                */
/*==============================================================*/
create table ctypef
(
   typef_id             int not null,
   typef_name           varchar(25),
   primary key (typef_id)
);

alter table ctypef comment '课程大类';

/*==============================================================*/
/* Table: ctypes                                                */
/*==============================================================*/
create table ctypes
(
   types_id             int not null,
   typef_id             int not null,
   types_name           varchar(25),
   primary key (types_id)
);

alter table ctypes comment '课程小类';

/*==============================================================*/
/* Table: direction                                             */
/*==============================================================*/
create table direction
(
   direct_id            int not null,
   direct_name          varchar(25),
   direct_descrip       varchar(100),
   primary key (direct_id)
);

alter table direction comment '教学方向';

/*==============================================================*/
/* Table: knowledge                                             */
/*==============================================================*/
create table knowledge
(
   konw_id              int not null,
   id                   varchar(15) not null,
   title                varchar(100),
   visible              char(2),
   state                char(2),
   note                 text,
   create_time          date,
   pv                   bigint,
   primary key (konw_id)
);

alter table knowledge comment '知识';

/*==============================================================*/
/* Table: opencourse                                            */
/*==============================================================*/
create table opencourse
(
   course_id            int not null,
   visible              char(2),
   primary key (course_id)
);

alter table opencourse comment '公开课';

/*==============================================================*/
/* Table: org_info                                              */
/*==============================================================*/
create table org_info
(
   org_id               int not null,
   org_name             varchar(200),
   primary key (org_id)
);

alter table org_info comment '机构信息';

/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table permission
(
   perm_id              int not null,
   perm_name            varchar(25) not null,
   note                 text,
   primary key (perm_id)
);

alter table permission comment '权限';

/*==============================================================*/
/* Table: plan                                                  */
/*==============================================================*/
create table plan
(
   plan_id              int not null,
   plan_name            varchar(25),
   keyword              varchar(25),
   type_id              int,
   note                 varchar(100),
   isopen               char(2),
   state                char(2),
   s_date               date,
   e_date               date,
   info                 text,
   author_id            varchar(15),
   primary key (plan_id)
);

alter table plan comment '计划';

/*==============================================================*/
/* Table: plan_course                                           */
/*==============================================================*/
create table plan_course
(
   plan_id              int not null,
   course_id            int not null,
   primary key (plan_id, course_id)
);

alter table plan_course comment '计划的课程';

/*==============================================================*/
/* Table: plan_teacher                                          */
/*==============================================================*/
create table plan_teacher
(
   plan_id              int not null,
   t_id                 int not null,
   primary key (plan_id, t_id)
);

alter table plan_teacher comment '计划的教师';

/*==============================================================*/
/* Table: plan_user                                             */
/*==============================================================*/
create table plan_user
(
   plan_id              int not null,
   id                   varchar(15) not null,
   primary key (plan_id, id)
);

alter table plan_user comment '计划的成员';

/*==============================================================*/
/* Table: ptypef                                                */
/*==============================================================*/
create table ptypef
(
   typef_id             int not null,
   typef_name           varchar(25),
   primary key (typef_id)
);

alter table ptypef comment '计划大类';

/*==============================================================*/
/* Table: ptypes                                                */
/*==============================================================*/
create table ptypes
(
   types_id             int not null,
   typef_id             int not null,
   types_name           varchar(25),
   primary key (types_id)
);

alter table ptypes comment '计划小类';

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question
(
   ques_id              int not null,
   id                   varchar(15) not null,
   title                varchar(100),
   create_time          date,
   visible              char(2),
   note                 text,
   primary key (ques_id)
);

alter table question comment '问题';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   role_id              int not null,
   role_name            varchar(25) not null,
   primary key (role_id)
);

alter table role comment '角色';

/*==============================================================*/
/* Table: role_perm                                             */
/*==============================================================*/
create table role_perm
(
   role_id              int not null,
   perm_id              int not null,
   primary key (role_id, perm_id)
);

alter table role_perm comment '角色具有的权限';

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher
(
   t_id                 int not null,
   t_name               varchar(25),
   user_id              varchar(15) not null,
   direct_id            int not null,
   t_type               varchar(4),
   post                 varchar(25),
   title                varchar(25),
   qualification        varchar(25),
   nation               varchar(25),
   country              varchar(25),
   length               int,
   level                int,
   note                 varchar(100),
   primary key (t_id)
);

alter table teacher comment '教师';

/*==============================================================*/
/* Table: truekonw                                              */
/*==============================================================*/
create table truekonw
(
   konw_id              int not null,
   visible              char(2),
   primary key (konw_id)
);

alter table truekonw comment '权威知识';

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   role_id              int not null,
   id                   varchar(15) not null,
   primary key (role_id, id)
);

alter table user_role comment '用户的角色';

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   id                   varchar(15) not null,
   org_id               int not null,
   name                 varchar(25),
   password             varchar(64) not null,
   phone                varchar(15) not null,
   email                varchar(60),
   state                char(1),
   sex                  char(4),
   birth                date,
   primary key (id)
);

alter table users comment '用户';

alter table course add constraint FK_创建课程 foreign key (author_id)
      references users (id) on update cascade;

alter table course add constraint FK_课程的分类 foreign key (type_id)
      references ctypes (types_id) on delete set null on update cascade;

alter table course_content add constraint FK_course_content foreign key (course_id)
      references course (course_id) on delete cascade on update cascade;

alter table course_content add constraint FK_course_content2 foreign key (cw_id)
      references courseware (cw_id) on delete cascade on update cascade;

alter table courseware add constraint FK_创建课件 foreign key (author_id)
      references users (id) on delete set null on update cascade;

alter table ctypes add constraint FK_大类包含的小类 foreign key (typef_id)
      references ctypef (typef_id) on delete cascade on update cascade;

alter table knowledge add constraint FK_知识发布人 foreign key (id)
      references users (id) on delete set null on update cascade;

alter table opencourse add constraint FK_发布公开课 foreign key (course_id)
      references course (course_id) on delete cascade on update cascade;

alter table plan add constraint FK_计划作者 foreign key (author_id)
      references users (id) on delete restrict on update restrict;

alter table plan add constraint FK_计划的类型 foreign key (type_id)
      references ptypes (types_id) on delete set null on update cascade;

alter table plan_course add constraint FK_plan_course foreign key (plan_id)
      references plan (plan_id) on delete cascade on update cascade;

alter table plan_course add constraint FK_plan_course2 foreign key (course_id)
      references course (course_id) on delete cascade on update cascade;

alter table plan_teacher add constraint FK_plan_teacher foreign key (plan_id)
      references plan (plan_id) on delete cascade on update cascade;

alter table plan_teacher add constraint FK_plan_teacher2 foreign key (t_id)
      references teacher (t_id) on delete cascade on update cascade;

alter table plan_user add constraint FK_plan_user foreign key (plan_id)
      references plan (plan_id) on delete cascade on update cascade;

alter table plan_user add constraint FK_plan_user2 foreign key (id)
      references users (id) on delete cascade on update cascade;

alter table ptypes add constraint FK_计划大类包含的小类 foreign key (typef_id)
      references ptypef (typef_id) on delete cascade on update cascade;

alter table question add constraint FK_问题发布人 foreign key (id)
      references users (id) on delete set null on update cascade;

alter table role_perm add constraint FK_rolehasperm foreign key (role_id)
      references role (role_id) on delete cascade on update cascade;

alter table role_perm add constraint FK_rolehasperm2 foreign key (perm_id)
      references permission (perm_id) on delete cascade on update cascade;

alter table teacher add constraint FK_教学方向 foreign key (direct_id)
      references direction (direct_id) on delete set null on update cascade;

alter table teacher add constraint FK_教师账号 foreign key (user_id)
      references users (id) on delete cascade on update cascade;

alter table truekonw add constraint FK_权威知识转化 foreign key (konw_id)
      references knowledge (konw_id) on delete cascade on update cascade;

alter table user_role add constraint FK_user_role foreign key (role_id)
      references role (role_id) on delete restrict on update cascade;

alter table user_role add constraint FK_user_role2 foreign key (id)
      references users (id) on delete cascade on update cascade;

alter table users add constraint FK_user_org foreign key (org_id)
      references org_info (org_id) on delete set null on update cascade;

