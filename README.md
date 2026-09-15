# Your website — how to edit it yourself

This is the code for **flourishfinancialgroup.org**. It's a plain, fast website with no monthly bill. GitHub stores the files and publishes the site for free; your domain at GoDaddy points at it. You edit the site by talking to an AI assistant (OpenAI's Codex, included with your ChatGPT subscription) in a terminal window on your computer. You never have to read or write code.

Read this once. After setup, editing is three steps: open the folder, ask Codex for the change, tell it to publish.

---

## One-time setup (about 30 minutes)

### 1. Create a GitHub account

Go to https://github.com and sign up with the email you want tied to the website. Free plan. Pick a username you're happy having in a web address. JT will transfer the website's repository to this account.

### 2. Install the tools (Mac)

Open **Terminal** (press ⌘-Space, type Terminal, press Return). Paste each line and press Return.

Install Apple's developer tools (gives you `git`):

    xcode-select --install

Click Install in the window that appears. Then install Node from https://nodejs.org — download the **LTS** installer and run it. Close Terminal and open it again. Check both worked:

    git --version
    node --version

Each should print a version number.

**Windows:** install **Git for Windows** from https://git-scm.com and **Node LTS** from https://nodejs.org, then use the "Git Bash" app as your terminal. Codex CLI on Windows currently expects WSL (Windows Subsystem for Linux); if that's a hurdle, ask JT and we'll set up the Windows path together.

### 3. Sign in to GitHub from Terminal

    git config --global user.name "Beth Hacker"
    git config --global user.email "the-email-you-used-on-github"

Install GitHub's command-line helper and sign in (it opens your browser):

    brew install gh   # Mac with Homebrew; otherwise download from https://cli.github.com
    gh auth login

Choose GitHub.com, HTTPS, and "Login with a web browser." Approve in the browser.

### 4. Download your website's files

After JT has transferred the repository to your account:

    cd ~/Documents
    gh repo clone YOUR-GITHUB-USERNAME/flourish-financial-group
    cd flourish-financial-group
    npm install

`npm install` takes a minute the first time only.

### 5. Install Codex and sign in

    npm install -g @openai/codex
    codex

The first time, choose **Sign in with ChatGPT** and approve in the browser. That's it. Type `/quit` or press Ctrl-C to leave Codex.

---

## Editing the site (every time)

1. **Open Terminal, go to the folder, start Codex:**

        cd ~/Documents/flourish-financial-group
        codex

2. **Ask for the change in plain English.** Codex has a file called `AGENTS.md` that tells it how this site is built and what not to touch. Examples that work well:

   - "Change the single-session price to $150 and the six-week package to $700."
   - "Add a resource to the Resources page: title 'CFPB Budget Worksheet', link https://…, audience Everyone, and say why I recommend it: …"
   - "On the About page, add a sentence after the first paragraph about my work with military spouses."
   - "Update my hours to weekdays 5 to 7 pm and Saturday mornings."
   - "Replace the booking link with my new Cal.com link: https://cal.com/…"
   - "Show me what the home page looks like on a phone."
   - "Add a testimonial from a client on the Services page. Here's the quote and her first name."

3. **Preview before publishing.** Say "let me see it." Codex will start a preview and tell you to open http://localhost:4321 in your browser. Look it over. Ask for tweaks until it's right.

4. **Publish.** Say **"publish that"** (or "commit and push"). Codex builds the site, checks it, and pushes. About one minute later, refresh flourishfinancialgroup.org. Done.

5. **Undo.** If you publish something and regret it: "undo the last change and publish." Codex reverts it.

### Things Codex will refuse or ask about (on purpose)

- Changing your brand colors or the footer disclaimer without you asking explicitly.
- Calling you a CDFA or an "alternative to a CDFA."
- Adding a client's name or story without your confirmation that you have permission.
- Touching the hosting or domain configuration.

---

## Where things live (if you're curious)

| What | File |
| --- | --- |
| Prices, phone, hours, booking and Stripe links, tagline | `src/data/site.json` |
| Resources page entries (one file each) | `src/content/resources/` |
| Each page's wording | `src/pages/` (home is `index.astro`) |
| Header, menu, footer | `src/layouts/Base.astro` |
| Colors and fonts | `src/styles/global.css` |
| Your photo | `public/images/beth.jpg` |

---

## If something goes wrong

- **Site didn't update after publishing.** Wait two minutes and hard-refresh (⌘-Shift-R). Still stale? Open your repository on github.com and click the **Actions** tab. A red ✗ means the build failed. Copy the error and tell Codex "the deploy failed with this error" and paste it.
- **Codex says the build failed.** Say "fix the build." It usually can. If not, "undo my last change."
- **`codex` command not found.** Close Terminal, reopen it, try again. If still missing, rerun `npm install -g @openai/codex`.
- **Anything else.** Text JT. The site is a folder of text files; nothing you do in Codex can break the live site until you say "publish," and every published change can be undone.

---

## What this costs

- Domain: your GoDaddy renewal, about $20 a year.
- Hosting: $0 (GitHub Pages).
- Editing: $0 beyond your existing ChatGPT subscription.
- Payments: Stripe keeps about 2.9% + 30¢ per transaction. Cal.com is free.
