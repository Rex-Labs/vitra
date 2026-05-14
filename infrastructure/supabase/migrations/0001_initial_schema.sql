-- Users and Profiles
create table profiles (
  id uuid references auth.users on delete cascade primary key,
  display_name text,
  avatar_url text,
  date_of_birth date,
  height_cm numeric,
  weight_kg numeric,
  fitness_goal text,
  dietary_preference text,
  activity_level text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Nutrition Logs
create table nutrition_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  logged_at date not null,
  total_calories numeric,
  total_protein_g numeric,
  total_carbs_g numeric,
  total_fat_g numeric,
  created_at timestamptz default now()
);

-- Foods
create table foods (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  brand text,
  calories_per_100g numeric,
  protein_per_100g numeric,
  carbs_per_100g numeric,
  fat_per_100g numeric,
  source text,
  external_id text,
  created_at timestamptz default now()
);

-- Meals
create table meals (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  nutrition_log_id uuid references nutrition_logs(id) on delete cascade,
  name text,
  meal_type text,
  consumed_at timestamptz,
  created_at timestamptz default now()
);

-- Workouts
create table workouts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  name text not null,
  notes text,
  scheduled_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz default now()
);

-- Workout Sessions
create table workout_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  workout_id uuid references workouts(id),
  started_at timestamptz,
  completed_at timestamptz,
  duration_minutes numeric,
  notes text,
  created_at timestamptz default now()
);

-- Food Scans
create table food_scans (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  image_url text,
  scan_type text,
  status text,
  result jsonb,
  created_at timestamptz default now()
);

-- Fridge Inventory
create table fridge_inventory (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  food_id uuid references foods(id),
  name text,
  quantity numeric,
  unit text,
  expires_at date,
  added_at timestamptz default now()
);

-- Gym Preferences
create table gym_preferences (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  gym_name text,
  gym_address text,
  preferred_times jsonb,
  created_at timestamptz default now()
);

-- Notifications
create table notifications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  type text,
  title text,
  body text,
  read boolean default false,
  created_at timestamptz default now()
);

-- Analytics Events
create table analytics_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  event_name text not null,
  properties jsonb,
  created_at timestamptz default now()
);

-- Subscriptions
create table subscriptions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id) on delete cascade,
  plan text,
  status text,
  started_at timestamptz,
  expires_at timestamptz,
  created_at timestamptz default now()
);

-- Row Level Security
alter table profiles enable row level security;
alter table nutrition_logs enable row level security;
alter table foods enable row level security;
alter table meals enable row level security;
alter table workouts enable row level security;
alter table workout_sessions enable row level security;
alter table food_scans enable row level security;
alter table fridge_inventory enable row level security;
alter table gym_preferences enable row level security;
alter table notifications enable row level security;
alter table analytics_events enable row level security;
alter table subscriptions enable row level security;

-- RLS Policies (users can only access their own data)
create policy "Users can view own profile" on profiles for select using (auth.uid() = id);
create policy "Users can update own profile" on profiles for update using (auth.uid() = id);
create policy "Users can view own nutrition logs" on nutrition_logs for all using (auth.uid() = user_id);
create policy "Users can view own meals" on meals for all using (auth.uid() = user_id);
create policy "Users can view own workouts" on workouts for all using (auth.uid() = user_id);
create policy "Users can view own scans" on food_scans for all using (auth.uid() = user_id);
create policy "Users can view own fridge" on fridge_inventory for all using (auth.uid() = user_id);
create policy "Users can view own notifications" on notifications for all using (auth.uid() = user_id);
create policy "Users can view own subscriptions" on subscriptions for all using (auth.uid() = user_id);

