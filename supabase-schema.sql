-- Supabase schema proposal for Phase 2
create table sales_representatives (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  company text,
  role text,
  email text,
  phone text,
  whatsapp text,
  territory text,
  active boolean default true,
  target_monthly_activities integer default 0,
  target_monthly_pipeline numeric default 0,
  notes text,
  created_at timestamptz default now()
);

create table companies (
  id uuid primary key default gen_random_uuid(),
  company text not null,
  segment text,
  emirate text,
  status text,
  source text,
  sales_rep_id uuid references sales_representatives(id) on delete set null,
  next_step text,
  next_date date,
  notes text,
  created_at timestamptz default now()
);

create table contacts (
  id uuid primary key default gen_random_uuid(),
  company_id uuid references companies(id) on delete cascade,
  name text not null,
  position text,
  email text,
  phone text,
  decision_role text,
  notes text,
  created_at timestamptz default now()
);

create table deals (
  id uuid primary key default gen_random_uuid(),
  company_id uuid references companies(id) on delete cascade,
  contact_id uuid references contacts(id) on delete set null,
  sales_rep_id uuid references sales_representatives(id) on delete set null,
  title text not null,
  product text,
  value numeric default 0,
  currency text default 'USD',
  stage text,
  probability numeric default 0,
  close_date date,
  offer_no text,
  core_number text,
  crm_complete boolean default false,
  core_complete boolean default false,
  paper_folder boolean default false,
  offer_pdf boolean default false,
  last_activity_date date,
  last_activity text,
  created_at timestamptz default now()
);

create table activities (
  id uuid primary key default gen_random_uuid(),
  company_id uuid references companies(id) on delete cascade,
  deal_id uuid references deals(id) on delete set null,
  sales_rep_id uuid references sales_representatives(id) on delete set null,
  type text,
  subject text not null,
  date date,
  result text,
  next_action text,
  created_at timestamptz default now()
);
