# 📚 Notas al Margen – Plataforma social de escritura

Aplicación web que permite a los usuarios registrarse, escribir notas anónimas (con seudónimo) y leer los textos de otros, todo ambientado en una misteriosa puerta y un viejo librero.

## ✨ Características

- Autenticación real con Supabase (email + contraseña + seudónimo)
- Animación de puerta 3D al ingresar
- Dos áreas principales:
  - **Panel de escritura**: publicar notas con tu seudónimo
  - **Leer aportes**: ver todas las notas ordenadas por fecha
- Persistencia en la nube gracias a Supabase
- Diseño oscuro, tipografía monoespaciada, atmósfera literaria
- Música de fondo ambiental con control de reproducción

## 🛠 Tecnologías

- Frontend: HTML5, CSS3, JavaScript (ES6)
- Backend: Supabase (PostgreSQL, Auth, RLS)
- Despliegue: Netlify, Vercel o cualquier servidor estático

## 🚀 Instalación y configuración

### 1. Clona o descarga los archivos

```bash
proyecto-notas-margen/
├── index.html
├── librero.html
├── supabase-schema.sql
└── README.md
