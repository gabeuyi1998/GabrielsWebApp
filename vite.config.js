import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';
import { strict } from 'assert';

export default defineConfig({
    plugins: [react()],
  build: {
    rollupOptions: {
      input: 'public/index.html'  // Correctly points to /app/public/index.html inside Docker
    }},
    base: "/",
    preview: {
        port: 5173,
        strictPort: true,
    },
    server: {
        port: 5173,
        strictPort: true,
        host: true,
        origin: "http://0.0.0.0:5173",
    }, 
  }
);