const defaultTheme = require("tailwindcss/defaultTheme")

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./templates/**/*.html","./content/**/*.md"],
  theme: {
    container: {
      padding: {
        DEFAULT: "2rem",
        lg: "4rem",
        xl: "6rem",
        "2xl": "8rem",
      },
    },
    extend: {
      fontFamily: {
        "serif": ["Aleo", ...defaultTheme.fontFamily.sans],
        "mono": ["Fira Code", ...defaultTheme.fontFamily.mono],
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
  ],
}
