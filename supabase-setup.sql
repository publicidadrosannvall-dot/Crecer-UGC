-- Ejecuta esto en Supabase → SQL Editor → New query → Run

create table if not exists creators (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  pais text not null,
  ciudad text not null,
  edad int not null,
  tarifa_desde numeric not null,
  categorias text[] not null default '{}',
  plataformas text[] not null default '{}',
  portafolio_url text not null,
  contacto text not null,
  foto_url text,
  bio text,
  access_code text not null unique,
  contact_count int not null default 0,
  created_at timestamptz not null default now()
);

-- Habilita seguridad a nivel de fila
alter table creators enable row level security;

-- Cualquiera puede LEER el directorio (marcas navegando)
create policy "Cualquiera puede leer creadoras"
  on creators for select
  using (true);

-- Cualquiera puede REGISTRARSE como creadora (formulario público)
create policy "Cualquiera puede crear su ficha"
  on creators for insert
  with check (true);

-- Cualquiera puede ACTUALIZAR (necesario para sumar el contador de "Contactar"
-- y para que la creadora edite su ficha con su código de acceso).
-- Nota: esto es una política abierta, adecuada para el MVP.
-- Si el proyecto crece, conviene restringirla con Supabase Auth.
create policy "Cualquiera puede actualizar una ficha"
  on creators for update
  using (true);
