param(
  [Parameter(Mandatory = $true)]
  [string]$Path,
  [int]$MinimumSlideText = 260
)

$resolvedPath = (Resolve-Path -LiteralPath $Path).Path
$raw = Get-Content -Raw -LiteralPath $resolvedPath
$errors = [System.Collections.Generic.List[string]]::new()

function Get-VisibleText {
  param([string]$Markup)
  $withoutStyle = [regex]::Replace($Markup, '(?is)<style\b.*?</style>', ' ')
  $withoutScript = [regex]::Replace($withoutStyle, '(?is)<script\b.*?</script>', ' ')
  $withoutTags = [regex]::Replace($withoutScript, '(?is)<[^>]+>', ' ')
  $decoded = [System.Net.WebUtility]::HtmlDecode($withoutTags)
  return [regex]::Replace($decoded, '\s+', ' ').Trim()
}

$openSections = ([regex]::Matches($raw, '<section\b')).Count
$closeSections = ([regex]::Matches($raw, '</section>')).Count
$openArticles = ([regex]::Matches($raw, '<article\b')).Count
$closeArticles = ([regex]::Matches($raw, '</article>')).Count
$openDivs = ([regex]::Matches($raw, '<div\b')).Count
$closeDivs = ([regex]::Matches($raw, '</div>')).Count

if ($openSections -ne $closeSections) { $errors.Add("section 标签不平衡：$openSections 对 $closeSections") }
if ($openArticles -ne $closeArticles) { $errors.Add("article 标签不平衡：$openArticles 对 $closeArticles") }
if ($openDivs -ne $closeDivs) { $errors.Add("div 标签不平衡：$openDivs 对 $closeDivs") }

$slides = [regex]::Matches($raw, '(?is)<section\b[^>]*class="[^"]*\bslide\b[^"]*"[^>]*>.*?</section>')
if ($slides.Count -eq 0) { $errors.Add('未找到 class="slide" 的页面') }

$visibleText = Get-VisibleText $raw
if ($visibleText.Contains('/')) { $errors.Add('可见文案包含斜杠，请改用中文标点或关系词') }
if ($visibleText -match '设计语言\s*[:：]|设计风格\s*[:：]|Tailwind\s*Preset|Neo-Brutalist\s*硬核') {
  $errors.Add('可见文案包含了设计风格自身的元信息说明（如“设计语言：...”），请聚焦于业务与架构内容本身，不要把排版风格名称打印在幻灯片上')
}
if ($raw -match '(?is)<button\b[^>]*(?:id|class)=["''][^"'']*(?:zoom|scale)[^"'']*["''][^>]*>') {
  $errors.Add('页面包含非演示性的缩放/比例交互控件，请移除临时交互插件，保持截图版面纯粹，依靠浏览器原生缩放')
}

$svgTags = [regex]::Matches($raw, '(?is)<svg\b[^>]*>')
foreach ($svg in $svgTags) {
  if ($svg.Value -notmatch '(?i)\bviewBox\s*=') {
    $errors.Add('发现未声明 viewBox 的 svg 元素，请务必声明 viewBox 以确保矢量图形的自适应缩放与高清响应式表现')
  }
}

if ($raw -match '(?is)\.diagram\s*\{[^}]*justify-content\s*:\s*space-between') {
  $errors.Add('diagram 使用 space-between，会把内容组分散到大面积空白中')
}
if ($raw -match '(?is)\.grow\s*\{[^}]*flex\s*:\s*1(?:\s|;|})') {
  $errors.Add('grow 使用 flex: 1，会强制拉伸内容区域')
}
if ($raw -match '(?is)\.(?:node|stage|lane|note|metric|codebox)[^{]*\{[^}]*height\s*:\s*100%') {
  $errors.Add('卡片使用 height: 100%，会产生大面积内部空白')
}
if ($raw -match '(?is)grid-template-rows\s*:\s*repeat\([^;]*minmax\(\s*0\s*,\s*1fr\s*\)') {
  $errors.Add('网格使用等高分数行，会强制不同内容卡片等高')
}

for ($index = 0; $index -lt $slides.Count; $index++) {
  $slide = $slides[$index].Value
  $titleMatch = [regex]::Match($slide, 'data-title="([^"]+)"')
  $title = if ($titleMatch.Success) { $titleMatch.Groups[1].Value } else { "第 $($index + 1) 页" }
  if ($title -match '^(\d+\.)+\d*') {
    $errors.Add("$title 标题包含机械章节编号（如 1.1、1.1.1），请改为精炼的概念或架构主题")
  }
  $text = Get-VisibleText $slide
  if ($text.Length -lt $MinimumSlideText) {
    $errors.Add("$title 可见文本仅 $($text.Length) 字符，内容过于稀疏")
  }

  $cards = [regex]::Matches($slide, '(?is)<(article|div)\b[^>]*class="[^"]*\b(node|stage|lane|note|metric|codebox)\b[^"]*"[^>]*>(.*?)</\1>')
  foreach ($card in $cards) {
    $cardText = Get-VisibleText $card.Groups[3].Value
    $isCompact = $card.Value -match 'class="[^"]*\bcompact\b'
    $minimumCardText = if ($isCompact) { 8 } else { 18 }
    if ($cardText.Length -lt $minimumCardText) {
      $errors.Add("$title 存在稀疏卡片：$cardText")
    }
  }
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output "验证通过：$($slides.Count) 页，HTML 结构、文本密度与紧凑布局规则均符合要求。"
