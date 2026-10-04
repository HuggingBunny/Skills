# Nuclear Playlist Importer

A portable, cross-platform CLI tool and universal AI Agent skill that imports or syncs YouTube playlists directly into [Nuclear Music Player](https://nuclearplayer.com) without any manual UI clicking.

---

## Features

- **Direct Ingestion**: Injects playlist metadata and track records directly into Nuclear's local JSON database (`~/.local/share/com.nuclearplayer/playlists/`).
- **NuclearTube Compatible**: Pre-formats tracks with the `nucleartube-streaming` provider and best-quality thumbnails.
- **Atomic Writes**: Protects `index.json` and playlist files from corruption using atomic file swaps.
- **Cache-Safe Relaunch**: Safely detects running instances of Nuclear, stops them gracefully before modifying files, and restarts the player so playlists show up immediately.
- **Universal AI Agent Skill**: Adheres to the open Agent Skills specification—compatible with Claude Code, Hermes Agent, Antigravity, Cursor, OpenCode, and Codex.
- **Zero Agent Required**: Works just as effectively as a standalone terminal CLI.

---

## Quick Start (Standalone CLI)

### 1. Requirements
- Python 3.10+
- [Nuclear Music Player](https://nuclearplayer.com)
- `yt-dlp` (Optional: script auto-detects Nuclear's bundled `yt-dlp` if present)

### 2. Installation
Run the installer script:
```bash
./install.sh
```
This copies the executable into `~/.local/bin/nuclear-import-playlist` and registers the agent skill if supported harness directories are present.

### 3. Usage
```bash
# Import a YouTube playlist
nuclear-import-playlist "https://www.youtube.com/playlist?list=PLw-VjHDlEOgvtnnnqWlTqByAtC7tXBg6D"

# Import with a custom playlist name
nuclear-import-playlist "https://www.youtube.com/playlist?list=PLw-VjHDlEOgvtnnnqWlTqByAtC7tXBg6D" --name "Synthwave Drive"

# Import without restarting Nuclear
nuclear-import-playlist "<URL>" --no-restart
```

---

## AI Agent Integration

This repository includes a standard [`SKILL.md`](./SKILL.md) file.

### Supported Agent Platforms:
- **Claude Code**: Copy/link this folder into `~/.claude/skills/nuclear-playlist-importer` or inside your project repository.
- **Hermes Agent**: Copy/link this folder into `~/.hermes/skills/nuclear-playlist-importer`.
- **Google Antigravity**: Copy/link this folder into `~/.gemini/config/skills/nuclear-playlist-importer`.
- **Cursor / OpenCode / Codex**: Point your custom agent or system instructions to `SKILL.md`.

Once installed, simply prompt your agent:
> *"Import this YouTube playlist for me: https://www.youtube.com/playlist?list=..."*

---

## Cross-Platform Data Paths

The script automatically detects Nuclear's storage directory:
- **Linux**: `~/.local/share/com.nuclearplayer/` or `~/.config/nuclear/`
- **macOS**: `~/Library/Application Support/com.nuclearplayer/` or `~/Library/Application Support/nuclear/`
- **Windows**: `%APPDATA%\com.nuclearplayer\` or `%APPDATA%\nuclear\`

You can also override the data directory or binary path via environment variables:
```bash
export NUCLEAR_DATA_DIR="/custom/path/to/nuclear"
export NUCLEAR_BIN="/usr/local/bin/nuclear"
```

---

## License

MIT / Open Source
