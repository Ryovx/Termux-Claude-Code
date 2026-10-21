# 安全政策

## 支持的版本

| 版本 | 支持 |
|---|---|
| 2.0.x | ✅ |
| 1.0.x | ⚠️ 仅安全修复 |
| < 1.0 | ❌ |

## 报告漏洞

如果您发现安全漏洞，**请不要打开公开 issue**。

相反，请通过 **GitHub Security Advisories** 私下报告：

👉 [https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new](https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new)

请包括：

- 漏洞描述
- 重现步骤
- 潜在影响
- 任何建议的修复（可选）

## 响应时间表

- **确认：** 48 小时内
- **初步评估：** 7 天内
- **修复或缓解：** 30 天内（取决于严重程度）

## 范围

本政策涵盖安装脚本（`install.sh`）及其创建的辅助脚本（`claude`、`claude-fix`、`claude-update`、`claude-uninstall`）。

它还涵盖 musl 运行时归档的 **SHA256 校验逻辑**，以及对 `$PREFIX/etc/resolv.conf` 的**安全处理**。

**范围之外：**

- Claude Code 本身的漏洞 — 报告给 [Anthropic](https://www.anthropic.com/security)
- Termux 软件包中的漏洞
- 已修补 musl 源代码中的漏洞 — 报告给 [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux/security/advisories/new)
- 上游 musl 项目中的漏洞

## 我们校验什么

每次安装都会从**签名的发布归档**下载 musl 运行时，并在解压前对照**固定的 SHA256** 进行校验。任何不匹配都会中止安装。

安装器：

- **绝不**传输您的 `ANTHROPIC_API_KEY`。
- **绝不**读取、存储或记录凭证。
- **绝不**写入 `$PREFIX`（Termux 沙箱）之外。
- **绝不**修改 `~/.bashrc` 或 `~/.zshrc`。

## 安全港

我们支持安全研究人员的安全港，前提是他们：

- 真诚努力避免隐私侵犯、数据破坏和服务中断
- 仅与您拥有或获得明确许可的账户互动
- 不利用漏洞超出确认所需的程度

我们不会对遵循这些指南的研究人员采取法律行动。

---

感谢您帮助保持本项目安全！🔒
