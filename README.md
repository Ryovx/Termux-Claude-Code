<div align="center">

# 🚀 Termux Claude Code Installer

**🌐 Languages:** [🇬🇧 English](README.md) · [🇸🇦 العربية](README.ar.md) · [🇨🇳 中文](README.zh.md)

> 🔥 **Run Claude Code natively on Termux — 100% WORKING, 0% PROOT, one command and you're in!** 🚀

<br/>

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0)
[![Platform: Termux](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android&logoColor=white)](#requirements)
[![Architecture: aarch64](https://img.shields.io/badge/Architecture-aarch64-orange?style=for-the-badge&logo=arm&logoColor=white)](#requirements)

[![Version](https://img.shields.io/github/v/release/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&label=Version&color=brightgreen)](https://github.com/Ryovx/Termux-Claude-Code/releases)
[![Stars](https://img.shields.io/github/stars/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=yellow)](https://github.com/Ryovx/Termux-Claude-Code/stargazers)
[![Forks](https://img.shields.io/github/forks/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=blue)](https://github.com/Ryovx/Termux-Claude-Code/network/members)
[![Issues](https://img.shields.io/github/issues/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=red)](https://github.com/Ryovx/Termux-Claude-Code/issues)

<br/>

**The missing native installer that lets [Claude Code](https://claude.com/claude-code) run on Android's [Termux](https://termux.dev) — no `proot`, no `chroot`, no `patchelf`, no containers.**

[⚡ Install in 10 seconds ↓](#quick-install)

</div>

---

<a id="toc"></a>
## 📖 Table of Contents

- [Features](#features)
- [Quick Install](#quick-install)
- [Requirements](#requirements)
- [Usage](#usage)
- [What Gets Installed](#what-gets-installed)
- [How It Works](#how-it-works)
- [Troubleshooting](#troubleshooting)
- [Uninstall](#uninstall)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

---

<a id="features"></a>
## ✨ Features

- 🚀 **Native Execution** — Runs the *official* `linux-arm64-musl` binary published by Anthropic.
- 🛡️ **No proot, no chroot** — No containers, no virtual machines, no emulation.
- 🔧 **No patchelf** — Deliberately avoids the SIGSEGV that happens when you patch musl binaries on Android kernels.
- 🌐 **DNS works out of the box** — Ships a patched musl loader that reads `$PREFIX/etc/resolv.conf` and falls back to public DNS when needed.
- 🔐 **Supply-chain verified** — The musl runtime is downloaded from a signed GitHub release and checked against a pinned SHA256 before installation.
- ⚡ **One-command install** — Copy, paste, done.
- 🔄 **Smart updates** — `claude-update` skips the 280 MB download if you're already on the latest version.
- 💚 **Self-healing** — `claude-fix` restores the launcher after a manual `npm update`.
- 🧹 **Clean uninstall** — `claude-uninstall` removes every artifact.
- 🚫 **Zero rc-file changes** — Never touches `~/.bashrc` or `~/.zshrc`.

---

<a id="quick-install"></a>
## 🚀 Quick Install

Open Termux and paste **one line**:

````bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh | bash
````

That's it. When it finishes, run:

````bash
claude
````

> 💡 **Prefer to review the script first?** Download it, read it, then run it:
>
> ````bash
> curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh -o install.sh
> less install.sh
> bash install.sh
> ````

---

<a id="requirements"></a>
## 📋 Requirements

| Requirement | Details |
|---|---|
| **Termux** | From [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub Releases](https://github.com/termux/termux-app/releases) — **NOT** the Play Store version |
| **Architecture** | `aarch64` (ARM64) only |
| **Free space** | ~800 MB peak during install (~700 MB steady state) |
| **Internet** | Required during install and update |
| **Packages** | `curl`, `tar`, `unzip`, `node`, `npm`, `file` — auto-installed if missing |
| **Root** | ❌ **Not required** |

---

<a id="usage"></a>
## 💻 Usage

After installation, the following commands are available immediately:

| Command | Description |
|---|---|
| `claude` | Run Claude Code (interactive session) |
| `claude-update` | Update to the latest npm version |
| `claude-fix` | Restore the launcher if it breaks |
| `claude-uninstall` | Remove every installed artifact |

### First-Run Authentication

**Option A — API Key (recommended):**

````bash
export ANTHROPIC_API_KEY=sk-ant-...
claude
````

**Option B — OAuth:**

````bash
claude /login
````

> ⚠️ OAuth on Termux requires a browser handoff that some devices handle poorly. If it fails, use the API key method.

---

<a id="what-gets-installed"></a>
## 📦 What Gets Installed

| Path | Purpose |
|---|---|
| `$PREFIX/bin/claude` | The launcher (6 lines of bash) |
| `$PREFIX/bin/claude-fix` | Restores the launcher from template |
| `$PREFIX/bin/claude-update` | Updates to the latest npm release |
| `$PREFIX/bin/claude-uninstall` | Removes everything |
| `$PREFIX/lib/claude-musl/` | Patched musl loader + bundled libraries |
| `$PREFIX/lib/claude-musl/launcher.template` | Source of truth for `claude-fix` |
| `$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude` | The official 280 MB binary |
| `$PREFIX/etc/resolv.conf` | DNS configuration for musl (created if missing) |

**Nothing is written outside `$PREFIX`.**

---

<a id="how-it-works"></a>
## 🔧 How It Works

Claude Code ships a `linux-arm64-musl` ELF binary. Termux runs on **Android's Bionic libc**, not musl. Direct execution fails with:

````text
cannot execute: required file not found
````

…because the binary requests `/lib/ld-musl-aarch64.so.1`, which doesn't exist on Android.

### Why not upstream musl?

Upstream musl reads `/etc/resolv.conf` for DNS. Inside Termux, that file is neither readable nor writable, and Android routes DNS through the `netd` system service instead. The result: musl-based programs resolve **nothing** and fail with `EAI_AGAIN` or `getaddrinfo ENOTFOUND`.

### What doesn't work

- ❌ **`patchelf`** — changes the ELF interpreter, but the musl loader still SIGSEGVs on the Android kernel.
- ❌ **`proot` / `chroot`** — heavy, slow, and breaks `claude`'s bash tool.
- ❌ **The npm wrapper `claude-code-termux`** — broken with Claude Code ≥ 2.1.x.
- ❌ **Upstream musl** — installs fine, but every DNS lookup fails.

### What does work (this project)

This installer ships a **patched musl runtime** from [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux) (MIT licensed). The patch adds two things:

1. **`MUSL_ON_TERMUX=1`** — makes the loader read `$PREFIX/etc/resolv.conf` first.
2. **Deterministic fallback** — if no nameserver is found, use `1.1.1.1`, then `8.8.8.8`, then `127.0.0.1`.

The installer then:

1. Downloads the **patched musl runtime** from a GitHub release.
2. **Verifies the SHA256** against a pinned constant. Installation aborts on any mismatch.
3. Downloads the **official `linux-arm64-musl` binary** from npm.
4. Creates a **6-line launcher** that:
   - Unsets `LD_PRELOAD` (Termux's `libtermux-exec-ld-preload.so` is Bionic-linked and crashes musl binaries).
   - Sets `MUSL_ON_TERMUX=1` so DNS works.
   - Invokes the musl loader with `--library-path` pointing at `$PREFIX/lib/claude-musl/`.
   - Execs the real binary.

**No patchelf, no proot, no chroot, no magic.**

---

<a id="troubleshooting"></a>
## 🐛 Troubleshooting

<details>
<summary><b>`claude: command not found` after install</b></summary>

The launcher is in `$PREFIX/bin`, which should be on `$PATH`. Refresh your shell's command cache:

````bash
hash -r
which claude
````

If still missing, run `claude-fix`.

</details>

<details>
<summary><b>`claude` broke after running `npm update -g`</b></summary>

`npm update -g` overwrites the launcher with a broken stub. Restore it:

````bash
claude-fix
````

Or use the built-in updater, which handles this automatically:

````bash
claude-update
````

</details>

<details>
<summary><b>DNS errors: `EAI_AGAIN`, `getaddrinfo`, `ENOTFOUND`</b></summary>

If you upgraded from v1.x, you were using upstream musl without a DNS patch. Force a clean reinstall to get the patched loader:

````bash
bash install.sh --force
````

Verify `$PREFIX/etc/resolv.conf` exists:

````bash
cat "$PREFIX/etc/resolv.conf"
````

It should contain at least one `nameserver` line. If empty, recreate it:

````bash
printf 'nameserver 1.1.1.1\nnameserver 8.8.8.8\n' > "$PREFIX/etc/resolv.conf"
````

</details>

<details>
<summary><b>`Error relocating ... libtermux-exec-ld-preload.so`</b></summary>

The launcher handles this via `env -u LD_PRELOAD`. If you see this error, someone bypassed the launcher and ran the binary directly. Use `claude`, not the raw binary path.

</details>

<details>
<summary><b>Segmentation fault (SIGSEGV)</b></summary>

You're likely running a `patchelf`-modified binary from an older install. Force a clean reinstall:

````bash
bash install.sh --force
````

</details>

<details>
<summary><b>SHA256 mismatch during install</b></summary>

The downloaded musl runtime did not match the pinned SHA256. This can indicate a corrupted download or a tampered asset. Do **not** bypass this check. Re-run the installer; if it persists, open an issue with the exact error.

</details>

<details>
<summary><b>Update failed midway</b></summary>

`claude-update` is atomic — it removes the old package only after the new one is unpacked and validated. If it failed partway, just re-run:

````bash
claude-update
````

</details>

---

<a id="uninstall"></a>
## 🧹 Uninstall

**One command:**

````bash
claude-uninstall
````

That removes:

- The launcher and all three helpers
- The patched musl runtime directory
- The 280 MB Claude Code binary
- Any legacy rc-file markers left by older installer versions

**Or**, if you still have `install.sh` locally:

````bash
bash install.sh --uninstall
````

Your API key and Claude Code settings in `~/.claude/` are **not** touched by default. Delete them manually if desired:

````bash
rm -rf ~/.claude
````

---

<a id="faq"></a>
## ❓ FAQ

<details>
<summary><b>Does this work on x86_64 or armv7?</b></summary>

No. Only `aarch64` (ARM64).

</details>

<details>
<summary><b>Does this modify my shell configuration?</b></summary>

**No.** All commands (`claude`, `claude-fix`, `claude-update`, `claude-uninstall`) are real executables in `$PREFIX/bin`, not shell functions. `~/.bashrc` and `~/.zshrc` are never touched.

</details>

<details>
<summary><b>Does this require root?</b></summary>

**No.** Everything installs into Termux's own `$PREFIX` directory.

</details>

<details>
<summary><b>Will this work with the Play Store version of Termux?</b></summary>

No. The Play Store version is abandoned. Use [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub Releases](https://github.com/termux/termux-app/releases).

</details>

<details>
<summary><b>How do I update Claude Code?</b></summary>

````bash
claude-update
````

It checks npm for the latest version and skips the download if you're already current.

</details>

<details>
<summary><b>Why musl and not glibc?</b></summary>

Anthropic publishes a `linux-arm64-musl` build that works on Android when given the correct loader. The glibc build does not work on Android at all, even with `patchelf` — it SIGSEGVs on startup.

</details>

<details>
<summary><b>Why a patched musl and not upstream musl?</b></summary>

Upstream musl reads `/etc/resolv.conf`, which Termux does not provide. Without a patch, every DNS lookup fails (`EAI_AGAIN`). The patched loader from [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux) adds two improvements:

1. When `MUSL_ON_TERMUX=1` is set, it reads `$PREFIX/etc/resolv.conf`.
2. If no nameserver is found, it uses `1.1.1.1 → 8.8.8.8 → 127.0.0.1` as a fallback.

The launcher sets `MUSL_ON_TERMUX=1` automatically. You don't need to configure anything.

</details>

<details>
<summary><b>Is the patched musl runtime safe?</b></summary>

The installer verifies it against a **pinned SHA256** before use. Any mismatch aborts the install. The source is available at [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux) under the MIT license, so you can audit it and rebuild the binary yourself.

</details>

<details>
<summary><b>Why not just use `proot-distro`?</b></summary>

You can — but it's slow, it breaks `claude`'s bash tool, and it requires keeping an entire Alpine/Ubuntu rootfs around. This installer avoids all of that by supplying only the loader.

</details>

<details>
<summary><b>Is my API key safe?</b></summary>

The installer never reads, stores, or transmits your `ANTHROPIC_API_KEY`. It only runs `claude`, which handles auth through its own mechanisms.

</details>

<details>
<summary><b>Can I see the installer before running it?</b></summary>

**Always.** Download first, review, then run:

````bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh -o install.sh
less install.sh
bash install.sh
````

</details>

---

<a id="contributing"></a>
## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

- 🐛 **Report bugs** — [Open an issue](https://github.com/Ryovx/Termux-Claude-Code/issues/new)
- 💡 **Suggest features** — [Start a discussion](https://github.com/Ryovx/Termux-Claude-Code/discussions)
- 🔧 **Submit pull requests** — Fork, branch, commit, PR
- 🌐 **Add translations** — Create `README.<lang>.md` and link it at the top

---

<a id="license"></a>
## 📜 License

This project is licensed under the **GNU General Public License v3.0 or later** (SPDX: `GPL-3.0-or-later`). See [LICENSE](LICENSE) for the full text.

The patched musl runtime bundled by this installer is a separate work, licensed under the **MIT License**. See [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux) for details.

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

**If you see this software being sold against this request, please [open an issue](https://github.com/Ryovx/Termux-Claude-Code/issues)** — not because it violates the license, but because it violates the spirit of the project.

---

<a id="author"></a>
## 👤 Author

<div align="center">

**Ryovx**

[![GitHub](https://img.shields.io/badge/GitHub-@Ryovx-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Ryovx)

*Building free, native tools for the Termux community.*

</div>

---

<div align="center">

**Built with ❤️ for the Termux community**

⭐ **If this project saved you hours of head-scratching, consider starring the repo** ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=Ryovx/Termux-Claude-Code&type=Date)](https://star-history.com/#Ryovx/Termux-Claude-Code&Date)

<br/>

*Not affiliated with Anthropic. Claude Code is a trademark of Anthropic, PBC.*

</div>
