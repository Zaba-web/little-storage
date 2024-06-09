/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.svelte"
  ],
  theme: {
    extend: {
      colors: {
        "theme-dark": {
          50: "#161719",
          75: "#191924",
          100: "#0f0f0f"
        },
        "theme-gray": '#d9d9d9',
        "theme-accent": '#4f52bf'
      },
      fontFamily: {
        "theme-default": ["Noto Sans"]
      }
    },
  },
  plugins: [],
  safelist: [
    'bg-theme-dark-50',
    'bg-theme-dark-100'
  ]
}

