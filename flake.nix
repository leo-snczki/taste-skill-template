{
  description = "Project template with the taste-skill Claude Code skill";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    taste-skill = {
      url = "github:leonxlnx/taste-skill";
      flake = false;
    };
  };

  outputs = { nixpkgs, taste-skill, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          # The skill's scripts need Node 22+ and a Chromium-based browser.
          packages = [
            pkgs.nodejs_24
            pkgs.chromium
          ];
          CHROME_PATH = pkgs.lib.getExe pkgs.chromium;

          # Link the skill into the project's .claude/skills (gitignored).
          shellHook = ''
            root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
            mkdir -p "$root/.claude/skills"
            ln -sfn ${taste-skill}/skills/taste-skill "$root/.claude/skills/taste-skill"
          '';
        };
      });
    };
}
