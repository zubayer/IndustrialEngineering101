# Publishing ForgeIE from GitHub to Netlify

## Source of truth
The GitHub repository https://github.com/zubayer/IndustrialEngineering101 is the source of truth. Netlify should **import from GitHub**, not from an unrelated copy on a computer. Keep `index.html` and `netlify.toml` in the repository root.

## Step 1 — Confirm files on GitHub
Visit https://github.com/zubayer/IndustrialEngineering101 and check `main` contains `index.html`, `assets/css/app.css`, `assets/js/app.js`, and `netlify.toml`. If the repository is private, Netlify's GitHub integration must be granted access to it.

## Step 2 — Import repository to Netlify
1. Open https://app.netlify.com/start and sign in.
2. Choose **Import an existing project** / **Import from Git** and choose **GitHub**.
3. Authorize `zubayer/IndustrialEngineering101` in Netlify's GitHub integration if prompted.
4. Select the repository and confirm production branch `main`.
5. Use these settings:

| Netlify field | Value |
|---|---|
| Base directory | leave empty |
| Build command | leave empty (not `npm run build`) |
| Publish directory | `.` (repository root) |
| Functions directory | leave empty |

6. Deploy. Netlify generates a `*.netlify.app` address.

## Step 3 — Test the published site
- Home page loads with ForgeIE branding rather than a folder listing or 404.
- Learning library shows modules and opens lessons.
- Engineering calculators update when inputs change.
- Virtual factory allows a step or full-shift run.
- Notes and progress persist after a refresh on the same browser where local storage is permitted.
- Mobile and desktop navigation work; JS/CSS files load successfully without 404s.

## Step 4 — Update the platform
Edit `assets/js/app.js` for content/behavior, `assets/css/app.css` for visuals, and `index.html` for document structure. Commit to `main`; Netlify redeploys automatically if Git integration is active. Verify the live URL after each deploy.

## Troubleshooting
- **Blank or unstyled page:** confirm `assets/css/app.css` and `assets/js/app.js` are present with the correct paths. Check browser Network tab for 404s.
- **404 at site root:** ensure `index.html` is in the publish directory, and Netlify publish path is `.`.
- **Build command failure:** this project requires no npm install, build command or `dist` folder.
- **Updates invisible:** confirm the correct Git branch and new Netlify deployment; hard refresh browser.
- **Missing progress:** browser local storage differs by domain (`vercel.app` versus `netlify.app`). Export/import learning data before migration.
- **Existing GitHub files:** compare before replacing; do not delete unrelated files.
