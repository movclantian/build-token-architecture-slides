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

## 18 大核心布局范式 (18 Layout Archetypes)

在构建架构图、演示页与技术文档可视化时，从以下 18 种标准布局范式中选择最契合信息关系与表达目标的构图：

1. **便当盒布局 (Bento Grid)**
   - **视觉特征**：日式便当盒式的不规则网格（CSS Grid `grid-template-areas` 或显式 `col-span`、`row-span`），通过大小不一的卡片组合创造高信息密度的模块化视觉层次。
   - **适用场景**：核心系统全景概览、多模块能力矩阵、全能平台特性大图、多指标综合仪表盘。
   - **截图准则**：主卡片与次级卡片字号建立严格梯度，避免小卡片内部文字过载。

2. **瀑布流布局 (Masonry Flow)**
   - **视觉特征**：不等高卡片流式纵向交错拼合（CSS `columns` 或 `grid-template-rows: masonry`），通过错落高度实现自然流动的视觉节奏。
   - **适用场景**：多模态资源中心预览、异构案例展示、非对称评测证据卡片、探索性创意集合。
   - **截图准则**：列宽保持一致，卡片内部紧凑，避免末尾列大面积悬空造成重心失衡。

3. **分屏布局 (Split Screen)**
   - **视觉特征**：左右对称（50:50）或非对称（60:40）双栏对照，通过空间对立与平衡创造强烈的视觉张力。
   - **适用场景**：破局对比（现实痛点 vs 创新破局）、理论推导 vs 工程实现对照、输入意图 vs 产物交付映射。
   - **截图准则**：左右两栏的内容基线与总高度协同对齐，文本高度相当，避免单侧拖沓。

4. **全屏滚动布局 (Full Page Scroll)**
   - **视觉特征**：单屏充满标准视口（16:9 或黄金比例），无外部滚动条，聚焦独立完整的场景与叙事切片。
   - **适用场景**：章节转折过渡页、宏观愿景与使命陈述、单机制深度沉浸解析、独立答辩汇报页。
   - **截图准则**：确保整页核心元素位于标准安全边界内，外围保留适度呼吸感，零内容裁剪。

5. **垂直时间线布局 (Vertical Timeline)**
   - **视觉特征**：垂直基准轴线贯穿，时间节点或工序节点沿轴线左右交错或单侧依附，串联有序递进。
   - **适用场景**：项目研发演进历程、自适应学习路径推进节点、版本历史迭代、长周期工序时序。
   - **截图准则**：轴线与节点圆环居中垂直对齐，节点标签间距均匀，时间线不中断。

6. **卡片堆叠布局 (Card Stack)**
   - **视觉特征**：卡片前后重叠的立体布局，通过 Z 轴层叠、微量 X/Y 偏移与阴影创造物理深度感与景深。
   - **适用场景**：多层纵深防御与安全策略架构、分层协议栈、历史版本快照回退栈、多任务并发排队。
   - **截图准则**：底层卡片显露特征性标签、状态点或标题边缘，顶层主卡片内容完整展开。

7. **固定侧边栏布局 (Fixed Sidebar)**
   - **视觉特征**：左侧固定导航栏、目录树或上下文元信息，右侧为主工作区、流程画布或核心架构视窗。
   - **适用场景**：系统配置控制台架构、知识库目录管理、工作区实操总控体系、复杂工具调用总控。
   - **截图准则**：侧边栏宽度占比控制在 20% 至 25%，为主内容区保留主导视野。

8. **杂志网格布局 (Magazine Grid)**
   - **视觉特征**：借鉴印刷杂志的多栏排版，主大图或核心卡片跨栏破格，首字下沉与引言穿插，节奏丰富。
   - **适用场景**：学术背景与政策依据解读、重大行业痛点深度剖析、权威实验数据长篇图文解读。
   - **截图准则**：严格双栏或三栏对齐，结合首字下沉与段落缩进（2em），展现典雅出版物质感。

9. **全屏英雄区布局 (Fullscreen Hero)**
   - **视觉特征**：以特大号主标题、精炼定位标语、居中核心架构图或拓扑枢纽为主导，抓住第一视觉焦点。
   - **适用场景**：方案申报封面与首屏、平台核心杀手锏功能发布、标志性技术突破宣发。
   - **截图准则**：主标、副标与系统定位层次鲜明，四周留白舒适，避免琐碎杂乱小元素干扰。

10. **F型布局 (F-Pattern Layout)**
    - **视觉特征**：基于眼动追踪的 F 型阅读动线（顶部水平宽幅扫描、左侧纵向探查、中段次级水平扫描）。
    - **适用场景**：内容密集型技术规格书、多智能体协议接口清单、系统配置审计项、分步排障说明。
    - **截图准则**：顶部横置全局结论，左侧加粗状态或键名，右侧陈列详细参数与解释。

11. **Z型布局 (Z-Pattern Layout)**
    - **视觉特征**：基于眼动追踪的 Z 字折线（左上起点 -> 右上副标 -> 斜穿左下核心机制 -> 右下落地行动）。
    - **适用场景**：着陆页架构、商业模式与推广路径、三大核心破局点串联说明、极简信息展示。
    - **截图准则**：在四个关键转折点锚定高对比度视觉卡片或图标，视线引导连贯顺畅。

12. **圣杯布局 (Holy Grail Layout)**
    - **视觉特征**：经典三栏式结构：顶部页眉 + 三列内容（左侧导航/先修、中间主架构画布、右侧属性监控） + 底部页脚。
    - **适用场景**：工作区与代码实操体系、IDE 研发工作台架构、知识库三位一体交互范式。
    - **截图准则**：中间主列宽度占比大于 50%，两侧辅助栏严整收敛，形成坚固对称秩序。

13. **仪表盘布局 (Dashboard Layout)**
    - **视觉特征**：数据驱动的模块化监控面板，包含顶栏 KPI 指标大字卡、多折线/饼状图表区、拓扑图与最新事件流。
    - **适用场景**：多智能体运行状态看板、学生八维成长画像监控、模型调用开销与吞吐量评测。
    - **截图准则**：关键指标数字特大化（28px 至 36px），卡片边界分明，信息饱和度高。

14. **非对称网格 (Asymmetric Grid)**
    - **视觉特征**：打破传统对称等宽网格，通过不规则的列宽比例（如 7:3、5:3:4）或错位重叠制造视觉张力。
    - **适用场景**：重点突出颠覆性创新模块（大面积呈现核心技术，侧栏收纳支撑技术）、差异化竞品降维对比。
    - **截图准则**：不规则中保持视觉总重量平衡，避免画面失衡或偏坠。

15. **视差滚动 (Parallax Sections)**
    - **视觉特征**：前景卡片与背景网格、渐变光晕以不同层级深度展开，制造多层次物理景深感。
    - **适用场景**：底层基础设施到上层应用的层级穿透、技术演进的三重境界、空间分层系统拆解。
    - **截图准则**：静态截图中通过阴影和半透明材质展现代表性截面，前景高亮、背景收敛。

16. **滚动叙事 (Scrollytelling)**
    - **视觉特征**：Sticky 核心画布钉在视口中央，文字步骤滑动触发画布状态演化（连线点亮、节点变色、数据变形）。
    - **适用场景**：多智能体复杂时序调度推演、端到端学习闭环逐步推演、数据流生命周期分步揭示。
    - **截图准则**：在静态幻灯片中解构为“分阶段状态快照组（阶段 1 -> 阶段 2 -> 阶段 3）”连续呈现。

17. **视差杂志 (Parallax Editorial)**
    - **视觉特征**：暖纸底色，sticky 图文交织，章节编号与优雅的首字下沉，把长内容读成有节奏的翻页。
    - **适用场景**：教育哲学理念、人机协同育人理论基石、重大科研成果的学术化叙事。
    - **截图准则**：保留高质量文字排版呼吸感，文字两端对齐，图注精准细致。

18. **横滚画廊 (Horizontal Gallery)**
    - **视觉特征**：白盒美术馆展线式的横向线性排布，宽阔留白，细边框大图，编号与极细图注还原策展语言。
    - **适用场景**：七大多模态学习资源展墙、UI/交互原型演进系列展、学生优秀创新成果画廊。
    - **截图准则**：单卡片横向比例开阔，图文排版严密还原策展级秩序。

### S-Flow 蛇形折返流特化（S-Flow Serpentine Extension）
对于多阶段工作流或端到端闭环演进（4 至 8 阶段）：
- 强制采用 S-Flow 蛇形折返布局：Row 1 从左至右，Row 2 从右至左，Row 3 从左至右；
- 行与行之间的过渡转折**严禁采用 90 度死板折线**，必须使用圆润平滑的三次或二次贝塞尔平滑曲线（`<path d="M... C... / Q..." fill="none" />`），赋予闭环系统自然流动的工程美感。

### 多页幻灯片构图多样性契约
对于包含三页或以上的幻灯片组，必须在上述 18 种构图范式中选择至少三种不同的构图家族，严禁相邻页面重复相同的主导结构，严禁整套幻灯片退化为单调乏味的同构卡片阵列。

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

## SVG 矢量制图规范 (SVG Vector Visualization Contract)

在表达复杂系统拓扑、多智能体协同、状态机流转与工程管道时，应大力优先采用原生内联 SVG 进行高保真矢量绘制：

1. **拓扑连线与动态流向 (Topological Connectors & Curves)**
   - 跨阶段长流线、S-Flow 蛇形折返转角、分支分流与汇总并线、反馈闭环一律采用 SVG `<path>` 承载；
   - 优先使用平滑圆润的三次贝塞尔曲线（`d="M x1 y1 C cx1 cy1, cx2 cy2, x2 y2"`）或平滑二次曲线（`Q`、`S`），杜绝死板生硬的 90 度直角折线；
   - 虚线流动与辅助反馈线使用 `stroke-dasharray="6 4"` 或 `stroke-dasharray="4 4"` 配合半透明主色，区分强依赖主线与弱依赖审计反馈线。

2. **矢量箭头与端点标记规范 (Markers & Endpoints)**
   - 统一在 `<svg>` 顶部的 `<defs>` 区域声明语义化箭头标记（如 `id="arrow-primary"`, `id="arrow-muted"`, `id="arrow-accent"`）；
   - 标记设置 `viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"`，确保箭头方向与切线方向严格共线；
   - 关键转折节点或分支汇聚点可使用小圆环（`r="3"` 或 `r="4"`）作为锚点端点，强化电路总线感。

3. **矢量节点与架构胶囊 (Vector Nodes & Architectural Capsules)**
   - 核心引擎、智能体节点、决策网关（菱形 `<polygon>`）、总线底座（Busbar）优先使用 SVG 原生矢量图元组合；
   - 节点外框使用 `<rect rx="8" ry="8">` 配合主题语义边框，内部文字使用 `<text text-anchor="middle" dominant-baseline="central">` 精确居中对齐；
   - 状态圆环与进度徽章使用双层 `<circle>`（底层暗轨、表层彩色弧段与百分比文字），制造现代高阶仪表感。

4. **渐变与质感增强 (Theme-Driven Gradients & Textures)**
   - 善用 `<linearGradient>` 与 `<radialGradient>`，通过 `stop-color="var(--primary)"` 注入主题色，制作渐变连线与柔和发光节点；
   - 适度引入低对比度背景辅助网格（`<pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse"><path d="M 20 0 L 0 0 0 20" fill="none" stroke="var(--border)" stroke-opacity="0.25"/></pattern>`），增强工程设计图纸的工业严谨质感。

5. **响应式紧凑外接框契约 (Tight-Box ViewBox Rule)**
   - SVG 的 `viewBox="minX minY width height"` 必须紧凑包裹内部绘制的所有几何图元（仅留 8px 至 16px 安全边距），严禁声明空旷无用的坐标范围；
   - 容器样式必须声明 `width: 100%; height: auto; display: block;`，结合 `preserveAspectRatio="xMidYMid meet"`，确保图表在父级卡片内吃满宽度，根除“小图缩在大卡片中间”的尴尬排版。

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
- an inline SVG lacks a responsive viewBox attribute or uses fixed non-responsive width/height;
- complex multi-node flow diagrams, curved transitions, or state loops are faked with brittle CSS borders rather than clean SVG vector paths;
- style changes are limited to colors while typography, surfaces, borders, shadows, and theme-specific visual grammar are ignored.
