# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- CI workflow to validate `install.sh` on push
- Automated release publishing
- Additional language READMEs (ES, FR, DE, TR, RU)

## [2.0.0] — 2026-10-21

### Changed — **BREAKING**
- **Replaced the Alpine musl runtime with a patched musl loader** from [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux).
  - Reason: DNS was broken for Claude Code's network requests on Termux. Upstream musl reads `/etc/resolv.conf`, which is neither readable nor writable in Termux. Android routes DNS through the `netd` system service, so musl-based lookups were failing with `EAI_AGAIN`.
  - The patched loader redirects DNS reads to `$PREFIX/etc/resolv.conf` and adds a deterministic fallback list (`1.1.1.1` → `8.8.8.8` → `127.0.0.1`) when no nameserver is configured.
  - The launcher now sets `MUSL_ON_TERMUX=1` unconditionally, so DNS works with zero user configuration.
- Musl runtime download source moved from `dl-cdn.alpinelinux.org` to a **signed release archive** hosted on `Ryovx/Musl-on-Termux` at a pinned version.
- The downloaded runtime is now **SHA256-verified** before extraction; installation aborts on mismatch.
- `--force` now also wipes `$PREFIX/lib/claude-musl/` so the patched musl is re-downloaded.
- Minimum free space raised from 700 MB to **800 MB** (peak during atomic swap is higher).
- `is_binary_pristine()` now uses `readelf` instead of `file` for cross-version reliability.
- `install_claude_binary` now performs an **atomic swap** with validation of the new binary (size, executability) before moving the old package aside, restoring it if the swap fails.

### Added
- `ensure_resolv_conf()` — creates `$PREFIX/etc/resolv.conf` with `1.1.1.1` and `8.8.8.8` if it doesn't exist or is empty.
- `claude-uninstall` now refuses to run outside a Termux `$PREFIX` (safety guard).
- `install.sh --uninstall` includes the same safety guard.
- SHA256 constant `MUSL_ZIP_SHA256` for integrity verification.
- Verification step confirms `resolv.conf` exists and is non-empty after install.

### Fixed
- DNS resolution no longer fails inside Claude Code due to an inaccessible `/etc/resolv.conf`.
- Extraction is now atomic: a failed `npm pack` or `tar` no longer leaves a partial package.
- Cleanup of stale `.tgz` artifacts from prior runs before each install.

### Removed
- Download of `alpine-minirootfs-*.tar.gz` from `dl-cdn.alpinelinux.org`.
- Reference to "Alpine's musl loader" in user-facing output.

## [1.0.0] — 2026-10-20

### Added
- Native Claude Code installer for Termux (aarch64)
- Launcher at `$PREFIX/bin/claude` (no `patchelf`, no `proot`, no `chroot`)
- `claude-fix` — restores the launcher from template
- `claude-update` — smart updater (skips download if already latest)
- `claude-uninstall` — full remover
- Zero modifications to `~/.bashrc` or `~/.zshrc`
- Idempotent installer (`--force` to reinstall, `--uninstall` to remove)
- One-command install via `curl | bash`
- Comprehensive troubleshooting and FAQ sections
- Documentation in English, Arabic, and Chinese
