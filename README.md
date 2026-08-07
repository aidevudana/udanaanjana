# DoctorDev — Udana Anjana

Personal portfolio. Virtuo demo 11, converted from PHP to plain static HTML.
No build step, no framework, no server.

---

## 1. Get it running

The `assets/` folder (~63 MB) isn't in this package — it's part of your
purchased ThemeForest licence and stays in your own copy of the template.

**macOS / Linux**

```bash
chmod +x setup.sh
./setup.sh ~/Downloads/Virtuo-PHP-Template
```

**Windows (PowerShell)**

```powershell
.\setup.ps1 -TemplateRoot "C:\Users\you\Downloads\Virtuo-PHP-Template"
```

Or copy it manually:

```
Virtuo-PHP-Template/main-files/virtuo/assets   →   ./assets
```

Final structure:

```
index.html
assets/
  css/  js/  images/  fonts/  maps/  scss/
```

## 2. Preview

Install the **Live Server** extension (VS Code will prompt you — it's in
`.vscode/extensions.json`), then right-click `index.html` → *Open with Live
Server*.

Or from a terminal:

```bash
npx serve .
```

Don't open `index.html` via `file://`. Some of the template's scripts behave
differently without an HTTP origin.

---

## What changed from the stock template

**Structure**
- All 8 `<?php include ?>` statements inlined — no PHP, no server needed
- Removed the demo-switcher modal (50 KB of ThemeForest marketing)
- Removed the intro/preloader overlay
- Removed the chatbox widget (its form submitted nowhere)
- Removed the portfolio lightbox trigger so project cards link to real sites
- `mailer.php` dropped — it needs PHP, which static hosting won't run
- Template logo replaced with an inline-SVG **DoctorDev** wordmark; favicon is
  now a data URI, so neither needs an asset file

**Content** — all placeholder copy replaced:

| Section | Contents |
|---|---|
| CV card | Rotating roles via the template's `cd-headline` plugin |
| About | Three paragraphs: medicine, ventures, creative work |
| What I Do | 9 cards, three full rows |
| Education | MBBS + 8 certifications, each with a verify link |
| Experience | 6 roles — RAGEC, Doctor WEB, Studio Dark Arts, Med Insight |
| Portfolio | 6 real projects, 2 with live links |
| Brands | New section — 7 clients, 4 linked |
| Writing | 6 post titles (unwritten) |

---

## Before you publish

1. **Contact form** — points at `https://formspree.io/f/YOUR_FORM_ID`.
   Create a free Formspree form and paste the real ID. Until then it won't
   deliver.
2. **Phone and email** — `+94 77 000 0000` and `hello@example.com` appear in
   the CV card, contact section and footer.
3. **CV file** — the download button has `href="#"`. Drop your PDF in and
   point at it.
4. **Social links** — all `#`. Set GitHub, LinkedIn, Instagram, Facebook.
5. **Counters** — the four stats still read `00`. Search `data-count` and set
   real figures, or delete the block.
6. **Images** — everything in `assets/images/` is the template's demo
   photography. Your licence does **not** cover republishing those. Replace
   the portrait, 6 portfolio thumbnails and 6 blog thumbnails with your own.
7. **Blog links** — all six point at `javascript:void(0)`. Write them or
   remove the section.
8. **Missing URLs** — RAGEC, Matha, Kaala Kalaththewa, Athukorala Fashion.
9. **Skill-bar percentages** — invented placeholders. Set them to numbers
   you'd defend, or cut the bars.

---

## Editing notes

The markup nests text five levels deep and puts `<br>` inside headings.
Find-and-replace on the raw HTML corrupts it — an early attempt matched `"the"`
inside other words. If you script changes, parse the DOM (BeautifulSoup,
jsdom, cheerio) rather than using regex.

Section wrappers, in document order:

```
tmp-tab-content-area → tmp-about-area → tmp-resume-area
→ tmp-portfolio-area → tmp-brands-area → tmp-blog-area
→ tmp-contact-area → tmp-footer-area
```

Custom CSS added by me lives in `<style>` blocks at the end of `<head>`:
`.edu-cred-link`, `.tmp-brands-*`, `.dd-logo`. Everything else is the
template's `assets/css/style.css` — avoid editing that file so template
updates stay mergeable.

---

## Licence

ThemeForest **Regular Licence** covers this: one end product, visitors don't
pay for access.

**Keep the repository private.** Committing template source to a public repo
is redistribution and breaches the licence. Private repos deploy fine on both
GitHub Pages and Firebase Hosting.

---

## Deploy

Static, so anywhere works.

**GitHub Pages** — `.nojekyll` is already included. Without it, Jekyll strips
folders starting with `_` and the site breaks in ways that are hard to
diagnose.

```bash
git init && git add . && git commit -m "Initial site"
# push to a PRIVATE repo, then Settings → Pages → main / root
```

**Firebase Hosting**

```bash
firebase init hosting     # public directory: .
firebase deploy
```
