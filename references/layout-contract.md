# Layout Contract

## Content density

- Give each slide one architectural claim, not one feature name.
- Include the main flow or relationship plus at least one of: state model, data boundary, algorithm, failure path, permission rule, or persistence result.
- Target roughly 300 to 750 visible Chinese characters per slide unless the visual itself carries equivalent information.
- Use a primary card only when it contains a heading and either two meaningful bullets or one complete explanatory paragraph.
- Render short statuses, names, and categories as labels, tags, table cells, or inline steps rather than large cards.
- Keep small compact nodes subordinate to a larger flow. Never let a compact node become the page's dominant surface.

## Grouping

- Cluster each related set as one visual unit.
- Use fixed gaps inside a group. Center or start the whole group within the available region.
- Do not distribute remaining height between cards.
- Do not use `justify-content: space-between` on diagram content containers.
- Do not use `flex: 1`, `height: 100%`, or large fixed minimum heights on cards.
- Do not use equal fractional grid rows for content of different lengths.
- Use `height: auto` or `height: fit-content` for cards and `align-items: start` for variable-height rows.
- In split layouts, center the two column groups vertically and keep each column internally packed.
- Keep the footer at the slide edge; do not use the content cards to fill the distance to it.

## Composition selection

Choose the structure from the relationship:

| Relationship | Preferred composition |
| --- | --- |
| Ordered execution | Horizontal or vertical flow with arrows |
| Multi-stage lifecycle or closed loop (4-8 steps) | S-Flow serpentine multi-row pipeline with smooth Bézier curves |
| Parallel responsibilities | Aligned lanes or compact columns |
| Layers and boundaries | Stacked bands with explicit communication edges |
| State changes | State sequence with triggers and outcomes |
| Alternatives | Symmetric comparison with shared criteria |
| Many exact mappings | Dense table or matrix |
| Feedback loop | Main flow plus a clearly labeled return path |
| Mixed fixed and dynamic systems | Two packed groups with a shared foundation |
| Time-ordered milestones | Timeline or numbered progression |
| Central owner with bounded dependencies | Hub-and-spoke with labeled edges |
| One mechanism with supporting evidence | Annotated diagram with callouts |

Avoid a uniform card grid when the underlying relationship is sequential, hierarchical, or cyclical.

For multi-stage workflows or closed loops (4 to 8 stages), use an S-Flow serpentine layout: Row 1 Left-to-Right, Row 2 Right-to-Left, Row 3 Left-to-Right. Inter-row connectors MUST use smooth, rounded cubic or quadratic Bézier curves (`<path d="..." fill="none" />`) rather than rigid 90-degree polygonal corners.

For decks with three or more slides, use at least three composition families and avoid repeating the same dominant structure on adjacent slides. Keep the variation tied to the information structure and the selected theme's visual grammar rather than adding decoration.

## Aspect ratio & screenshot legibility

- Use 1600 by 900 for broad flows, layered systems, comparisons, and multi-lane execution.
- Use 900 by 1200 for long pipelines, state sequences, ingestion flows, and vertically ordered logic.
- Keep the title region compact and reserve most area for the diagram.
- **Word-ready screenshot legibility**: Slides are primarily captured as screenshots for reports and proposals. Keep typography large (body 14px-18px, titles 18px-24px) by restricting card copy to essential architectural logic and key states, leaving narrative elaboration for document text.
- **Compress container padding**: Eliminate redundant nested padding in card containers housing SVG diagrams or canvas grids (use `padding: 4px - 10px` on SVG wrappers) so the visual diagram maximizes its canvas footprint without being shrunk by excessive outer whitespace.
- **Omit low-level code citation noise**: Do not print line numbers, test case file paths, or trivial implementation paths on cards unless the slide is explicitly a code inventory.
- **No interactive widget bloat**: Do not place floating zoom controls, custom scale buttons, or extraneous UI widgets on the presentation canvas. Native browser zoom handles scaling cleanly.
- Keep all essential text readable after the page is pasted into Word.
- Do not shrink text to compensate for excess content. Split the slide when necessary.

## Styling from tokens

- Map tokens into semantic roles: page, text, surface, border, primary accent, secondary accents, shadow, radius, and typography.
- Keep structural borders and arrows neutral unless the token system explicitly assigns semantic colors.
- Pair filled surfaces with their corresponding foreground token.
- Verify foreground contrast after later CSS rules; source order must not make text and surface colors identical.
- Use accent colors to encode stages or categories, not as unrelated decoration.
- Preserve the supplied radius and shadow character unless it harms legibility.

## Chinese architecture wording

- Prefer `用户标识` over internal names such as `resourceId`.
- Prefer `运行标识` over `runId`.
- Prefer `完成、部分完成、失败` over raw status enums.
- Prefer `工具输入与执行结果` over raw message-part names.
- Prefer `知识库与联网检索` over abbreviations in presentation text.
- Keep framework names only when they explain an actual architectural boundary.
- Replace visible slash separators with Chinese punctuation or relationship words.
- Do not use mechanical document section numbers (such as `1.1`, `1.1.1`, `2.3`) in titles, badges, or card labels; extract semantic, conceptual headings.
- Never output theme or design-language self-descriptions (e.g., `设计语言：Neo-Brutalist`, `Tailwind Preset`) as text content on user-facing slides.
- Use standard Chinese first-line paragraph indentation (`text-indent: 2em;`) with justified alignment (`text-align: justify;`) for descriptive and analytical text.
- Use domain-appropriate terminology; avoid misleading jargon (e.g., avoid "断点" when referring to pain points or dilemmas).

## Rejection conditions

Reject and revise any slide when one of these is true:

- a colored card is mostly empty;
- cards are separated by large unexplained gaps;
- the page looks like a feature list rather than an architecture explanation;
- a large card contains only a title and one short phrase;
- English implementation identifiers dominate the visual;
- arrows imply a sequence that the text does not support;
- a footer or dark surface contains invisible text;
- text wraps into neighboring elements or is clipped;
- browser zoom changes but the slide size remains visually unchanged because viewport-fit logic rescales it back;
- the slide uses rigid pixel letterbox scaling that treats the page as an inflexible static box rather than supporting fluid responsive reflow on browser zoom;
- the slide visibly displays theme or design-style self-descriptions (e.g., `设计语言：Neo-Brutalist`);
- titles, kickers, or card headers contain mechanical section numbers like `1.1` or `1.1.1`;
- Chinese descriptive paragraphs lack standard 2-character first-line indentation (`text-indent: 2em;`);
- the design claims to use token files that do not affect rendered CSS;
- the same layout is repeated despite different information structures.
- three or more slides collapse into the same dominant composition when their information structures differ;
- a 4+ step end-to-end pipeline is squished into an unreadable single horizontal row;
- sharp 90-degree polygonal elbows are used between pipeline rows instead of smooth, rounded Bézier curves;
- an SVG diagram or canvas is severely shrunken due to excessive nested card paddings;
- cards are stuffed with narrative walls of text that force typography below screenshot legibility thresholds;
- cards are cluttered with low-level source-code line numbers or file citation lists that crowd architectural diagrams;
- non-presentation interactive UI controls (such as custom zoom buttons or floating toolbars) are rendered on the slide;
- style changes are limited to colors while typography, surfaces, borders, shadows, and theme-specific visual grammar are ignored.
