use portrait

drop table portrait.dbo.member_base

--基础信息
CREATE TABLE portrait.dbo.member_base(
	[id] [bigint] NOT NULL,
	pt_type varchar(20) not null,
	name varchar(50) NOT NULL,
	cnname varchar(50) NOT NULL,
	value varchar(1000), 
	src varchar(50),  -- 来源
	dt_src datetime, -- 更新时间
	[dt_created] [datetime] DEFAULT(GETDATE()),
	[dt_updated] [datetime] NULL
)


ALTER TABLE member_base ADD CONSTRAINT pk_maID PRIMARY KEY (id,name) 