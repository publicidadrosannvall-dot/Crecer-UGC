# CRECER — Directorio UGC de Latinoamérica

Sitio funcional (React + Vite + Supabase). Guía paso a paso para ponerlo en línea con tu propio dominio.

## 1. Crear el backend gratis en Supabase (5 min)

1. Ve a https://supabase.com → **Start your project** → crea cuenta gratis (con GitHub o correo).
2. **New project** → nombre "crecer-latam" → elige una contraseña de base de datos (guárdala) → región más cercana (ej. São Paulo o la más cercana a LATAM) → **Create new project**. Espera ~2 minutos a que se aprovisione.
3. Ve a **SQL Editor** (menú izquierdo) → **New query** → pega todo el contenido del archivo `supabase-setup.sql` → **Run**. Esto crea la tabla `creators` y sus permisos.
4. Ve a **Project Settings → API**. Copia:
   - **Project URL**
   - **anon public key**

## 2. Configurar el proyecto en tu computadora

1. Instala [Node.js](https://nodejs.org) si no lo tienes (versión 18 o más nueva).
2. Descomprime esta carpeta y abre una terminal dentro de ella.
3. Copia `.env.example` a un archivo nuevo llamado `.env` y pega ahí tu Project URL y tu anon key:
   ```
   VITE_SUPABASE_URL=https://tu-proyecto.supabase.co
   VITE_SUPABASE_ANON_KEY=tu-anon-key-publica
   ```
4. Instala las dependencias:
   ```
   npm install
   ```
5. Pruébalo localmente:
   ```
   npm run dev
   ```
   Abre la URL que aparece (normalmente `http://localhost:5173`) y confirma que carga y que puedes crear una ficha de prueba.

## 3. Subirlo a GitHub (gratis)

1. Crea una cuenta en https://github.com si no tienes.
2. Crea un repositorio nuevo (botón **New**), por ejemplo `crecer-latam`. No marques ninguna casilla de inicialización.
3. En tu terminal, dentro de la carpeta del proyecto:
   ```
   git init
   git add .
   git commit -m "Primera versión de CRECER"
   git branch -M main
   git remote add origin https://github.com/TU-USUARIO/crecer-latam.git
   git push -u origin main
   ```
   (`.env` no se sube porque está en `.gitignore` — tus claves quedan seguras.)

## 4. Desplegarlo gratis en Vercel

1. Ve a https://vercel.com → **Sign up** → entra con tu cuenta de GitHub.
2. **Add New → Project** → elige el repositorio `crecer-latam`.
3. En **Environment Variables**, agrega las mismas dos variables de tu `.env`:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
4. **Deploy**. En ~1 minuto te da una URL gratis tipo `crecer-latam.vercel.app` — ya es un sitio real y funcional.

## 5. Conectar tu dominio de $10

1. Compra tu dominio (Namecheap, GoDaddy, Google Domains, etc. — donde ya lo tengas cotizado en $10).
2. En Vercel: tu proyecto → **Settings → Domains** → escribe tu dominio → **Add**.
3. Vercel te da 1 o 2 registros DNS (un `A` o un `CNAME`) para agregar en el panel de tu proveedor de dominio, sección **DNS**.
4. Espera entre 10 minutos y algunas horas a que propague. Cuando termine, tu dominio propio abrirá el sitio directamente.

## Nota sobre seguridad

El "login" de creadoras usa un código de acceso simple, no una contraseña cifrada — suficiente para esta primera etapa. Si el proyecto crece y maneja información más sensible, el siguiente paso natural es agregar autenticación real con **Supabase Auth** (gratis también).
