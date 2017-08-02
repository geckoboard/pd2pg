create table if not exists incidents (
  id varchar primary key,
  incident_number int not null,
  created_at timestamptz not null,
  html_url varchar not null,
  incident_key varchar,
  service_id varchar,
  escalation_policy_id varchar,
  trigger_summary_subject varchar,
  trigger_summary_description varchar,
  trigger_type varchar not null
);

create table if not exists log_entries (
  id varchar primary key,
  type varchar not null,
  created_at timestamptz not null,
  incident_id varchar not null,
  agent_type varchar,
  agent_id varchar,
  channel_type varchar,
  user_id varchar,
  notification_type varchar,
  assigned_user_id varchar
);

create table if not exists services (
  id varchar primary key,
  name varchar not null,
  status varchar not null,
  type varchar not null
);

create table if not exists escalation_policies (
  id varchar primary key,
  name varchar not null
);

create table if not exists users (
  id varchar primary key,
  name varchar not null,
  email varchar not null
);

create table if not exists schedules (
  id varchar primary key,
  name varchar not null,
  description varchar not null
);

-- Extension tablefunc enables crosstabs.
create extension if not exists tablefunc;
