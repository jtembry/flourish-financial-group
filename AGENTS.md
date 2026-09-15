# Flourish Financial Group — website instructions for AI agents

This is the public website for Flourish Financial Group, LLC (Beth Hacker, AFC®, MBA). The owner, Beth, is not a developer. She edits this site by talking to you. Explain what you are doing in plain English, keep changes small, and always leave the site in a working state.

## What this is

- Astro 5 static site. Node 20 or newer. No database, no server, no framework.
- Hosted free on GitHub Pages at https://flourishfinancialgroup.org. Every push to `main` triggers `.github/workflows/deploy.yml`, which builds and publishes the site in about a minute.
- Booking and payments are external links: Cal.com (booking with prepayment) and Stripe Payment Links. The site never handles money itself.

## Where things live

| To change… | Edit |
| --- | --- |
| Prices, phone, email, hours, booking link, Stripe links, tagline, business name | `src/data/site.json` — the only place these live. Pages read from it. |
| Resources page entries | `src/content/resources/*.md` — one file per resource. Front matter: `title`, `url` (blank for members-only), `audience`, `access` (`public` / `members` / `purchase`), `order`, `published`. Body = why Beth recommends it. |
| Page wording | `src/pages/*.astro` — `index` (home), `about`, `services`, `divorce`, `cohort`, `nonprofits`, `resources`, `contact`. Text lives in the HTML between the tags. |
| Header, nav, footer, disclaimer | `src/layouts/Base.astro` |
| Colors, fonts, spacing | `src/styles/global.css` (palette and contrast ratios documented at the top) |
| Photos | `public/images/` |
| Leaf motif | `src/components/Leaf.astro` |

## Rules

1. **Never hard-code a price, phone number, or link in a page.** Put it in `src/data/site.json` and reference it.
2. **Run `npm run build` before every commit.** If the build fails, fix it before committing. Never push a broken build.
3. **Keep the footer disclaimer.** Beth is not an attorney, tax preparer, investment adviser, or CDFA®. Never describe her as an "alternative to a CDFA."
4. **Palette is fixed** unless Beth explicitly asks to change it: background `#F8F9FA`, navy `#0A192F`, accent `#00A896`. The bright accent fails accessibility as body text; use `--teal` for text. Keep WCAG AA contrast on every new color pairing.
5. **Do not edit** `.github/workflows/deploy.yml`, `public/CNAME`, or `astro.config.mjs` unless Beth asks about hosting or the domain specifically.
6. **Commit and push only when Beth says to** (for example "publish that" or "push it"). Use a short plain-English commit message describing the change. After pushing, tell her the site will update in about a minute and to refresh the page.
7. **Preview first.** When Beth wants to see a change, run `npm run dev` and tell her to open http://localhost:4321. Stop the server when she is done.
8. **Undo is easy.** If she wants to reverse the last published change, use `git revert HEAD`, build, and push. Never rewrite history with force-push.
9. **Sensitive content.** Never add client names, testimonials, or personal stories to the site unless Beth confirms she has written permission from that person.
10. Keep every page working at phone width. Check the dev preview at a narrow window after layout changes.

## Commands

    npm install        # first time only, after cloning
    npm run dev        # preview at http://localhost:4321
    npm run build      # must succeed before every commit
    git add -A && git commit -m "..." && git push   # publish
