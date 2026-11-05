# Project skills

Claude Code must run inside the devShell (`nix develop`, or direnv with
`use flake`): it links the skill into `.claude/skills/` and puts its tools
on PATH. If the skill is missing, enter the devShell and restart Claude.

- `design-taste-frontend` (taste-skill): art direction for public web
  pages (directions, palettes, type and section blueprints from a
  library of gallery sites) with a browser inspector and a look-and-fix
  loop. Use it to design or restyle a landing page or portfolio.
  Chromium is on PATH and in `CHROME_PATH`.
