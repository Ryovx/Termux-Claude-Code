# Security Policy

## Supported Versions

| Version | Supported |
|---|---|
| 1.0.x | ✅ |
| < 1.0 | ❌ |

## Reporting a Vulnerability

If you discover a security vulnerability, **please do NOT open a public issue**.

Instead, report it privately:

1. **GitHub Security Advisories:** [https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new](https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new)

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

**Out of scope:**

- Vulnerabilities in Claude Code itself (report to [Anthropic](https://www.anthropic.com/security))
- Vulnerabilities in Termux packages
- Vulnerabilities in Alpine's musl runtime

## Safe Harbor

We support safe harbor for security researchers who:

- Make a good faith effort to avoid privacy violations, data destruction, and service interruption
- Only interact with accounts you own or with explicit permission
- Do not exploit a vulnerability beyond what is necessary to confirm it

We will not pursue legal action against researchers who follow these guidelines.

---

Thank you for helping keep this project safe! 🔒
