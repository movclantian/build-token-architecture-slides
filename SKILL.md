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

- Choose the dominant form from the architectural relationship: horizontal or vertical flow, responsibility lanes, stacked layers, state transitions, timeline, feedback loop, comparison, dense table or matrix, hub-and-spoke, or one-mechanism annotated diagram.
- For decks with three or more slides, use at least three composition families, avoid repeating the same dominant structure on adjacent slides, and do not turn every page into an identical card grid.
- Vary the title placement, alignment, aspect ratio, visual density, grouping, and dominant visual when the content supports it. Use the theme's visual language to make the variation coherent.
- Keep every variation evidence-grounded. Do not add ornamental nodes, fake states, decorative metrics, or visual motifs that imply architecture facts that do not exist.

## Required workflow

1. Resolve the style source before editing. Read every style, token, theme, preset, and metadata file named by the user; for a bundled theme, read the catalog and every file in the selected theme folder.
2. Read the relevant source code, document, or architecture evidence. Do not invent modules, algorithms, states, or integrations.
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

## Language rules

- Default to Chinese-first wording for Chinese submissions.
- Keep only necessary product, framework, protocol, and file-format names in English.
- Translate internal function names, event names, field names, status values, and long English labels into Chinese.
- Do not use a visible slash as a separator. Use `、`, `与`, `·`, `至`, or `→` according to meaning.
- Do not use long English kickers or English-only card titles.
- Use first-person plural when the surrounding submission is written from the team's perspective.

## HTML behavior

- Render one slide at a time with hash-addressable page numbers.
- Support arrow keys, Page Up, Page Down, Home, End, and click navigation without visible instruction text.
- Scale the active slide to the viewport without clipping.
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
- all requested token sources materially affect the rendered result;
- slide count, orientation count, page labels, and document placeholders agree.

Do not deliver a slide deck that passes static validation but is visibly sparse, scattered, clipped, or illegible.
