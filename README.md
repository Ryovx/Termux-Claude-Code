<div align="center">

# 🚀 Termux Claude Code Installer

**🌐 Languages:** [🇬🇧 English](README.md) · [🇸🇦 العربية](README.ar.md) · [🇨🇳 中文](README.zh.md)

> 🔥 **Run Claude Code natively on Termux — 100% WORKING, 0% PROOT, one command and you're in!** 🚀

<br/>

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0)
[![Platform: Termux](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android&logoColor=white)](#requirements)
[![Architecture: aarch64](https://img.shields.io/badge/Architecture-aarch64-orange?style=for-the-badge&logo=arm&logoColor=white)](#requirements)
[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)

[![Version](https://img.shields.io/github/v/release/Ryovx/termux-claude-code?style=for-the-badge&logo=github&label=Version&color=brightgreen)](https://github.com/Ryovx/termux-claude-code/releases)
[![Stars](https://img.shields.io/github/stars/Ryovx/termux-claude-code?style=for-the-badge&logo=github&color=yellow)](https://github.com/Ryovx/termux-claude-code/stargazers)
[![Forks](https://img.shields.io/github/forks/Ryovx/termux-claude-code?style=for-the-badge&logo=github&color=blue)](https://github.com/Ryovx/termux-claude-code/network/members)
[![Issues](https://img.shields.io/github/issues/Ryovx/termux-claude-code?style=for-the-badge&logo=github&color=red)](https://github.com/Ryovx/termux-claude-code/issues)
[![Last Commit](https://img.shields.io/github/last-commit/Ryovx/termux-claude-code?style=for-the-badge&logo=github&color=purple)](https://github.com/Ryovx/termux-claude-code/commits/main)
[![Repo Size](https://img.shields.io/github/repo-size/Ryovx/termux-claude-code?style=for-the-badge&logo=github&color=informational)](https://github.com/Ryovx/termux-claude-code)

<br/>

**The missing native installer that lets [Claude Code](https://claude.com/claude-code) run on Android's [Termux](https://termux.dev) — no `proot`, no `chroot`, no `patchelf`, no containers.**

[⚡ Install in 10 seconds ↓](#quick-install)

</div>

---

## 📖 Table of Contents

- [✨ Features](#features)
- [🚀 Quick Install](#quick-install)
- [📋 Requirements](#requirements)
- [💻 Usage](#usage)
- [📦 What Gets Installed](#what-gets-installed)
- [🔧 How It Works](#how-it-works)
- [🐛 Troubleshooting](#troubleshooting)
- [🧹 Uninstall](#uninstall)
- [❓ FAQ](#faq)
- [🤝 Contributing](#contributing)
- [📜 License](#license)
- [👤 Author](#author)
- [🌐 Languages](#languages)

---

## ✨ Features

- 🚀 **Native Execution** — Runs the *official* `linux-arm64-musl` binary published by Anthropic.
- 🛡️ **No proot, no chroot** — No containers, no virtual machines, no emulation.
- 🔧 **No patchelf** — Deliberately avoids the SIGSEGV that happens when you patch musl binaries on Android kernels.
- ⚡ **One-command install** — Copy, paste, done.
- 🔄 **Smart updates** — `claude-update` skips the 280 MB download if you're already on the latest version.
- 💚 **Self-healing** — `claude-fix` restores the launcher after a manual `npm update`.
- 🧹 **Clean uninstall** — `claude-uninstall` removes every artifact.
- 🚫 **Zero rc-file changes** — Never touches `~/.bashrc` or `~/.zshrc`.
- 🔐 **Free forever** — GPLv3, community-driven, open source.
- 🌍 **Works on any ARM64 Android device** — Tested on Termux from F-Droid and GitHub releases.

---

## 🚀 Quick Install

Open Termux and paste **one line**:

```bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/termux-claude-code/main/install.sh | bash
```

That's it. When it finishes, run:

```bash
claude
```

> 💡 **Prefer to review the script first?** Download it, read it, then run it:
>
> ```bash
> curl -fsSL https://raw.githubusercontent.com/Ryovx/termux-claude-code/main/install.sh -o install.sh
> less install.sh
> bash install.sh
> ```

---

## 📋 Requirements

| Requirement | Details |
|---|---|
| **Termux** | From [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub Releases](https://github.com/termux/termux-app/releases) — **NOT** the Play Store version |
| **Architecture** | `aarch64` (ARM64) only — no x86_64, no armv7 |
| **Free space** | ~700 MB (280 MB binary + musl runtime + headroom) |
| **Internet** | Required during install and update |
| **Node.js** | Auto-installed by the script if missing |
| **Root** | ❌ **Not required** |

---

## 💻 Usage

After installation, the following commands are available immediately from `$PREFIX/bin`:

| Command | Description |
|---|---|
| `claude` | Run Claude Code (interactive session) |
| `claude-update` | Update to the latest npm version |
| `claude-fix` | Restore the launcher if it breaks |
| `claude-uninstall` | Remove every installed artifact |

### First-Run Authentication

**Option A — API Key (recommended, most reliable on Termux):**

```bash
export ANTHROPIC_API_KEY=sk-ant-...
claude
```

Add the `export` line to `~/.bashrc` or `~/.zshrc` to make it persistent.

**Option B — OAuth:**

```bash
claude /login
```

> ⚠️ OAuth requires a browser roundtrip — some Termux setups handle this poorly. If it fails, use the API key method.

### Common Usage Examples

```bash
# Interactive session
claude

# Non-interactive one-shot prompt
claude -p "explain what a musl loader does in 2 sentences"

# Resume the last conversation
claude --continue

# Check installation health
claude doctor
```

---

## 📦 What Gets Installed

| Path | Purpose |
|---|---|
| `$PREFIX/bin/claude` | The launcher (6 lines of bash) |
| `$PREFIX/bin/claude-fix` | Restores the launcher from template |
| `$PREFIX/bin/claude-update` | Updates to the latest npm release |
| `$PREFIX/bin/claude-uninstall` | Removes everything |
| `$PREFIX/lib/claude-musl/` | Alpine's musl loader + bundled libraries |
| `$PREFIX/lib/claude-musl/launcher.template` | Source of truth for `claude-fix` |
| `$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude` | The official 280 MB binary |

**Nothing is written outside `$PREFIX`.** No system files, no `~/.bashrc`, no `~/.zshrc`.

---

## 🔧 How It Works

Claude Code ships a `linux-arm64-musl` ELF binary. Termux runs on **Android's Bionic libc**, not musl. Direct execution fails:

```text
cannot execute: required file not found
```

…because the binary requests `/lib/ld-musl-aarch64.so.1`, which doesn't exist on Android.

**What doesn't work:**

- ❌ **`patchelf`** — changes the ELF interpreter, but the musl loader still SIGSEGVs on the Android kernel.
- ❌ **`proot` / `chroot`** — heavy, slow, and breaks `claude`'s bash tool.
- ❌ **The npm wrapper** `claude-code-termux` — broken with Claude Code ≥ 2.1.x, because Anthropic removed `cli.js`.

**What does work (this project):**

1. Download **Alpine's musl loader** (`ld-musl-aarch64.so.1`) and its bundled `.so` files into `$PREFIX/lib/claude-musl/`.
2. Download the **official `linux-arm64-musl` binary** from npm.
3. Create a **6-line launcher** that:
   - Unsets `LD_PRELOAD` (Termux's `libtermux-exec-ld-preload.so` is Bionic-linked and crashes musl binaries).
   - Invokes the musl loader with `--library-path` pointing at `$PREFIX/lib/claude-musl/`.
   - Execs the real binary.

That's it. **No patchelf, no proot, no chroot, no magic.**

---

## 🐛 Troubleshooting

<details>
<summary><b>`claude: command not found` after install</b></summary>

The launcher is in `$PREFIX/bin`, which should be on `$PATH`. Refresh your shell's command cache:

```bash
hash -r
which claude
```

If still missing, run `claude-fix`:

```bash
claude-fix
```

</details>

<details>
<summary><b>`claude` broke after running `npm update -g`</b></summary>

`npm update -g` overwrites the launcher with a broken stub. Restore it:

```bash
claude-fix
```

Or, use the built-in updater, which handles this automatically:

```bash
claude-update
```

</details>

<details>
<summary><b>`claude --version` returns nothing or hangs</b></summary>

Check that the musl runtime is intact:

```bash
ls -la "$PREFIX/lib/claude-musl/ld-musl-aarch64.so.1"
```

If missing, reinstall:

```bash
bash install.sh --force
```

</details>

<details>
<summary><b>Authentication keeps failing</b></summary>

Try the API key method instead of OAuth:

```bash
export ANTHROPIC_API_KEY=sk-ant-...
claude
```

OAuth on Termux requires a browser handoff that some devices handle poorly. The API key is more reliable.

</details>

<details>
<summary><b>`Error relocating ... libtermux-exec-ld-preload.so`</b></summary>

The launcher already handles this via `env -u LD_PRELOAD`. If you see this error, someone bypassed the launcher and ran the binary directly. Use `claude` (the launcher), not the raw binary path.

</details>

<details>
<summary><b>Segmentation fault (SIGSEGV)</b></summary>

You're likely running a `patchelf`-modified binary from an older install. Force a clean reinstall:

```bash
bash install.sh --force
```

</details>

<details>
<summary><b>Update failed midway</b></summary>

`claude-update` is atomic — it removes the old package only after the new one is unpacked. If it failed partway, just re-run:

```bash
claude-update
```

</details>

---

## 🧹 Uninstall

**One command:**

```bash
claude-uninstall
```

That removes:

- The launcher and all three helpers
- The musl runtime directory
- The 280 MB Claude Code binary
- Any legacy rc-file markers left by older installer versions

**Or**, if you still have `install.sh` locally:

```bash
bash install.sh --uninstall
```

Your API key and Claude Code settings in `~/.claude/` are **not** touched by default. Delete them manually if desired:

```bash
rm -rf ~/.claude
```

---

## ❓ FAQ

<details>
<summary><b>Does this work on x86_64 or armv7?</b></summary>

No. Only `aarch64` (ARM64). Claude Code's official binary is only published for `linux-arm64-musl`, and there is no x86_64 Android build that could run it reliably.

</details>

<details>
<summary><b>Does this modify my shell configuration?</b></summary>

**No.** All commands (`claude`, `claude-fix`, `claude-update`, `claude-uninstall`) are real executables in `$PREFIX/bin`, not shell functions. `~/.bashrc` and `~/.zshrc` are never touched.

</details>

<details>
<summary><b>Does this require root or a rooted device?</b></summary>

**No.** Everything installs into Termux's own `$PREFIX` directory. No system files are written.

</details>

<details>
<summary><b>Will this work with the Play Store version of Termux?</b></summary>

No. The Play Store version is abandoned and incompatible with modern Termux packages. Use [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub Releases](https://github.com/termux/termux-app/releases).

</details>

<details>
<summary><b>How do I update Claude Code?</b></summary>

Use the built-in updater:

```bash
claude-update
```

It checks npm for the latest version and skips the download if you're already current.

</details>

<details>
<summary><b>Why musl and not glibc?</b></summary>

Anthropic publishes a `linux-arm64-musl` build that works on Android when given the correct loader. The glibc build does not work on Android at all, even with `patchelf` — it SIGSEGVs on startup.

</details>

<details>
<summary><b>Why not just use `proot-distro`?</b></summary>

You can — but it's slow, it breaks `claude`'s bash tool, and it requires keeping an entire Alpine/Ubuntu rootfs around. This installer avoids all of that by supplying only the loader.

</details>

<details>
<summary><b>Can I use this installer on other Anthropic binaries?</b></summary>

The launcher pattern (musl loader + `--library-path` + `env -u LD_PRELOAD`) works for any `linux-arm64-musl` binary. You'd need to adjust the paths in the launcher template.

</details>

<details>
<summary><b>Is my API key safe?</b></summary>

The installer never reads, stores, or transmits your `ANTHROPIC_API_KEY`. It only runs `claude`, which handles auth through its own mechanisms. Your key stays in your environment.

</details>

<details>
<summary><b>Can I see the installer before running it?</b></summary>

**Always.** Download first, review, then run:

```bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/termux-claude-code/main/install.sh -o install.sh
less install.sh
bash install.sh
```

</details>

---

## 🤝 Contributing

Contributions are welcome and appreciated! Here's how you can help:

- 🐛 **Report bugs** — [Open an issue](https://github.com/Ryovx/termux-claude-code/issues/new)
- 💡 **Suggest features** — [Start a discussion](https://github.com/Ryovx/termux-claude-code/discussions)
- 🔧 **Submit pull requests** — Fork, branch, commit, PR
- 📖 **Improve documentation** — Typos, clarifications, translations
- 🌐 **Add translations** — Create `README.<lang>.md` and link it at the top
- ⭐ **Star the repo** — The simplest way to support the project

### Development Guidelines

- Keep the installer **idempotent** — running it twice must produce the same result.
- Keep it **safe** — never modify files outside `$PREFIX`.
- Test on a clean Termux install before submitting.
- Verify with `bash -n install.sh` before every commit.

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0 or later**
(SPDX: `GPL-3.0-or-later`). See [LICENSE](LICENSE) for the full text.

### 🤝 Open Innovation Network (OIN)

**Ryovx is a proud member of the [Open Innovation Network (OIN)](https://openinventionnetwork.com/)** — a global consortium that protects open-source software from patent aggression.

In line with OIN's mission and our commitment to the Termux community, **most of Ryovx's service products are released under GNU GPLv3**.

### 💚 Ethical Request — Not a Legal Restriction

Just as we provide this tool **completely free of charge**, we kindly ask that you do the same: **please keep it free**.

> **This is a friendly request, not a legal prohibition.**
>
> Under the GNU GPLv3, you are **fully entitled** to use, study, modify, redistribute, and even **sell** this software — provided you comply with the license terms.
>
> You may do **whatever the license permits**. We simply hope you'll choose to honor the spirit in which it was shared.

### 🙏 How You Can Support This Project

- ⭐ **Star** the repository
- 🐛 **Report** bugs and issues
- 💡 **Suggest** new features
- 🔧 **Submit** pull requests
- 📣 **Share** it with the Termux community
- 💬 **Help** others in the discussions

**If you see this software being sold against this request, please [open an issue](https://github.com/Ryovx/termux-claude-code/issues)** — not because it violates the license, but because it violates the spirit of the project.

### 📄 Full License Text

See [LICENSE](LICENSE) for the complete GNU GPLv3 text, plus our non-binding **Ethical Use Request** addendum.

---

## 👤 Author

<div align="center">

**Ryovx**

[![GitHub](https://img.shields.io/badge/GitHub-@Ryovx-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Ryovx)

*Building free, native tools for the Termux community.*

</div>

---

## 🌐 Languages

| Language | File | Status |
|---|---|---|
| 🇬🇧 **English** | [README.md](README.md) | ✅ Current |
| 🇸🇦 **العربية** | [README.ar.md](README.ar.md) | 🚧 Coming soon |
| 🇨🇳 **中文** | [README.zh.md](README.zh.md) | 🚧 Coming soon |

Want to add another language? See [Contributing](#contributing).

---

<div align="center">

**Built with ❤️ for the Termux community**

⭐ **If this project saved you hours of head-scratching, consider starring the repo** ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=Ryovx/termux-claude-code&type=Date)](https://star-history.com/#Ryovx/termux-claude-code&Date)

<br/>

*Not affiliated with Anthropic. Claude Code is a trademark of Anthropic, PBC.*

</div>
