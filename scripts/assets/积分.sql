

drop table portrait.dbo.pt_integral

select member_id,score
,'xueshandai.dbo.integral' as src 
into portrait.dbo.pt_integral
from (
select *
,ROW_NUMBER() OVER(PARTITION by member_id ORDER by id asc) as rown
from xueshandai.dbo.integral
) a where rown=1


select count(1) as c,count(distinct member_id) as c2 from portrait.dbo.pt_integral


use portrait

drop table p_integral
select member_id as id,'integral' as name,'»ý·Ö' as cnname,cast(score as varchar) as value,src,GETDATE() as dt_src
into p_integral
from pt_integral

select * from p_integral where id=980723


