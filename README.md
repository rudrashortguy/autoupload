# AutoUpload — YouTube link in, published Shorts out

One command turns a long YouTube video (or podcast) into edited vertical Shorts and uploads them to YouTube automatically: cut on the best moments, reframed on whoever is talking, captioned with highlighted key words, punch-in zooms, soft whooshes, -14 LUFS audio — then scheduled and published.

```
/autoupload <youtube-url>
```

Defaults: **5 clips**, 20–60 s each, **scheduled 2/day** (15:00 & 22:00 slots), public.

## Install — one file per OS

Requires [Claude Code](https://claude.com/claude-code) on the machine.

| OS | File | Run |
|----|------|-----|
| macOS | `installer-for-mac.sh` | `bash installer-for-mac.sh` |
| Fedora Linux | `installer-for-fedora.sh` | `bash installer-for-fedora.sh` |
| Windows 10/11 | `installer-for-windows.ps1` | `powershell -NoProfile -ExecutionPolicy Bypass -File installer-for-windows.ps1` |

Windows alternative: double-click `run-installer-windows.cmd`.

Each installer:
1. installs system dependencies (Homebrew on macOS / `dnf` + RPM Fusion on Fedora / `winget` on Windows — asks for your password where needed),
2. unpacks the two skills into `~/.claude/skills/` (`clipper` = fetch/transcribe/cut/edit/check, `autoupload` = YouTube upload + scheduling),
3. sets up the Python virtual environments,
4. walks you through the one-time Google authorization,
5. runs health checks and prints a summary.

When it finishes, **restart Claude Code** (so it picks up the new skills) and run `/autoupload <youtube-url>`. Clips land in `~/Desktop/Clipper/<name>-<video-id>/clips`.

## Your own Google credentials (free, ~5 min, once)

The installers bundle **no keys** — you create your own:

1. Go to [console.cloud.google.com](https://console.cloud.google.com/) → create a project (any name).
2. APIs & Services → Library → search **YouTube Data API v3** → Enable.
3. APIs & Services → OAuth consent screen → External → app name + your email → add yourself as a test user.
4. APIs & Services → Credentials → Create credentials → **OAuth client ID** → **Desktop app** → Download JSON.
5. Save it as `~/.claude/skills/autoupload/client_secret.json` (the installer prompts for this, then opens a browser to log into the YouTube channel account and saves a permanent `token.json`).

## Good to know

- The first transcription downloads a ~500 MB speech model, once.
- YouTube quota: 1600 units per upload, 10,000/day free → one 5-clip run per day on a fresh project; rerun the next day for more.
- Clip titles/captions are editable in `clips/clip-NN.txt` before upload.
- Only upload videos you own or have the rights to — uploading clips from someone else's video may get claimed or blocked by YouTube.

## Privacy

- The installers contain **skill code only** — no API keys, no tokens, no personal paths.
- Your credentials live only in `client_secret.json` and `token.json` on your machine. **Never share those two files.**

## Credits

- `clipper` pipeline: MIT © HubPost — see `clipper/LICENSE` after install.
- Montserrat font: SIL Open Font License — see `clipper/fonts/OFL.txt` after install.
- The rest: MIT — see [LICENSE](LICENSE).

## License

MIT © 2026 Rudra Suryavanshi
