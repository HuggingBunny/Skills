#!/usr/bin/env bash
set -euo pipefail

# Nuclear Playlist Importer Installer
# Installs CLI tool and registers Agent Skill across supported harnesses.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DEST="${HOME}/.local/bin"

echo "=== Nuclear Playlist Importer Setup ==="

# 1. Ensure ~/.local/bin exists and is on PATH
mkdir -p "${BIN_DEST}"
install -m 755 "${SCRIPT_DIR}/scripts/nuclear-import-playlist" "${BIN_DEST}/nuclear-import-playlist"
echo "✓ Installed executable to ${BIN_DEST}/nuclear-import-playlist"

if [[ ":$PATH:" != *":${BIN_DEST}:"* ]]; then
    echo "  [Note] Ensure ${BIN_DEST} is in your \$PATH (e.g. in ~/.bashrc or ~/.zshrc)"
fi

# 2. Check dependencies
echo ""
echo "Checking dependencies:"
if command -v python3 >/dev/null 2>&1; then
    echo "✓ Python 3: $(python3 --version)"
else
    echo "✗ Python 3 not found. Please install Python 3.10+."
fi

if command -v yt-dlp >/dev/null 2>&1; then
    echo "✓ yt-dlp found in PATH"
else
    echo "ℹ yt-dlp not found in system PATH. The script will automatically fall back"
    echo "  to Nuclear's bundled yt-dlp binary if available."
fi

# 3. Agent Skill Detection & Installation
echo ""
echo "Detecting AI Agent skill directories:"

# Antigravity
if [[ -d "${HOME}/.gemini/config/skills" ]]; then
    mkdir -p "${HOME}/.gemini/config/skills/nuclear-playlist-importer"
    ln -sf "${SCRIPT_DIR}/SKILL.md" "${HOME}/.gemini/config/skills/nuclear-playlist-importer/SKILL.md"
    echo "✓ Linked skill to Antigravity (~/.gemini/config/skills/nuclear-playlist-importer)"
fi

# Hermes Agent
if [[ -d "${HOME}/.hermes/skills" ]]; then
    mkdir -p "${HOME}/.hermes/skills/nuclear-playlist-importer"
    ln -sf "${SCRIPT_DIR}/SKILL.md" "${HOME}/.hermes/skills/nuclear-playlist-importer/SKILL.md"
    echo "✓ Linked skill to Hermes Agent (~/.hermes/skills/nuclear-playlist-importer)"
fi

# Claude Code
if [[ -d "${HOME}/.claude/skills" ]]; then
    mkdir -p "${HOME}/.claude/skills/nuclear-playlist-importer"
    ln -sf "${SCRIPT_DIR}/SKILL.md" "${HOME}/.claude/skills/nuclear-playlist-importer/SKILL.md"
    echo "✓ Linked skill to Claude Code (~/.claude/skills/nuclear-playlist-importer)"
fi

echo ""
echo "Setup complete! You can now use:"
echo "  CLI:   nuclear-import-playlist \"<YOUTUBE_PLAYLIST_URL>\""
echo "  Agent: Ask your assistant: 'Import this YouTube playlist: <URL>'"
