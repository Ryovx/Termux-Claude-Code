# Security Policy

## Supported Versions

| Version | Supported |
|---|---|
| 2.0.x | ✅ |
| 1.0.x | ⚠️ Security fixes only |
| < 1.0 | ❌ |

## Reporting a Vulnerability

If you discover a security vulnerability, **please do NOT open a public issue**.

Instead, report it privately via **GitHub Security Advisories**:

👉 [https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new](https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new)

Please include:

- A description of the vulnerability
- Steps to reproduce
- Potential impact
- Any suggested fix (optional)

## Response Timeline

- **Acknowledgment:** Within 48 hours
- **Initial assessment:** Within 7 days
- **Fix or mitigation:** Within 30 days (depending on severity)

## Scope

This policy covers the installer script (`install.sh`) and the helper scripts it creates (`claude`, `claude-fix`, `claude-update`, `claude-uninstall`).

It also covers the **SHA256 verification logic** for the musl runtime archive, and the **safe-handling of `$PREFIX/etc/resolv.conf`**.

**Out of scope:**

- Vulnerabilities in Claude Code itself — report to [Anthropic](https://www.anthropic.com/security)
- Vulnerabilities in Termux packages
- Vulnerabilities in the patched musl sources — report to [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux/security/advisories/new)
- Vulnerabilities in the upstream musl project

## What We Verify

Every installation downloads the musl runtime from a **signed release archive** and verifies it against a **pinned SHA256** before extraction. Any mismatch aborts the installation.

The installer:

- **Never** transmits your `ANTHROPIC_API_KEY`.
- **Never** reads, stores, or logs credentials.
- **Never** writes outside `$PREFIX` (the Termux sandbox).
- **Never** modifies `~/.bashrc` or `~/.zshrc`.

## Safe Harbor

We support safe harbor for security researchers who:

- Make a good faith effort to avoid privacy violations, data destruction, and service interruption
- Only interact with accounts you own or with explicit permission
- Do not exploit a vulnerability beyond what is necessary to confirm it

We will not pursue legal action against researchers who follow these guidelines.

---

Thank you for helping keep this project safe! 🔒
