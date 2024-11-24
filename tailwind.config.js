/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./hugo_stats.json"],
  safelist: [
    'grid-cols-1',
    'grid-cols-2',
    'grid-cols-3',
    'grid-cols-4',
    'grid-cols-5',
    'grid-cols-6',
    'grid-cols-7',
    'grid-cols-8',
    'grid-cols-9',
  ],
  theme: {
    extend: {
      screens: {
        '4xl': '1920px'
      },
      fontFamily: {
        'miriam': ['Miriam Libre', 'serif'],
        'sourcesans': ['SourceSans3', 'sans']
      },
      colors: {
        'black': '#111111',
        'white': '#fefefe',
        'half-white': '#d0d0d0',
        'red': '#c83737',
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
  darkMode: 'class',
}

