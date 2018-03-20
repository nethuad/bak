SELECT pt_type,cnname,count(1) AS count
into portrait.dbo.dims_bak
FROM portrait.dbo.member_base
group by pt_type,cnname

use portrait
drop table dims
exec sp_rename dims_bak,dims

select * from portrait.dbo.dims where pt_type='assets'


use xueshandai
select * from receipt_detail where investor_id=980723 order by borrow_id,need_receipt_time

