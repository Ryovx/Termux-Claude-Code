# 安全政策

## 支持的版本

| 版本 | 支持 |
|---|---|
| 1.0.x | ✅ |
| < 1.0 | ❌ |

## 报告漏洞

如果你发现安全漏洞，**请不要公开提交 issue**。

请改为私下报告：

1. **GitHub 安全公告：** [https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new](https://github.com/Ryovx/Termux-Claude-Code/security/advisories/new)

请包括：

- 漏洞的描述
- 复现步骤
- 潜在影响
- 任何建议的修复方案（可选）

## 响应时间表

- **确认：** 48 小时内
- **初步评估：** 7 天内
- **修复或缓解：** 30 天内（取决于严重程度）

## 范围

本政策涵盖安装脚本（`install.sh`）及其创建的辅助脚本（`claude`、`claude-fix`、`claude-update`、`claude-uninstall`）。

**范围之外：**

- Claude Code 本身的漏洞（请报告给 [Anthropic](https://www.anthropic.com/security)）
- Termux 软件包中的漏洞
- Alpine 的 musl 运行时中的漏洞

## 安全港

我们支持对符合以下条件的安全研究人员提供安全港：

- 本着善意努力避免侵犯隐私、破坏数据和服务中断
- 仅与你拥有的账户或获得明确许可的账户进行交互
- 不利用漏洞超出确认其存在所必需的范围

我们不会对遵循这些准则的研究人员采取法律行动。

---

感谢你帮助保持本项目的安全！🔒
