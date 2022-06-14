/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx,elm}"],
  theme: {
    colors: {
      //& Brand
      "brand-0": "hsla(var(--clr-brand-0-hsl) / <alpha-value>)",
      "brand-1": "hsla(var(--clr-brand-1-hsl) / <alpha-value>)",
      "brand-2": "hsla(var(--clr-brand-2-hsl) / <alpha-value>)",
      "brand-3": "hsla(var(--clr-brand-3-hsl) / <alpha-value>)",
      "brand-4": "hsla(var(--clr-brand-4-hsl) / <alpha-value>)",
      "brand-5": "hsla(var(--clr-brand-5-hsl) / <alpha-value>)",

      // & Accent
      "accent-0": "hsla(var(--clr-accent-0-hsl) / <alpha-value>)",
      "accent-1": "hsla(var(--clr-accent-1-hsl) / <alpha-value>)",
      "accent-2": "hsla(var(--clr-accent-2-hsl) / <alpha-value>)",

      // & Unique
      "unique-0": "hsla(var(--clr-unique-0-hsl) / <alpha-value>)",
      "unique-1": "hsla(var(--clr-unique-1-hsl) / <alpha-value>)",
      "unique-2": "hsla(var(--clr-unique-2-hsl) / <alpha-value>)",
      "unique-3": "hsla(var(--clr-unique-2-hsl) / <alpha-value>)",
    },
    borderRadius: {
      "rounded-sm": "var(--rounded-sm)",
      "rounded-lg": "var(--rounded-lg)",
      "rounded-full": "var(--rounded-full)",
    },
    fontFamily: {
      sans: "var(--font-sans)",
      serif: "var(--font-serif)",
    },
  },
  plugins: [],
  corePlugins: {
    preflight: false,
  },
};
