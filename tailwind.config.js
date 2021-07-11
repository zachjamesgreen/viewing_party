module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/**/*.rb'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      margin: {
        '1/4': '25%',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
