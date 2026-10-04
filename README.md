# Skills

A curated repository of production-ready, open-standard AI agent skills and automation tools. Compatible across **Claude Code**, **Hermes Agent**, **Google Antigravity**, **Cursor**, **OpenCode**, **Codex**, or standalone terminal CLI execution.

---

## Skills Catalog

| Category | Skill | CLI Tool | Description | Status |
| :--- | :--- | :--- | :--- | :---: |
| **Media** | [`nuclear-playlist-importer`](./skills/media/nuclear-playlist-importer/) | `nuclear-import-playlist` | Direct YouTube playlist ingestion into Nuclear Music Player with zero manual UI interaction | **Stable** |
| **SecOps** | [`secops/`](./skills/secops/) | *Various* | Security automation, IOC extraction, and detection engineering skills | *Roadmap* |
| **DevOps** | [`devops/`](./skills/devops/) | *Various* | Linux system administration, service sandboxing, and infrastructure tools | *Roadmap* |

---

## Universal Agent Compatibility

All skills in this repository follow the standard **Agent Skills Specification** (`SKILL.md` with structured YAML frontmatter). They can be dropped or linked into any leading agent framework:

- **Google Antigravity**: Symlink skill folder to `~/.gemini/config/skills/<skill-name>`
- **Hermes Agent**: Symlink skill folder to `~/.hermes/skills/<skill-name>`
- **Claude Code**: Symlink skill folder to `~/.claude/skills/<skill-name>` or repo `.claude/skills/`
- **Cursor / OpenCode / Codex**: Point workspace instructions to the relevant `SKILL.md`
- **Standalone CLI**: Executable directly from bash / zsh without an AI agent

---

## Quick Start & Installation

### Option 1: Install All Skills
```bash
git clone https://github.com/HuggingBunny/Skills.git
cd Skills
./install.sh
```

### Option 2: Install a Specific Skill
```bash
./install.sh nuclear-playlist-importer
```

The installer:
1. Copies executable CLI binaries to `${HOME}/.local/bin/` (ensures tools can be executed directly).
2. Auto-detects local agent directories (`~/.gemini/config/skills`, `~/.claude/skills`, `~/.hermes/skills`) and symlinks the skill specifications.

---

## Repository Structure

```
Skills/
├── install.sh                       # Universal installer for CLI tools and agent links
├── README.md                        # Catalog and documentation
└── skills/
    ├── media/
    │   └── nuclear-playlist-importer/
    │       ├── SKILL.md             # Standard agent skill prompt & instructions
    │       ├── README.md            # Standalone documentation
    │       ├── install.sh           # Skill-specific installer
    │       └── scripts/
    │           └── nuclear-import-playlist # Portable Python automation script
    ├── secops/                      # Security & detection skills
    └── devops/                      # Infrastructure & system skills
```

---

## Contributing a New Skill

1. Create a folder under the appropriate category: `skills/<category>/<skill-name>/`.
2. Include a `SKILL.md` with:
   - YAML frontmatter: `name` and `description`.
   - Clear procedural agent instructions.
3. Bundle helper scripts under `scripts/`. **Never hardcode user directories** (`/home/...`); use dynamic resolution and standard environment variables.
4. Add an `install.sh` and `README.md`.

---

## License

MIT License. See individual skill subdirectories for specific tool notices.
