#!/usr/bin/env bash

echo "Ingrese el nombre de tu nuevo proyecto: "; read argumento

pnpm create vite --template react $argumento

cd "$argumento"

pnpm install

pnpm install tailwindcss postcss autoprefixer

npx tailwindcss init -p

rm -rf tailwind.config.cjs

echo "/** @type {import('tailwindcss').Config} */" >> tailwind.config.cjs
echo "module.exports = {" >> tailwind.config.cjs
echo "  content: [" >> tailwind.config.cjs
echo '    "./index.html",' >> tailwind.config.cjs
echo '    "./src/**/*.{js,ts,jsx,tsx}",' >> tailwind.config.cjs
echo "  ]," >> tailwind.config.cjs
echo "  theme: {" >> tailwind.config.cjs
echo "    extend: {}," >> tailwind.config.cjs
echo "  }," >> tailwind.config.cjs
echo "  plugins: []," >> tailwind.config.cjs
echo "}" >> tailwind.config.cjs

rm -rf src/index.css

echo "@tailwind base;" >> src/index.css
echo "@tailwind components;" >> src/index.css
echo "@tailwind utilities;" >> src/index.css
