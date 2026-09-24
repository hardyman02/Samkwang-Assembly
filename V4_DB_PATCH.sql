-- SAMKWANG ASSEMBLY V4 DB PATCH
-- Supabase SQL Editor에서 1회 실행

alter table public.plan_batches add column if not exists upload_group text not null default 'LQ2';
create index if not exists idx_plan_batches_date_group_current on public.plan_batches(plan_date, upload_group, is_current);
create index if not exists idx_plan_batches_created_at on public.plan_batches(created_at desc);
update public.plan_batches set upload_group='LQ2' where upload_group is null or upload_group='';
select 'V4 DB patch applied' as result;
