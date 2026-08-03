# build-token-architecture-slides

这是一个用于生成与修订**架构可视化 HTML 页面**的技能型仓库，核心目标是：

- 基于真实代码或文档事实构建架构说明页
- 以主题 token（CSS / JSON / Tailwind preset 等）作为视觉来源
- 输出适合截图、演示与文档嵌入（如 Word）的页面

## 仓库分析（结构与职责）

### 1. `SKILL.md`
仓库主说明文件，定义了该技能的使用范围、工作流程、版式要求、中文文案规则与质量门禁。

### 2. `assets/`
内置视觉主题库，包含大量风格目录（约 125 个）。每个主题目录通常包含：

- `*-globals.css`
- `*-variables.css`
- `*-tokens.json`
- `*-shadcn-theme.json`
- `*-tailwind-preset.js`

并通过 `assets/styles-overview.md` 提供风格总览。

### 3. `references/layout-contract.md`
版式契约，约束内容密度、分组方式、构图类型、纵横比、中文表达与拒收条件，用于保证页面可读性与信息完整度。

### 4. `scripts/validate_slides.ps1`
静态校验脚本，用于检查：

- HTML 标签结构平衡
- 是否存在 `class="slide"` 页面
- 可见文案是否包含斜杠 `/`
- 文本密度与卡片内容稀疏问题
- 若干容易导致布局空洞的 CSS 写法

## 典型使用流程

1. 选择主题来源（用户提供或 `assets/` 内置主题）
2. 阅读并映射 token 与主题语义
3. 依据真实实现事实设计每页架构关系
4. 按 `layout-contract` 组织页面结构与中文文案
5. 运行校验脚本并修正问题

## 校验命令

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate_slides.ps1 -Path <HTML绝对路径>
```

## 适用场景

- 技术架构说明页
- 系统流程与状态转换图
- 模块边界与职责拆解图
- 面向截图交付的演示型 HTML 文档

---

如果你准备在此仓库基础上继续扩展，建议先阅读：

1. `SKILL.md`
2. `references/layout-contract.md`
3. 目标主题目录下的全部 token 文件
