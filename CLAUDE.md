# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
bundle exec jekyll serve        # Dev server with live reload (requires restart after _config.yml changes)
bundle exec jekyll build        # Build to _site/
bundle exec rspec               # Run all tests
bundle exec rspec spec/features/language_switcher_spec.rb  # Run a single spec file
```

## Architecture

This is a Jekyll 4.4.1 static site using the `minima` theme, built as a bilingual (Croatian/English) clinic website.

### Bilingual Structure

All content lives under `pages/hr/` and `pages/en/`. Language is assigned automatically via `_config.yml` defaults — any file under `pages/hr` gets `lang: hr` injected, and `pages/en` gets `lang: en`. Pages must also declare a `permalink` starting with `/hr/` or `/en/` to make URL-based language switching work.

The site root (`/`) redirects to `/{default_lang}/` (`/hr/`) via `root_redirect.html`.

### Language Switcher

`_includes/header.html` renders the language switcher by splitting `page.url` on `/`, stripping the first two segments (empty string + language code), and rebuilding the URL with the target language prefix. This means every paired page across languages must have identical URL paths after the language segment.

Navigation links in the header are filtered by `page.lang` — only pages whose `lang` front matter matches the current page are shown, so each language has its own nav set. `_config.yml` `header_pages` lists all nav pages for both languages together; filtering happens at render time.

### Styling

`assets/main.scss` imports the minima base theme then adds custom styles. The `.light-blue-background` class is applied to both the header and footer wrappers. Minima SCSS variables (`$text-color`, `$brand-color`) are available.

### Tests

RSpec tests in `spec/` use `should` syntax (not `expect`). They test Liquid template rendering directly by parsing `_includes/header.html` with the Liquid gem — no full site build required. `spec_helper.rb` sets up a minimal Jekyll configuration pointing at the repo root as the source.
