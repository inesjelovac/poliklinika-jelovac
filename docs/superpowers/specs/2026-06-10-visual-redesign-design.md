# Visual Redesign — Design Spec
_2026-06-10_

## Goal

Modernise the site's visual design to feel clean, sleek, and appropriate for a premium private medical practice, while staying within the Jekyll/minima stack. No theme replacement — all changes are CSS overrides and minimal HTML edits.

## Colour Palette

| Role | Value |
|---|---|
| Header & footer background | `#1a5f7a` |
| Header & footer text | `#ffffff` |
| Page background | `#ffffff` |
| Body text | `#1d3040` |
| Accent (links, headings, buttons) | `#2389b0` |
| Subtle section tint | `#f4fafd` |
| Muted footer secondary text | `rgba(255,255,255,0.7)` |

The current `.light-blue-background` class is repurposed: its value changes from `#f0f8ff` to `#1a5f7a` for header and footer. Content area backgrounds become pure white.

## Typography

- **Font**: Inter (Google Fonts), loaded via `<link>` in `_includes/head.html`
- **Base size**: 17px
- **Line height**: 1.75
- **Headings**: bold, slight letter-spacing (`0.02em`), `h2` in accent teal `#2389b0`
- **Nav links**: white, uppercase, `font-size: 0.85rem`, letter-spacing `0.08em`

## Header & Footer

- Background: `#1a5f7a` (both)
- All text and links: white
- Nav link hover: white underline
- Language switcher separator: `rgba(255,255,255,0.3)`
- Footer secondary items (address, copyright): `rgba(255,255,255,0.7)`
- Header gets extra vertical padding for breathing room

## Homepage Hero (HTML + CSS)

Changes to `pages/hr/index.html` and `pages/en/index.markdown`:

- Wrap the opening `<h1>` + `<p>` in a `<div class="hero">` with `home.jpg` as CSS `background-image`
- Overlay: `rgba(26, 95, 122, 0.72)` so text is always readable
- Headline: large white text, `font-size: ~2.4rem`
- Subheading: white, `opacity: 0.9`
- CTA button: white outline style, links to contact page (`/hr/contact/` or `/en/contact/`)
- Hero min-height: `420px` on desktop, `280px` on mobile

## Content Sections

- `.home-services` block: `#f4fafd` background, generous padding (`2.5rem`)
- List bullets replaced with teal `■` or CSS `::before` dot in `#2389b0`
- `h2` colour: `#2389b0`
- Body links: `#2389b0`, no underline by default, underline on hover
- Doctor photo (About page): `border-radius: 8px`, `box-shadow: 0 4px 16px rgba(0,0,0,0.10)`

## Files to Change

| File | Change |
|---|---|
| `_includes/head.html` | Add Google Fonts `<link>` for Inter |
| `assets/main.scss` | All CSS overrides (palette, typography, hero, sections) |
| `pages/hr/index.html` | Wrap intro in `.hero` div, add CTA button |
| `pages/en/index.markdown` | Same hero wrapper and CTA button |

## Out of Scope

- No changes to page structure beyond the homepage hero
- No new pages or routes
- No JavaScript
