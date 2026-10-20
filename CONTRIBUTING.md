# Contributing to Termux Claude Code Installer

Thank you for your interest in contributing! 🎉

## How to Contribute

### 🐛 Reporting Bugs

Before opening an issue, please:

1. **Search existing issues** to avoid duplicates.
2. **Run `claude doctor`** and include the output.
3. **Include your Termux version**, Android version, and device model.

Open an issue at: [https://github.com/Ryovx/Termux-Claude-Code/issues/new](https://github.com/Ryovx/Termux-Claude-Code/issues/new)

### 💡 Suggesting Features

Start a discussion at: [https://github.com/Ryovx/Termux-Claude-Code/discussions](https://github.com/Ryovx/Termux-Claude-Code/discussions)

### 🔧 Submitting Pull Requests

1. **Fork** the repository.
2. **Create a branch** from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes.**
4. **Test on a clean Termux install.**
5. **Run syntax check:**
   ```bash
   bash -n install.sh
   ```
6. **Commit** with a clear message:
   ```bash
   git commit -m "feat: add support for X"
   ```
7. **Push** and open a **Pull Request**.

## Development Guidelines

- Keep the installer **idempotent** — running it twice must produce the same result.
- Keep it **safe** — never modify files outside `$PREFIX`.
- Never modify `~/.bashrc` or `~/.zshrc`.
- Test on a clean Termux install before submitting.
- Verify with `bash -n install.sh` before every commit.
- Follow the existing code style (2-space indent, no tabs).

## Commit Message Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

| Type | Description |
|---|---|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, no code change |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `test` | Adding or updating tests |
| `chore` | Maintenance tasks |

## Translations

Want to add a translation? Create a file named `README.<lang>.md` and link it at the top of the existing READMEs.

Currently supported:

- 🇬🇧 English (`README.md`)
- 🇸🇦 Arabic (`README.ar.md`)
- 🇨🇳 Chinese (`README.zh.md`)

## Code of Conduct

By participating, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## Questions?

Open a discussion or reach out to [@Ryovx](https://github.com/Ryovx).

---

Thank you for helping make Termux a better place for Claude Code! 🚀
