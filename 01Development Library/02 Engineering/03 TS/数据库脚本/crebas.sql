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

alter table course comment '�γ�';

/*==============================================================*/
/* Table: course_content                                        */
/*==============================================================*/
create table course_content
(
   course_id            int not null,
   cw_id                int not null,
   primary key (course_id, cw_id)
);

alter table course_content comment '�γ�����';

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

alter table courseware comment '�μ�';

/*==============================================================*/
/* Table: ctypef                                                */
/*==============================================================*/
create table ctypef
(
   typef_id             int not null,
   typef_name           varchar(25),
   primary key (typef_id)
);

alter table ctypef comment '�γ̴���';

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

alter table ctypes comment '�γ�С��';

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

alter table direction comment '��ѧ����';

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

alter table knowledge comment '֪ʶ';

/*==============================================================*/
/* Table: opencourse                                            */
/*==============================================================*/
create table opencourse
(
   course_id            int not null,
   visible              char(2),
   primary key (course_id)
);

alter table opencourse comment '������';

/*==============================================================*/
/* Table: org_info                                              */
/*==============================================================*/
create table org_info
(
   org_id               int not null,
   org_name             varchar(200),
   primary key (org_id)
);

alter table org_info comment '������Ϣ';

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

alter table permission comment 'Ȩ��';

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

alter table plan comment '�ƻ�';

/*==============================================================*/
/* Table: plan_course                                           */
/*==============================================================*/
create table plan_course
(
   plan_id              int not null,
   course_id            int not null,
   primary key (plan_id, course_id)
);

alter table plan_course comment '�ƻ��Ŀγ�';

/*==============================================================*/
/* Table: plan_teacher                                          */
/*==============================================================*/
create table plan_teacher
(
   plan_id              int not null,
   t_id                 int not null,
   primary key (plan_id, t_id)
);

alter table plan_teacher comment '�ƻ��Ľ�ʦ';

/*==============================================================*/
/* Table: plan_user                                             */
/*==============================================================*/
create table plan_user
(
   plan_id              int not null,
   id                   varchar(15) not null,
   primary key (plan_id, id)
);

alter table plan_user comment '�ƻ��ĳ�Ա';

/*==============================================================*/
/* Table: ptypef                                                */
/*==============================================================*/
create table ptypef
(
   typef_id             int not null,
   typef_name           varchar(25),
   primary key (typef_id)
);

alter table ptypef comment '�ƻ�����';

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

alter table ptypes comment '�ƻ�С��';

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

alter table question comment '����';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   role_id              int not null,
   role_name            varchar(25) not null,
   primary key (role_id)
);

alter table role comment '��ɫ';

/*==============================================================*/
/* Table: role_perm                                             */
/*==============================================================*/
create table role_perm
(
   role_id              int not null,
   perm_id              int not null,
   primary key (role_id, perm_id)
);

alter table role_perm comment '��ɫ���е�Ȩ��';

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

alter table teacher comment '��ʦ';

/*==============================================================*/
/* Table: truekonw                                              */
/*==============================================================*/
create table truekonw
(
   konw_id              int not null,
   visible              char(2),
   primary key (konw_id)
);

alter table truekonw comment 'Ȩ��֪ʶ';

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   role_id              int not null,
   id                   varchar(15) not null,
   primary key (role_id, id)
);

alter table user_role comment '�û��Ľ�ɫ';

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

alter table users comment '�û�';

alter table course add constraint FK_�����γ� foreign key (author_id)
      references users (id) on update cascade;

alter table course add constraint FK_�γ̵ķ��� foreign key (type_id)
      references ctypes (types_id) on delete set null on update cascade;

alter table course_content add constraint FK_course_content foreign key (course_id)
      references course (course_id) on delete cascade on update cascade;

alter table course_content add constraint FK_course_content2 foreign key (cw_id)
      references courseware (cw_id) on delete cascade on update cascade;

alter table courseware add constraint FK_�����μ� foreign key (author_id)
      references users (id) on delete set null on update cascade;

alter table ctypes add constraint FK_���������С�� foreign key (typef_id)
      references ctypef (typef_id) on delete cascade on update cascade;

alter table knowledge add constraint FK_֪ʶ������ foreign key (id)
      references users (id) on delete set null on update cascade;

alter table opencourse add constraint FK_���������� foreign key (course_id)
      references course (course_id) on delete cascade on update cascade;

alter table plan add constraint FK_�ƻ����� foreign key (author_id)
      references users (id) on delete restrict on update restrict;

alter table plan add constraint FK_�ƻ������� foreign key (type_id)
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

alter table ptypes add constraint FK_�ƻ����������С�� foreign key (typef_id)
      references ptypef (typef_id) on delete cascade on update cascade;

alter table question add constraint FK_���ⷢ���� foreign key (id)
      references users (id) on delete set null on update cascade;

alter table role_perm add constraint FK_rolehasperm foreign key (role_id)
      references role (role_id) on delete cascade on update cascade;

alter table role_perm add constraint FK_rolehasperm2 foreign key (perm_id)
      references permission (perm_id) on delete cascade on update cascade;

alter table teacher add constraint FK_��ѧ���� foreign key (direct_id)
      references direction (direct_id) on delete set null on update cascade;

alter table teacher add constraint FK_��ʦ�˺� foreign key (user_id)
      references users (id) on delete cascade on update cascade;

alter table truekonw add constraint FK_Ȩ��֪ʶת�� foreign key (konw_id)
      references knowledge (konw_id) on delete cascade on update cascade;

alter table user_role add constraint FK_user_role foreign key (role_id)
      references role (role_id) on delete restrict on update cascade;

alter table user_role add constraint FK_user_role2 foreign key (id)
      references users (id) on delete cascade on update cascade;

alter table users add constraint FK_user_org foreign key (org_id)
      references org_info (org_id) on delete set null on update cascade;

