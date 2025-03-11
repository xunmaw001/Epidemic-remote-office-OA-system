DROP DATABASE IF EXISTS jspNltCJ;

CREATE DATABASE jspNltCJ default character set utf8mb4 collate utf8mb4_general_ci;

USE jspNltCJ;

DROP TABLE IF EXISTS `yuangongxinxi`;

CREATE TABLE `yuangongxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yuangonggonghao` varchar(200)  UNIQUE   COMMENT '员工工号',
	`yuangongxingming` varchar(200)    COMMENT '员工姓名',
	`mima` varchar(200)    COMMENT '密码',
	`xingbie` varchar(200)    COMMENT '性别',
	`bumen` varchar(200)    COMMENT '部门',
	`gangwei` varchar(200)    COMMENT '岗位',
	`lianxidianhua` varchar(200)    COMMENT '联系电话',
	`shenfenzheng` varchar(200)    COMMENT '身份证',
	`zhaopian` varchar(200)    COMMENT '照片',
	`jiatingzhuzhi` varchar(200)    COMMENT '家庭住址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息';

DROP TABLE IF EXISTS `qiandaopingtai`;

CREATE TABLE `qiandaopingtai` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200)    COMMENT '标题',
	`xiangqing` longtext    COMMENT '详情',
	`tupian` varchar(200)    COMMENT '图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签到平台';

DROP TABLE IF EXISTS `qiandaoxinxi`;

CREATE TABLE `qiandaoxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`qiandaoleixing` varchar(200)    COMMENT '签到类型',
	`qiandaoshijian` datetime    COMMENT '签到时间',
	`yuangonggonghao` varchar(200)    COMMENT '员工工号',
	`yuangongxingming` varchar(200)    COMMENT '员工姓名',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签到信息';

DROP TABLE IF EXISTS `qingjiapingtai`;

CREATE TABLE `qingjiapingtai` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200)    COMMENT '标题',
	`neirong` longtext    COMMENT '内容',
	`tupian` varchar(200)    COMMENT '图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假平台';

DROP TABLE IF EXISTS `bangongshebei`;

CREATE TABLE `bangongshebei` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shebeibianhao` varchar(200)  UNIQUE   COMMENT '设备编号',
	`shebeimingcheng` varchar(200)    COMMENT '设备名称',
	`shuliang` int    COMMENT '数量',
	`tupian` varchar(200)    COMMENT '图片',
	`xiangqing` longtext    COMMENT '详情',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='办公设备';

DROP TABLE IF EXISTS `shebeishenqingxinxi`;

CREATE TABLE `shebeishenqingxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shebeibianhao` varchar(200)    COMMENT '设备编号',
	`shebeimingcheng` varchar(200)    COMMENT '设备名称',
	`shuliang` varchar(200)    COMMENT '数量',
	`yuangonggonghao` varchar(200)    COMMENT '员工工号',
	`yuangongxingming` varchar(200)    COMMENT '员工姓名',
	`shenqingshijian` datetime    COMMENT '申请时间',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备申请信息';

DROP TABLE IF EXISTS `qingjiaxinxi`;

CREATE TABLE `qingjiaxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200)    COMMENT '标题',
	`qingjialiyou` longtext    COMMENT '请假理由',
	`yuangonggonghao` varchar(200)    COMMENT '员工工号',
	`yuangongxingming` varchar(200)    COMMENT '员工姓名',
	`shenqingshijian` datetime    COMMENT '申请时间',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假信息';

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`userid` bigint NOT NULL   COMMENT '用户id',
	`refid` bigint    COMMENT '收藏id',
	`tablename` varchar(200)    COMMENT '表名',
	`name` varchar(200) NOT NULL   COMMENT '收藏名称',
	`picture` varchar(200) NOT NULL   COMMENT '收藏图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`title` varchar(200) NOT NULL   COMMENT '标题',
	`picture` varchar(200) NOT NULL   COMMENT '图片',
	`content` longtext NOT NULL   COMMENT '内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告信息';


DROP TABLE IF EXISTS `config`;

CREATE TABLE `config`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL COMMENT '配置参数名称',
	`value` varchar(100) COMMENT '配置参数值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

insert into config(id,name) values(1,'picture1');
insert into config(id,name) values(2,'picture2');
insert into config(id,name) values(3,'picture3');
insert into config(id,name) values(4,'picture4');
insert into config(id,name) values(5,'picture5');
insert into config(id,name) values(6,'homepage');


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`password` varchar(100) NOT NULL COMMENT '密码',
	`role` varchar(100) default '管理员' COMMENT '角色',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into users(id,username, password) values(1,'abo','abo');

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`userid` bigint NOT NULL COMMENT '用户id',
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`tablename` varchar(100) COMMENT '表名',
	`role` varchar(100) COMMENT '角色',
	`token` varchar(200) NOT NULL COMMENT '密码',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	`expiratedtime` timestamp COMMENT '过期时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

