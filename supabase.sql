create table if not exists public.logins (
  id bigint generated always as identity primary key,
  email text not null,
  ip text,
  user_agent text,
  created_at timestamptz not null default now()
);

-- El backend accede con SUPABASE_SERVICE_ROLE_KEY.
alter table public.logins enable row level security;
grant usage on schema public to service_role;
grant select, insert on table public.logins to service_role;
grant usage, select on sequence public.logins_id_seq to service_role;
