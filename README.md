# Your website — how to edit it yourself

This is the code for **flourishfinancialgroup.org**. It's a plain, fast website with no monthly bill. GitHub stores the files and publishes the site for free; your domain at GoDaddy points at it. You edit the site by talking to an AI assistant (OpenAI's Codex, included with your ChatGPT subscription) in a terminal window on your computer. You never have to read or write code.

Read this once. After setup, editing is three steps: open the folder, ask Codex for the change, tell it to publish.

---

## One-time setup (about 30 minutes, Windows)

You'll paste a few lines into **PowerShell**. To open it: press the Windows key, type *PowerShell*, and choose **Windows PowerShell** (or *Terminal*). Paste each line with a right-click, then press Enter.

### 1. Create a GitHub account

Go to https://github.com and sign up with the email you want tied to the website. Free plan. Pick a username you're happy having in a web address. JT will transfer the website's repository to this account, so send him the username.

### 2. Install the tools

Paste these one at a time. Each downloads and installs a program; say Yes if Windows asks for permission.

    winget install --id Git.Git -e
    winget install --id OpenJS.NodeJS.LTS -e
    winget install --id GitHub.cli -e

Close PowerShell and open it again so it sees the new programs. Check they worked; each should print a version number:

    git --version
    node --version
    gh --version

### 3. Tell git who you are, and sign in to GitHub

    git config --global user.name "Beth Hacker"
    git config --global user.email "the-email-you-used-on-github"
    gh auth login

For the questions: **GitHub.com**, **HTTPS**, **Yes** to authenticate git, **Login with a web browser**. Copy the code it shows, press Enter, paste the code in the browser, approve.

### 4. Download your website's files

After JT has transferred the repository to your account. Replace `YOUR-USERNAME` with your GitHub username. The last line takes about a minute the first time only.

    cd ~\Documents
    gh repo clone YOUR-USERNAME/flourish-financial-group
    cd flourish-financial-group
    npm install

### 5. Install Codex and sign in

Codex is OpenAI's coding assistant; it's included with your ChatGPT subscription and runs on Windows natively.

    powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"

Close PowerShell, open it again, go back to the folder, and start it:

    cd ~\Documents\flourish-financial-group
    codex

The first time, choose **Sign in with ChatGPT** and approve in the browser. Codex may also ask to set up its sandbox and want an administrator's OK; on your own laptop that's you, so allow it. Type `/quit` to leave Codex whenever you're done.

**Prefer a window over a terminal?** The ChatGPT desktop app for Windows includes Codex too. Install ChatGPT from the Microsoft Store, sign in, open the Codex tab, and point it at the `Documents\flourish-financial-group` folder. Everything in the next section works the same way there.

**On a Mac instead?** The steps are the same with these swaps: run `xcode-select --install` for git, install Node from https://nodejs.org, install `gh` from https://cli.github.com, and install Codex with `curl -fsSL https://chatgpt.com/codex/install.sh | sh`.

---

## Editing the site (every time)

1. **Open PowerShell, go to the folder, start Codex:**

        cd ~\Documents\flourish-financial-group
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

- **Site didn't update after publishing.** Wait two minutes and hard-refresh (Ctrl-Shift-R). Still stale? Open your repository on github.com and click the **Actions** tab. A red ✗ means the build failed. Copy the error and tell Codex "the deploy failed with this error" and paste it.
- **Codex says the build failed.** Say "fix the build." It usually can. If not, "undo my last change."
- **`codex` command not found.** Close PowerShell, reopen it, try again. If still missing, rerun the install line from step 5.
- **Anything else.** Text JT. The site is a folder of text files; nothing you do in Codex can break the live site until you say "publish," and every published change can be undone.

---

## What this costs

- Domain: your GoDaddy renewal, about $20 a year.
- Hosting: $0 (GitHub Pages).
- Editing: $0 beyond your existing ChatGPT subscription.
- Payments: Stripe keeps about 2.9% + 30¢ per transaction. Cal.com is free.
