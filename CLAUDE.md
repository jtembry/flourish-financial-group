# Flourish Financial Counseling — Beth Hacker, AFC® site

Static marketing + booking site for Beth Hacker's fee-only financial counseling practice. Built as a favor and portfolio piece; vault Project: `1 Projects/Beth Hacker AFC Website.md` (copy drafts and Beth's answers live there, not here).

## Stack ($0/month by design — Beth does not want a monthly bill)

- Astro 5, static output, no framework islands. Node 20+.
- Hosting: **GitHub Pages** via `.github/workflows/deploy.yml` (every push to main redeploys; `public/CNAME` holds the domain). Domain: **flourishfinancialgroup.org** (Beth's choice 2026-09-14; unregistered that night — buy at Cloudflare Registrar or Porkbun). flourishfinancialgroup.com is taken by someone else.
- Content Beth edits: `src/content/resources/*.md` and `src/data/site.json`, through Decap CMS at `/admin` (`public/admin/config.yml`). Auth not wired yet — see the TODO in that file.
- Booking + prepay: Cal.com free plan + Stripe (`bookingUrl` in site.json).
- Packages and subscriptions: Stripe Payment Links (`stripe.*` in site.json). Six-month cohort tier is sold as a $420 prepaid product because Stripe can't enforce a minimum term.
- Gated resources (`access: members|purchase`): the site only labels them; the actual files live in a private Google Drive folder Beth shares with each subscriber by hand.

## Rules

- Every price, link, and phone number comes from `src/data/site.json`. Never hard-code them in pages.
- Palette and contrast ratios are documented at the top of `src/styles/global.css`. Gold is for CTAs only. `--teal-bright` is decorative only (fails AA as text).
- Keep the footer disclaimer: not an attorney, not a CDFA®, not tax/investment advice. Beth is not a CDFA yet; never say "alternative to a CDFA."
- Layout changes are JT's job; copy changes are Beth's through `/admin`. Don't make her edit `.astro` files.

## Commands

    npm install
    npm run dev      # http://localhost:4321
    npm run build    # dist/

## Brand (from Beth's business card, 2026-09-14)

- Name on the card: **Flourish Financial Counseling, LLC** (her typed answer said "Group" — confirm which is the legal name; the footer must carry the legal one).
- Subtitle: "Accredited Financial Counselor & Fiduciary". Tagline: "Empowering Financial Growth & Peace of Mind".
- Type: serif display (Cormorant Garamond via Google Fonts) for headings and the brand line, light sans (Source Sans 3) for body. Leaf sprig motif = `src/components/Leaf.astro`.
- Card image: `~/Documents/career/beth-hacker-afc/business-card.png`.
