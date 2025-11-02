import { defineConfig } from "vite";
import { resolve } from "path";

export default defineConfig({
  base: "/static/",
  build: {
    manifest: true,
    outDir: resolve(__dirname, "static/dist"),
    emptyOutDir: true,
    rollupOptions: {
      input: {
        main: resolve(__dirname, "static/src/main.js"),
      },
      output: {
        assetFileNames: "assets/[name].[hash][extname]",
        chunkFileNames: "assets/[name].[hash].js",
        entryFileNames: "assets/[name].[hash].js",
      },
    },
    sourcemap: true,
  },
  server: {
    host: "0.0.0.0",
    port: 5173,
    strictPort: true,
    hmr: {
      host: "localhost",
      port: 5173,
    },
    watch: {
      usePolling: true,
      interval: 1000,
    },
  },
  optimizeDeps: {
    include: ["htmx.org", "alpinejs"],
  },
  css: {
    postcss: "./postcss.config.js",
  },
});
