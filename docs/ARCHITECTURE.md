# Architecture and boundaries

ForgeIE is a client-side static web application. `index.html` provides the main DOM scaffolding; `assets/css/app.css` contains visual styling; `assets/js/app.js` contains the 56-topic JavaScript curriculum, calculator logic, quiz and case data, local-storage handling, and factory-simulator functions.

## Runtime

- Browser executes `assets/js/app.js` after parsing the HTML.
- Navigation happens inside the page using client-side view state; static hosting does not require server-side rewrites.
- No external library, API, environment variable, remote database, or backend is required.
- `docs/curriculum_overview.csv` inventories content for human review; it is not dynamically loaded.
- The virtual factory and engineering calculators are **educational models** with documented limitations.

## Changing lessons

The lesson catalog (`MODULES`) currently lives in `assets/js/app.js`. Update it carefully because the lesson fields are used by the learning studio, progress and quizzes. Keep ids stable if you want to preserve existing browser progress.

## Updating calculations

The calculators use form inputs and a calculation function in `assets/js/app.js`. Check units, zero/invalid inputs, numerical edge cases, and professional applicability notes when editing them.

## Progress persistence

Client-side `localStorage` is per domain and browser. There is no account sign-in, cloud storage or cross-device sync. Export data through the workspace before switching domains or devices.
