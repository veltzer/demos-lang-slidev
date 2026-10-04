# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `rsconstruct.toml:44` - nothing ever renders the Slidev decks: only rumdl lints `slidev/`, while `package.json:3-5` installs `@slidev/cli`, `@slidev/theme-default` and `playwright-chromium` for no consumer. A broken deck (bad frontmatter, failed mermaid/KaTeX render) passes CI. Enable rsconstruct's `slidev` processor with `src_dirs = ["slidev"]` so every deck is built (export) in CI.

## Medium

- `moved/` - 17 Marp decks (`marp: true`, `theme: gaia`, Marp-only directives) left over from a move to `demos-lang-marp`. Seven are byte-identical to `demos-lang-marp/marp/*` (comments, footer, header, math, mathjax, paginate, vscode_completion_test); six differ (chart, jpg_inside_pdf, jpg_scaled_correct, latex, marp_equals_true, theme_gaia); four exist only here (demo, mermaid, numbered_list, svg). Merge the differing and missing ones into demos-lang-marp, then delete `moved/`, `images/example.jpg` (only used by `moved/jpg_*.md`) and the `moved` entries in `rsconstruct.toml:39,45`.
- `doc/LINKS.txt:1-6` - every link is about Marp (marp.app, marp-cli, marp-vscode), none about Slidev. Replace with Slidev links (sli.dev, @slidev/cli) or move the file to demos-lang-marp.
- `config/project.lua:3` - KEYWORDS lists "marp" and "powerpoint", which describe the moved Marp content, not this repo. Drop them once `moved/` is gone.

## Low

- `rsconstruct.toml:39` - `src_exclude_dirs = ["moved", "slidev"]` on `rumdl.prose` is a no-op, since that instance only takes `src_files = ["README.md"]`; remove the line.
- `moved/jpg_scaled_correct.md:2` - typo "stetch" (stretch); fix it in the copy that ends up in demos-lang-marp.
