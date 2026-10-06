# my-humanize

An agent skill that finds and removes the tells of AI-generated writing. Its catalog comes from
Wikipedia's [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)
field guide (WikiProject AI Cleanup). The same skill runs in Claude Code (`/my-humanize`) and in
Hermes.

It is named `my-humanize` so it doesn't collide with Hermes's bundled `humanizer` skill. This
one is meant to be iterated on.

## Layout

| Path | What it holds |
| --- | --- |
| `skills/my-humanize/SKILL.md` | The skill, with Claude Code frontmatter: workflow, pattern catalog, caveats |
| `skills/my-humanize/references/signs-of-ai-writing.md` | Fuller distilled notes from the source page, with attribution |
| `hermes/my-humanize.yaml` | Hermes frontmatter, which replaces the Claude Code block on the VPS |
| `scripts/install-claude.sh` | Symlinks every skill into `~/.claude/skills` |
| `scripts/deploy-hermes.sh` | Builds each skill from `HEAD` with its Hermes frontmatter, installs it on the VPS (`creative` category), and lints it |
| `CHANGELOG.md` | Version history |

## Install

```bash
git clone https://github.com/sapmb20/my-humanize-skill.git
cd my-humanize-skill
scripts/install-claude.sh          # Claude Code: ~/.claude/skills/my-humanize -> repo
scripts/deploy-hermes.sh           # Hermes VPS (HERMES_HOST, HERMES_CATEGORY override)
```

Other agents can use the skill directly: copy `skills/my-humanize/` into the agent's skills folder.

## Iterating

1. Edit `skills/my-humanize/SKILL.md`. Put long material in `references/` and point to it from
   SKILL.md.
2. To refresh from the source page, re-scrape it and diff it against the reference notes. Word lists
   drift with each model era.
   ```bash
   firecrawl scrape "https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing" -o .firecrawl/signs.md
   ```
   `.firecrawl/` is gitignored.
3. Bump `version` in `hermes/my-humanize.yaml` and add a `CHANGELOG.md` entry.
4. Commit and push, then run `scripts/deploy-hermes.sh`. The deploy builds from `HEAD`, so
   uncommitted edits don't ship. The Claude Code copy is a symlink and updates immediately.

## License

CC BY-SA 4.0, because this is an adaptation of Wikipedia content. See `LICENSE`.
