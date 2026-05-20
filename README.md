# 📚 Notas al Margen – Plataforma social de escritura

Aplicación web que permite a los usuarios registrarse, escribir notas anónimas con seudónimo y leer los textos de otros, ambientada en una misteriosa puerta y un viejo librero.

## ✨ Características

- Autenticación con Supabase (email + contraseña)
- Registro con seudónimo único para las publicaciones
- Panel de escritura para publicar nuevas notas
- Lectura de publicaciones ordenadas por fecha
- Música ambiental opcional
- Interfaz oscura con estilo retro-literario

## 📁 Estructura de archivos

- `index.html` — Aplicación unificada con login, registro y librero de notas.
- `librero.html` — Página de redirección a `index.html`.
- `supabase-schema.sql` — Esquema y políticas de RLS para Supabase.
- `package.json` — Metadatos del proyecto y dependencias.
- `.env` — Archivo local con variables de entorno de Supabase.

## 🚀 Configuración de Supabase

1. Crea un proyecto en Supabase.
2. Copia el valor de tu `SUPABASE_URL` y `SUPABASE_ANON_KEY` al archivo `.env`.
3. Ejecuta el contenido de `supabase-schema.sql` en el editor SQL de Supabase.
4. Asegúrate de verificar que la tabla `profiles` y `posts` estén creadas y RLS activado.

## 🧪 Uso

- Abre `index.html` en el navegador.
- Haz clic en `Entrar` para abrir el modal de acceso.
- Usa la pestaña `acceder` si ya tienes cuenta.
- Usa la pestaña `registrarse` para crear un nuevo usuario con seudónimo.
- Al iniciar sesión, accede al panel de escritura o a la lectura de notas.

## 🛠 Recomendaciones

- Usa una clave pública `anon` de Supabase para el frontend.
- No agregues la clave secreta al proyecto público.
- Si deseas desplegar, publica el sitio estático en Netlify, Vercel u otro host estático.
