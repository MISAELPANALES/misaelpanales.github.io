-- Ejecutar en el Editor SQL de Supabase

-- 1. Tabla de perfiles (vinculada con auth.users)
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID REFERENCES auth.users(id) PRIMARY KEY,
    pseudonym TEXT NOT NULL,
    email TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Tabla de posts
CREATE TABLE IF NOT EXISTS public.posts (
    id BIGSERIAL PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) NOT NULL,
    pseudonym TEXT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Políticas RLS (Row Level Security)
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;

-- Perfiles: cada usuario puede leer todos los perfiles (para mostrar seudónimos)
CREATE POLICY "Usuarios pueden leer todos los perfiles"
    ON public.profiles FOR SELECT
    USING (auth.role() = 'authenticated');

-- Perfiles: solo el propio usuario puede actualizar su seudónimo (opcional)
CREATE POLICY "Usuarios pueden actualizar su propio perfil"
    ON public.profiles FOR UPDATE
    USING (auth.uid() = id);

-- Perfiles: inserción permitida solo durante registro (desde cliente autenticado)
CREATE POLICY "Usuarios pueden insertar su perfil"
    ON public.profiles FOR INSERT
    WITH CHECK (auth.uid() = id);

-- Posts: todos los usuarios autenticados pueden leer todos los posts
CREATE POLICY "Lectura de posts para todos"
    ON public.posts FOR SELECT
    USING (auth.role() = 'authenticated');

-- Posts: solo el usuario autenticado puede insertar sus propios posts
CREATE POLICY "Insercion de posts propia"
    ON public.posts FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Opcional: actualizar/borrar solo sus posts (no implementado en la UI)
CREATE POLICY "Actualizar solo sus posts"
    ON public.posts FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Borrar solo sus posts"
    ON public.posts FOR DELETE
    USING (auth.uid() = user_id);

-- 4. Índices para rendimiento
CREATE INDEX idx_posts_created_at ON public.posts(created_at DESC);
CREATE INDEX idx_posts_user_id ON public.posts(user_id);