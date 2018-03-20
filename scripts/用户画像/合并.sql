use portrait

-- 合并运行
drop table t_member_portrait
select * 
into t_member_portrait 
from (
select id,'member' as pt_type, name,cnname,value,src,dt_src
from portrait.dbo.p_member

union all 

select id,'member' as pt_type, name,cnname,value,src,dt_src
from portrait.dbo.p_bank

union all 

select id,'member' as pt_type, name,cnname,value,src,dt_src
from portrait.dbo.p_member_credit

union all 
select id,'assets' as pt_type, name,cnname, value,src,dt_src
from portrait.dbo.p_integral

union all 
select id,'assets' as pt_type, name,cnname, value,src,dt_src
from portrait.dbo.p_account_cash

union all 
select id,'assets' as pt_type, name,cnname, value,src,dt_src
from portrait.dbo.p_account_recharge

union all 

select id,'invest' as pt_type,name,cnname,value,src,dt_src
from portrait.dbo.p_invest

union all

select id,'recommend' as pt_type,name,cnname,value,src,dt_src
from portrait.dbo.p_recommend_base

union all 

select id,'recommend' as pt_type,name,cnname,value,src,dt_src
from portrait.dbo.p_recommend_recommender_invest

union all

select id,'award' as pt_type,name,cnname,value,src,dt_src
from portrait.dbo.p_award_recommender_recommend

) a 


--delete from t_member_portrait

--INSERT INTO t_member_portrait(id,pt_type,name,cnname,value,src,dt_src)
--select id,'assets' as pt_type, name, cnname, value,src,dt_src
--from t_cash


use portrait
--drop table member_portrait
exec sp_rename t_member_portrait,member_portrait





select * 
from t_member_portrait 
where id in (980723,41400) 
order by id,pt_type,name


select value,count(1) as c from t_member_portrait where name='reg_way' group by value

--校验

select count(1) as c,count(distinct concat(id,name)) as c2 from portrait.dbo.t_member_portrait
--19082682	19082682

-- 注册用户量
select 
count(distinct id) as 注册用户量
,sum(case when name='is_valid_idcard' and value ='1' then 1 else 0 end) as 认证用户量 
,sum(case when name='invest_count' and value >'0' then 1 else 0 end) as 有效投标用户量
from portrait.dbo.member_base
--注册用户量 认证用户量  有效投标用户量
--928698，642573 40143

-- 认证用户量


select count(1) as c from xueshandai.dbo.member where is_valid_idcard=1
select count(distinct investor_id) from xueshandai.dbo.borrow_invest where status in (1,3)


--查看
use portrait
select count(1) as c  from member_base
select * from member_base where id in (980723) order by pt_type
select * from member_base where id in (10329) order by pt_type
select * from member_base where id in (32618) order by pt_type --vip
select * from member_base where id in (170126) order by pt_type  -- 推荐

select * from member_base where name='recommender_recommend_loanfee' order by pt_type




==================
--建表
use portrait

drop table member_portrait

--基础信息
CREATE TABLE member_portrait(
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


ALTER TABLE member_portrait ADD CONSTRAINT pk_maID PRIMARY KEY (id,name) 
