---
name: build-token-architecture-slides
description: Build or revise screenshot-ready Chinese HTML architecture diagrams, implementation-principle slides, and Word-ready illustration pages from user-provided or bundled CSS, JSON, JavaScript, Tailwind, or theme token packages. Use when the user asks to apply a project style or a bundled visual theme to architecture visuals, PPT-like HTML pages, technical principle diagrams, system flows, module diagrams, or a mixed landscape and portrait visual deck, especially when dense content, compact grouping, Chinese-first labels, and reliable screenshot layout are required.
---

# Build Token Architecture Slides

Create architecture visuals from real project facts while treating the supplied token files as the visual source of truth.

## Built-in style package

Use the bundled themes under [assets](assets). Read [assets/styles-overview.md](assets/styles-overview.md) to select a theme. Each theme folder is named by a stable slug and contains:

- `{slug}-globals.css`
- `{slug}-variables.css`
- `{slug}-tokens.json`
- `{slug}-shadcn-theme.json`
- `{slug}-tailwind-preset.js`

Resolve a user-named theme to its exact folder and read all five files before implementation. When the user supplies local style files, treat those files as authoritative; use a bundled theme when the user names one or when no local token source is supplied. If neither is named, select the closest bundled theme from the catalog and use its slug in the slide inventory.

## Style-template behavior

Treat the selected style package as both a token source and a visual grammar. Reuse its typography hierarchy, border and radius language, shadow character, surface treatment, accent behavior, and theme-specific selectors or effects. Do not reduce a theme to a background color and a palette.

- **18 大核心布局范式 (18 Layout Archetypes)**: Choose the dominant layout structure from the 18 standard archetypes in [references/layout-contract.md](references/layout-contract.md):
  1. **Bento Grid (便当盒)**: High-density modular overviews, multi-capability matrices, flagship feature overviews.
  2. **Masonry Flow (瀑布流)**: Heterogeneous multi-modal assets, variable-height evidence items, resource galleries.
  3. **Split Screen (分屏)**: 50:50 or 60:40 dual-paradigm comparisons (pain points vs solutions, theory vs engineering).
  4. **Full Page Scroll (全屏滚动)**: Chapter openers, monumental vision statements, self-contained mechanism spotlights.
  5. **Vertical Timeline (垂直时间线)**: Milestone progressions, historical evolution, linear phase advances.
  6. **Card Stack (卡片堆叠)**: Multi-layer defense and security tiers, protocol stacks, LIFO state snapshots.
  7. **Fixed Sidebar (固定侧边栏)**: Workspace consoles, knowledge-base file trees, administrative dashboards.
  8. **Magazine Grid (杂志网格)**: Academic context, policy or pedagogical rationale, deep-dive analytical exposés.
  9. **Fullscreen Hero (全屏英雄区)**: Project covers, flagship mechanism announcements, high-impact focal points.
  10. **F-Pattern (F型布局)**: Text-dense technical specs, agent tool schemas, step-by-step troubleshooting protocols.
  11. **Z-Pattern (Z型布局)**: Landing slides, value-proposition flows, commercialization and outreach routes.
  12. **Holy Grail (圣杯布局)**: 3-column workspaces, IDE execution views, triadic interactive systems.
  13. **Dashboard (仪表盘)**: Multi-agent health status, KPI metric cards, student profile radar and analytics.
  14. **Asymmetric Grid (非对称网格)**: Highlighting breakthrough core engines against secondary support modules.
  15. **Parallax Sections (视差滚动)**: Layered infrastructure penetration, deep technical hierarchy snapshots.
  16. **Scrollytelling (滚动叙事)**: Step-by-step mechanism execution snapshots, staged state machine state changes.
  17. **Parallax Editorial (视差杂志)**: Academic philosophy, human-in-the-loop pedagogical rationale, book-like layouts.
  18. **Horizontal Gallery (横滚画廊)**: Multi-modal resource showcases, prototype exhibition walls, curated galleries.
- **S-Flow serpentine multi-row pipeline**: For long sequential workflows or closed-loop pipelines (4 to 8 stages, such as end-to-end lifecycle loops), avoid forcing all steps into a single ultra-wide horizontal row that becomes unreadable when screenshotted. Break the pipeline into a 2-row or 3-row serpentine flow (Row 1 Left-to-Right, Row 2 Right-to-Left, Row 3 Left-to-Right).
- **Smooth Bézier curve connectors**: Inter-row transition paths in an S-Flow MUST use smooth, rounded cubic or quadratic Bézier curves (`<path d="M... C... / Q..." fill="none" stroke="..." />` with generous radius) rather than rigid 90-degree polygonal corners. The transition must convey a continuous, natural cyclical or evolutionary momentum.
- For decks with three or more slides, use at least three composition families, avoid repeating the same dominant structure on adjacent slides, and do not turn every page into an identical card grid.
- Vary the title placement, alignment, aspect ratio, visual density, grouping, and dominant visual when the content supports it. Use the theme's visual language to make the variation coherent.
- Keep every variation evidence-grounded. Do not add ornamental nodes, fake states, decorative metrics, or visual motifs that imply architecture facts that do not exist.

## Required workflow

1. Resolve the style source before editing. Read every style, token, theme, preset, and metadata file named by the user; for a bundled theme, read the catalog and every file in the selected theme folder.
2. Read the relevant source code, document, or architecture evidence thoroughly before drafting. Ground all entities in actual repository codebase definitions (classes, state machines, workflow steps, database schemas) rather than high-level conversational summaries. Do not invent modules, algorithms, states, or integrations.
3. Read [references/layout-contract.md](references/layout-contract.md) completely before composing or revising slides.
4. Build a slide inventory before writing HTML. Assign one architectural question, one main relationship, one composition family, and one conclusion to each slide.
5. Choose landscape or portrait per slide from content shape. Do not force the whole deck into one aspect ratio.
6. Check the inventory for deck-level composition variety before writing HTML. For three or more slides, use at least three distinct composition families and avoid adjacent repeats.
7. Implement the HTML with the supplied tokens, then run `scripts/validate_slides.ps1`.
8. Inspect every slide visually when repository instructions permit it. Otherwise perform the static checks in this skill and report that visual inspection was not run.

## Adapt arbitrary token sets

- Link supplied CSS files directly when they are browser-ready.
- Parse JSON theme files and JavaScript or Tailwind presets with structured tooling. Map their actual color, font, radius, border, spacing, and shadow values into semantic CSS variables.
- Treat bundled `globals.css` and `variables.css` as token sources, not automatically browser-ready CSS: they may contain Tailwind `@apply` and `@layer`. Do not link uncompiled files into the final standalone HTML; inline the derived CSS or use a compiled stylesheet only when a build toolchain is available.
- Use the bundled `tokens.json` for raw design values, `shadcn-theme.json` and `variables.css` for semantic roles and light or dark variants, `tailwind-preset.js` for typography and utility cues, and `globals.css` for theme-specific selectors and effects.
- Trace every named token source to rendered styles. Listing a filename in metadata does not count as using it.
- Preserve the token set's identity while keeping text contrast, hierarchy, and screenshot legibility.
- Do not create a parallel hard-coded palette when equivalent tokens exist.
- Keep layout rules independent from visual tokens so a later token set can replace the theme without rebuilding slide structure.

## Derive architecture content

- Explain input, processing, state, output, failure handling, and data ownership where they materially exist.
- Separate model judgment from deterministic code, user confirmation, and persistence.
- Prefer flows, lanes, matrices, staged pipelines, boundaries, and state transitions over decorative card collections.
- Use exact implementation facts but translate internal identifiers into readable architecture language.
- Include a concise conclusion on every slide that states why the mechanism matters.
- **Card copy brevity vs. typography scale**: Keep card copy concise and high-signal. Do not dump lengthy narrative paragraphs into architecture cards; the accompanying proposal or report carries the narrative text, while the visual artifact provides structural clarity and mental models. Restricting card copy allows typography to remain comfortably large (e.g. 14px-18px body, 18px-24px subheads) and crisp when screenshotted into Word or PDF documents.
- **No low-level code citation noise**: Do not crowd architecture cards with code line numbers or raw source paths (e.g., `src/foo/bar.ts:L123-145`, unit test file paths) unless the slide is explicitly a file-tree or repo inventory diagram. Focus on architecture roles, contracts, and mechanisms.
- **Visual-document synergy**: Treat the visual slide and the document text as complementary partners. The slide provides the structural mental model, flow topology, and key states; the report text provides in-depth rationale, user value, and empirical verification.

## Language rules

- Default to Chinese-first wording for Chinese submissions.
- Keep only necessary product, framework, protocol, and file-format names in English.
- Translate internal function names, event names, field names, status values, and long English labels into Chinese.
- Do not use a visible slash as a separator. Use `、`, `与`, `·`, `至`, or `→` according to meaning.
- Do not use long English kickers or English-only card titles.
- Use first-person plural when the surrounding submission is written from the team's perspective.
- **No mechanical section numbers**: Do not carry over mechanical document numbering (such as `1.1`, `1.1.1`, `2.3.4`) into slide titles, kickers, or card headers. Extract and present core conceptual, thematic, or narrative headings instead.
- **No theme self-description meta-labels**: Never display the theme or design style name (e.g., `设计语言：Neo-Brutalist`, `设计风格：极简主义`, `Tailwind Preset`) as text content on user-facing slides. Apply the visual grammar to present the user's domain content, but do not talk about the design style itself.
- **Chinese typography & first-line indentation**: When presenting Chinese analytical paragraphs, problem descriptions, and narrative explanations, use standard 2-character first-line indentation (`text-indent: 2em;`) with justified alignment (`text-align: justify;`) and comfortable line-height (`1.5` to `1.65`).
- **Domain-appropriate terminology**: Avoid misleading computer/debugger jargon like "断点" (breakpoint) when describing business, pedagogical, or system bottlenecks. Use precise domain terms such as "痛点", "困境", "壁垒", "瓶颈", "挑战".

## First-class SVG vector architecture (SVG 矢量架构准则)

Proactively leverage inline SVG as a primary visual vehicle for architecture diagrams, flows, state machines, and topological connections:

- **Vector-first for screenshot clarity**: Raster images and pure CSS border tricks degrade or misalign when screenshotted and pasted into Word or PPT. Inline SVG preserves infinite crispness, anti-aliased curves, and exact sub-pixel alignment at any display scaling or zoom.
- **Topological connectors over CSS borders**: Use SVG `<path>` with cubic (`C`) or quadratic (`Q`) Bézier curves for all inter-node arrows, S-Flow serpentine transitions, feedback loops, and branch or merge junctions.
- **Semantic markers and endpoints**: Use `<defs><marker>` to define theme-aware arrowheads (`orient="auto"`, `markerUnits="userSpaceOnUse"` or `strokeWidth`), directional dots, and pulse indicators that match token colors (`fill="var(--primary)"`, `stroke="var(--border)"`).
- **Rich architectural nodes**: Use SVG shapes (`<rect rx="..." ry="...">`, `<circle>`, `<polygon>`, `<g>`) with gradient fills (`<linearGradient>`), subtle borders, and nested `<text>` / `<foreignObject>` for high-density components (e.g. state nodes, decision diamonds, busbars, capsules).
- **Responsive viewBox containment**: Every SVG diagram MUST declare a tight `viewBox="0 0 W H"`, `width="100%"`, `height="auto"`, and `preserveAspectRatio="xMidYMid meet"`. The viewBox bounds must hug the visual elements tightly with zero excess outer whitespace, preventing graphics from appearing small inside cards.
- **Token-bound styling**: Never hardcode colors in SVG elements when theme tokens exist. Use `var(--primary)`, `var(--muted-foreground)`, `var(--card)`, `var(--border)`, `var(--accent)` directly in `fill`, `stroke`, and gradient stops.

## HTML behavior

- Render one slide at a time with hash-addressable page numbers.
- Support arrow keys, Page Up, Page Down, Home, End, and click navigation without visible instruction text.
- **Fluid responsive layout over rigid canvas**: Avoid hardcoded pixel letterboxing (e.g., `width: 1600px; height: 900px; position: absolute; overflow: hidden;` with artificial black borders on body). Construct the slide as a fluid, responsive document container (`max-width: 1540px / 1600px; width: 100%; margin: 0 auto; height: auto;`).
- **Content-driven height & native browser zoom**: Let container height be content-driven (`height: auto; min-height: fit-content;`). Allow browser zoom (`Ctrl + +` / `Ctrl + -`) to reflow and scale typography and cards naturally, without shrinking, clipping, or letterbox-scaling the entire canvas like an image.
- **Responsive reflow grid**: Use responsive CSS grids or media queries so columns naturally adapt and wrap when zoomed in or on narrower displays, guaranteeing zero clipping and zero overflow.
- **Zero redundant container padding for SVG and diagrams**: Minimize nested padding inside cards housing SVG diagrams, canvas regions, or matrix tables (e.g. use `padding: 4px - 10px` on SVG wrappers). Maximize the graphic's footprint so diagrams are not rendered tiny within unnecessarily deep card borders.
- **No interactive widget bloat**: Do not inject floating zoom buttons, custom scale toolbars, or extraneous interactive controls onto the slide canvas. Slides must remain pure, clean, and distraction-free for static screenshotting. Native browser zooming handles scaling without UI interference.
- Keep print rules available, but optimize first for direct screenshot capture.
- Keep the final HTML self-contained or use output-relative compiled assets; never leave references to the external source directory or the skill's absolute installation path.
- Do not place Tailwind utility classes in final HTML unless the output includes the build step that resolves them.
- Do not use Mermaid unless the user explicitly overrides this skill.
- Do not place architecture visuals inside decorative browser mockups or nested cards.

## Quality gate

Run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate_slides.ps1 -Path <absolute-html-path>
```

Fix every reported error before delivery. Then verify:

- every slide is dense enough to explain a mechanism rather than name features;
- presentation forms vary across the deck when the information structures differ;
- cards use content-driven height and remain clustered as a coherent group;
- no card contains unexplained large blank areas;
- no content group is scattered by `space-between`, equal-height rows, or card-level growth;
- black or colored surfaces retain readable foreground text;
- titles, arrows, labels, cards, footers, and page numbers do not overlap or clip;
- changing browser zoom visibly changes the slide scale instead of being canceled by viewport-fit logic;
- all requested token sources materially affect the rendered result;
- slide count, orientation count, page labels, and document placeholders agree.

Do not deliver a slide deck that passes static validation but is visibly sparse, scattered, clipped, or illegible.
