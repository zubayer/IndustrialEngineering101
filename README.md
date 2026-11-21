# ForgeIE — Industrial Engineering Career Academy

The source code for the **ForgeIE 2.0** interactive Industrial Engineering learning platform. This repository is prepared for **GitHub → Netlify continuous deployment**, with no framework, build tooling, tokens, or paid API required.

## What is included

- **56 learning modules** across practical Industrial Engineering areas, including process mapping, time study, line balancing, capacity, standard work, VSM, SPC, process capability, FMEA, root cause analysis, DOE, inventory, layout, ergonomics, queueing, simulation, and engineering economics.
- **18 engineering calculators** with sample values, formulas, steps, and applicability caveats.
- An educational **virtual factory simulator**, eight multi-stage workplace cases, skill checks, four career pathways, and a workspace for learning notes and progress.
- Browser-local progress storage and JSON export/import. No learner account or server backend is provided.

## Project structure

```text
IndustrialEngineering101/
├── index.html               # Web page and UI containers
├── assets/
│   ├── css/app.css          # Site layout and styling
│   └── js/app.js            # Lessons, calculators, simulator, interactivity
├── docs/
│   ├── curriculum_overview.csv
│   ├── DEPLOY_NETLIFY.md
│   └── ARCHITECTURE.md
├── tests/
│   └── smoke-test.mjs       # Syntax, links, project structure checks
├── netlify.toml             # Netlify root publish settings
├── .gitignore
└── README.md
```

The app originally existed as a standalone HTML file. Its **original HTML, CSS and JavaScript have been separated without changing lesson or simulator logic** so the actual code is visible and maintainable in GitHub. Lesson data remains embedded in `assets/js/app.js` as JavaScript constants; the CSV is an inventory, not a live data feed.

## Run locally

From the repository root, use a local web server (recommended):

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000`. The app requires no Node package installation. Files can also be opened locally in some browsers when the folder structure remains intact, but serving over HTTP is more reliable.

Run source checks if Node.js is installed:

```bash
node tests/smoke-test.mjs
```

## Publish via GitHub → Netlify

1. Ensure these files are committed on the GitHub repository's **main** branch, with **`index.html` at the repository root**.
2. In Netlify, select **Add new project → Import an existing project → GitHub**.
3. Select `zubayer/IndustrialEngineering101`.
4. Use the settings from `netlify.toml`: **Base directory** blank, **Build command** blank, **Publish directory** `.` (repository root).
5. Deploy; test the Netlify URL and verify navigation, calculations, simulator, and local progress.

Full instructions and troubleshooting are in [`docs/DEPLOY_NETLIFY.md`](docs/DEPLOY_NETLIFY.md). Future pushes to the connected deployment branch trigger a new Netlify deployment.

## Safety and privacy

This application is **educational**. Examples and calculators do not constitute engineering design approval, a validated digital twin, a professional safety assessment, certified workplace time standard, or an official NIOSH/RULA assessment. Follow current standards and workplace procedures for professional use. Factory results are based on simplified discrete-time assumptions.

Progress, personal notes, and scenarios are saved in your browser's local storage. They do not automatically synchronize between devices or domains. Back up learning data using the built-in JSON export. **Do not put confidential workplace data into public GitHub commits.**

## Design

Editable UX exploration: [ForgeIE Figma workspace](https://www.figma.com/design/GTeqScmX8FKlu7O5RYzm0R). The Figma file is for design; this repository contains the functional website.

## License

No license is declared here. Repository owner should choose an appropriate license before accepting public contributions.

## Guided push to GitHub from a Mac/PC

If Git is installed and you have GitHub write access, extract the ZIP and run the included guarded script from the extracted folder:

```bash
bash scripts/push_to_github.sh
```

It clones the existing repository, preserves unrelated files, shows which files are staged, and asks for approval before committing/pushing. Existing matching filenames will be updated; review the confirmation carefully. It uses your computer's normal GitHub authentication and does not need a token pasted into ChatGPT.