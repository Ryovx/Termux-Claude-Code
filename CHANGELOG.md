# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Arabic README (`README.ar.md`)
- Chinese README (`README.zh.md`)
- CI workflow to validate `install.sh` on push
- Automated release publishing

## [1.0.0] — 2026-10-20

### Added
- Native Claude Code installer for Termux (aarch64)
- Alpine musl loader + libraries bundled under `$PREFIX/lib/claude-musl/`
- Launcher at `$PREFIX/bin/claude` (no `patchelf`, no `proot`, no `chroot`)
- `claude-fix` — restores the launcher from template
- `claude-update` — smart updater (skips download if already latest)
- `claude-uninstall` — full remover
- Zero modifications to `~/.bashrc` or `~/.zshrc`
- Idempotent installer (`--force` to reinstall, `--uninstall` to remove)
- One-command install via `curl | bash`
- Comprehensive troubleshooting and FAQ sections
