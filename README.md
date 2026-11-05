# taste-skill-template

A project with the [taste-skill](https://github.com/leonxlnx/taste-skill) Claude Code skill, Node and Chromium for its scripts.

Template repository: create a project from it with **Use this template** on
GitHub, then:

```sh
direnv allow   # or: nix develop
claude
```

The devShell links the skill from the Nix store into `.claude/skills/`
(gitignored). The input follows the skill repo's main branch: the `flake.lock`
that `nix develop` creates pins the commit, and `nix flake update` moves it.
To stay on a release, add its tag to the input URL in `flake.nix`.

