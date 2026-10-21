## Description

<!-- Describe your changes in detail. Link to the issue this fixes, if any. -->

Fixes #<!-- issue number -->

## Type of Change

- [ ] 🐛 Bug fix (non-breaking change that fixes an issue)
- [ ] ✨ New feature (non-breaking change that adds functionality)
- [ ] 💥 Breaking change (fix or feature that changes existing behavior)
- [ ] 📖 Documentation update
- [ ] 🔧 Refactoring (no functional change)
- [ ] 🌐 Translation
- [ ] 🧪 Tests / CI

## Area Affected

- [ ] Installer (`install.sh`)
- [ ] Launcher (`claude`)
- [ ] Helper (`claude-fix`, `claude-update`, `claude-uninstall`)
- [ ] DNS / `resolv.conf` handling
- [ ] Patched musl runtime integration
- [ ] Documentation (`README`, `CONTRIBUTING`, `SECURITY`, `SUPPORT`, etc.)
- [ ] Translations (`ar`, `zh`, other)
- [ ] CI / GitHub Actions

## Testing

<!-- Describe the tests you ran and how to reproduce them. -->

### Tested on

- **Device:** <!-- e.g., Pixel 8 -->
- **Android version:** <!-- e.g., Android 14 -->
- **Termux version:** <!-- output of `termux-info` first line -->
- **Architecture:** <!-- e.g., aarch64 -->
- **Installer version:** <!-- e.g., 2.0.0 -->

### Checks Performed

- [ ] `bash -n install.sh` passes
- [ ] Installed on a clean Termux installation
- [ ] `claude --version` reports `2.1.x (Claude Code)` or newer
- [ ] `claude doctor` reports no new warnings
- [ ] **DNS works** — ran `claude -p "say hello"` and got a real response
- [ ] `$PREFIX/etc/resolv.conf` was created and contains valid nameservers
- [ ] `claude-fix` restores the launcher correctly
- [ ] `claude-update` skips download if already on latest
- [ ] `claude-uninstall` removes everything cleanly
- [ ] No files were written outside `$PREFIX`
- [ ] `~/.bashrc` and `~/.zshrc` were not modified

## Safety Checklist

- [ ] My changes do not modify files outside `$PREFIX`
- [ ] My changes do not touch `~/.bashrc` or `~/.zshrc`
- [ ] My changes do not bypass SHA256 verification of the musl runtime
- [ ] My changes do not introduce a musl loader from any source other than `Ryovx/Musl-on-Termux`
- [ ] My changes preserve an existing `$PREFIX/etc/resolv.conf`
- [ ] My changes keep the installer idempotent (running twice = same result)

## Documentation

- [ ] I updated the README (and its `ar` / `zh` variants) if user-facing behavior changed
- [ ] I updated CHANGELOG.md under `[Unreleased]`
- [ ] I updated SECURITY.md if the change affects security guarantees
- [ ] I added troubleshooting entries if the change could surface new errors
- [ ] I added FAQ entries if the change introduces a new concept

## Breaking Change Notice

<!-- If this is a breaking change, describe what breaks and how users should migrate. -->
<!-- Delete this section if not applicable. -->

## Screenshots / Logs

<!-- If applicable, paste terminal output, screenshots, or `claude doctor` output. -->

---

**Thank you for contributing!** 🚀
