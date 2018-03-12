use xueshandai
select top 10 * from account

select count(1) as c,count(distinct member_id) as c2  from account

select count(1) as c  from member
--928706

select status,count(1) from member group by status

select * from member where id=980723

select * from member_info where member_id=980723

select top 10 birthday,CONVERT(varchar(10),birthday,120) from member_info where CONVERT(varchar(10),birthday,120)='1979-03-26'



--account是与钱相关的
select * from account where member_id=980723

select * from account_bank where member_id=980723

select bank_name,bank_code,count(1) as c from account_bank group by bank_name,bank_code order by c desc  

--借款表

--投标表
select top 10 * from borrow_invest

select top 10 * from borrow_invest where investor_id=980723


select CONVERT(varchar(10),activate_time,120) as d,
count(distinct investor_id) as c
,sum(capital) as capital
,sum(interest) as interest
from borrow_invest
where CONVERT(varchar(10),activate_time,120)>='2012'
group by CONVERT(varchar(10),activate_time,120)
order by d

--40234

select status, count(1) as c from borrow_invest group by status

select invest_way, count(1) as c from borrow_invest group by invest_way

select capital_type, count(1) as c from borrow_invest group by capital_type

--推荐关系
select top 10 * from recommend  where member_id=980723


--注册的sid
select top 10 * from ad_access where referer like '%baidu%'

--活动

--优惠券

--积分表

--现金表


Repayment_Detail  借款人还款

ReceiptDetail 投资方收款记录

displacement_detail 垫付表

活动的：lottery_chance ,lottery_award,
select * from lottery_chance 
select * from lottery_award where investor_id=

优惠劵的：card_coupons_batch ，card_coupons_detail ，

select * from card_coupons_batch where batch_desc like '%新春%'

select * from card_coupons_detail

现金：transfer_detail  

select top 10 * from transfer_detail where handler_id in (980723) or receiver_id in (980723) 


overdue 逾期
proceed_invest_freeze 资金池冻结
recharge 存管充值
AdAccess 广告访问统计
Repayment_History 还款历史


借贷
还款
服务费
银行交易数据
风控数据
网站浏览数据
用户画像 portrait

--新手包
select * from card_coupons_detail where batch_id=306 and member_id is not null and use_to is not null

select * from card_coupons_detail where batch_id in (305,306,307) and member_id = 980723
select * from card_coupons_detail where 1=1 and member_id = 980723

select * from Card_Coupons_Batch where batch_desc like '%注册%'

select * from Card_Coupons_Batch where id in (269)