---
name: nuclear-playlist-importer
description: Import or sync YouTube playlists directly into Nuclear Music Player with zero manual UI interaction. Extracts tracks via yt-dlp, formats them for Nuclear's streaming provider, writes playlist data atomically, and refreshes the player.
---

# Nuclear Playlist Importer

A universal agent skill and automation tool to import any YouTube playlist URL directly into [Nuclear Music Player](https://nuclearplayer.com).

## Agent Instructions

When the user asks to import a playlist, add music from YouTube, or passes a YouTube playlist URL:

1. **Extract Playlist URL & Optional Name**:
   - Extract the YouTube URL (e.g., `https://www.youtube.com/playlist?list=...`).
   - If the user specified a custom name (e.g. "Save this as Cyberpunk Focus"), note it.

2. **Locate the Import Script**:
   Find the script via either:
   - System PATH: `nuclear-import-playlist`
   - Or relative to this skill: `<skill_directory>/scripts/nuclear-import-playlist`

3. **Execute**:
   ```bash
   nuclear-import-playlist "<YOUTUBE_PLAYLIST_URL>" [--name "<CUSTOM_NAME>"]
   ```
   *(If running relatively without global install)*:
   ```bash
   ./scripts/nuclear-import-playlist "<YOUTUBE_PLAYLIST_URL>" [--name "<CUSTOM_NAME>"]
   ```

4. **Verify & Respond**:
   - The script outputs the detected playlist title, track count, and total duration.
   - Inform the user that the playlist has been imported and is ready to play in the **Playlists** tab.
