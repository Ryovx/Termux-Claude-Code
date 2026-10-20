<div align="center">

# 🚀 Termux Claude Code 安装器

**🌐 语言：** [🇬🇧 English](README.md) · [🇸🇦 العربية](README.ar.md) · [🇨🇳 中文](README.zh.md)

> 🔥 **在 Termux 上原生运行 Claude Code — 100% 可用，0% proot，一条命令即可使用！** 🚀

<br/>

[![许可证: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0)
[![平台: Termux](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android&logoColor=white)](#requirements)
[![架构: aarch64](https://img.shields.io/badge/Architecture-aarch64-orange?style=for-the-badge&logo=arm&logoColor=white)](#requirements)

[![版本](https://img.shields.io/github/v/release/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&label=Version&color=brightgreen)](https://github.com/Ryovx/Termux-Claude-Code/releases)
[![星标](https://img.shields.io/github/stars/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=yellow)](https://github.com/Ryovx/Termux-Claude-Code/stargazers)
[![分叉](https://img.shields.io/github/forks/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=blue)](https://github.com/Ryovx/Termux-Claude-Code/network/members)

<br/>

**让 [Claude Code](https://claude.com/claude-code) 在 Android 的 [Termux](https://termux.dev) 上原生运行的缺失安装器 — 无需 `proot`，无需 `chroot`，无需 `patchelf`，无需容器。**

[⚡ 10 秒安装 ↓](#quick-install)

</div>

---

<a id="toc"></a>
## 📖 目录

- [特性](#features)
- [快速安装](#quick-install)
- [系统要求](#requirements)
- [使用方法](#usage)
- [安装内容](#what-gets-installed)
- [工作原理](#how-it-works)
- [故障排除](#troubleshooting)
- [卸载](#uninstall)
- [常见问题](#faq)
- [贡献](#contributing)
- [许可证](#license)
- [作者](#author)

---

<a id="features"></a>
## ✨ 特性

- 🚀 **原生执行** — 运行 Anthropic 发布的*官方* `linux-arm64-musl` 二进制文件。
- 🛡️ **无需 proot、无需 chroot** — 无容器、无虚拟机、无模拟。
- 🔧 **无需 patchelf** — 有意避免在 Android 内核上修补 musl 二进制文件时出现的 SIGSEGV。
- ⚡ **一条命令安装** — 复制、粘贴、完成。
- 🔄 **智能更新** — 如果已是最新版本，`claude-update` 会跳过 280 MB 的下载。
- 💚 **自我修复** — 手动 `npm update` 后，`claude-fix` 会恢复启动器。
- 🧹 **干净卸载** — `claude-uninstall` 会删除所有内容。
- 🚫 **零 rc 文件修改** — 从不触碰 `~/.bashrc` 或 `~/.zshrc`。

---

<a id="quick-install"></a>
## 🚀 快速安装

打开 Termux 并粘贴**一行**：

```bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh | bash
```

就这样。完成后，运行：

```bash
claude
```

> 💡 **想先审查脚本？** 下载、阅读，然后运行：
>
> ```bash
> curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh -o install.sh
> less install.sh
> bash install.sh
> ```

---

<a id="requirements"></a>
## 📋 系统要求

| 要求 | 详情 |
|---|---|
| **Termux** | 来自 [F-Droid](https://f-droid.org/en/packages/com.termux/) 或 [GitHub Releases](https://github.com/termux/termux-app/releases) — **不是** Play Store 版本 |
| **架构** | 仅限 `aarch64` (ARM64) |
| **可用空间** | 约 700 MB |
| **网络** | 安装和更新时需要 |
| **Node.js** | 缺失时脚本会自动安装 |
| **Root** | ❌ **不需要** |

---

<a id="usage"></a>
## 💻 使用方法

安装后，以下命令立即可用：

| 命令 | 描述 |
|---|---|
| `claude` | 运行 Claude Code（交互式会话） |
| `claude-update` | 更新到最新的 npm 版本 |
| `claude-fix` | 如果启动器损坏，恢复它 |
| `claude-uninstall` | 删除所有已安装的内容 |

### 首次运行认证

**方式 A — API 密钥（推荐）：**

```bash
export ANTHROPIC_API_KEY=sk-ant-...
claude
```

**方式 B — OAuth：**

```bash
claude /login
```

---

<a id="what-gets-installed"></a>
## 📦 安装内容

| 路径 | 用途 |
|---|---|
| `$PREFIX/bin/claude` | 启动器（6 行 bash） |
| `$PREFIX/bin/claude-fix` | 从模板恢复启动器 |
| `$PREFIX/bin/claude-update` | 更新到最新的 npm 版本 |
| `$PREFIX/bin/claude-uninstall` | 删除所有内容 |
| `$PREFIX/lib/claude-musl/` | Alpine 的 musl 加载器 + 库 |
| `$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude` | 官方 280 MB 二进制文件 |

**不会在 `$PREFIX` 之外写入任何内容。**

---

<a id="how-it-works"></a>
## 🔧 工作原理

Claude Code 附带 `linux-arm64-musl` ELF 二进制文件。Termux 运行在 **Android 的 Bionic libc** 上，而非 musl。直接执行会失败：

```text
cannot execute: required file not found
```

**不可行的方法：**

- ❌ **`patchelf`** — 更改 ELF 解释器，但 musl 加载器在 Android 内核上仍会 SIGSEGV。
- ❌ **`proot` / `chroot`** — 笨重、缓慢，且会破坏 `claude` 的 bash 工具。
- ❌ **npm 包装器 `claude-code-termux`** — 在 Claude Code ≥ 2.1.x 中已失效。

**可行的方法（本项目）：**

1. 将 **Alpine 的 musl 加载器**及其 `.so` 文件下载到 `$PREFIX/lib/claude-musl/`。
2. 从 npm 下载**官方 `linux-arm64-musl` 二进制文件**。
3. 创建一个 **6 行启动器**，取消设置 `LD_PRELOAD`，使用 `--library-path` 调用 musl 加载器，并执行真正的二进制文件。

就这样。**无需 patchelf、无需 proot、无需 chroot、无魔法。**

---

<a id="troubleshooting"></a>
## 🐛 故障排除

<details>
<summary><b>安装后出现 `claude: command not found`</b></summary>

```bash
hash -r
which claude
```

如果仍然缺失，运行 `claude-fix`。

</details>

<details>
<summary><b>`npm update -g` 后 `claude` 损坏</b></summary>

```bash
claude-fix
```

或使用内置更新器：

```bash
claude-update
```

</details>

<details>
<summary><b>`Error relocating ... libtermux-exec-ld-preload.so`</b></summary>

启动器通过 `env -u LD_PRELOAD` 处理此问题。如果看到此错误，说明有人绕过了启动器直接运行二进制文件。请使用 `claude`，而非原始二进制路径。

</details>

<details>
<summary><b>段错误 (SIGSEGV)</b></summary>

您可能正在运行来自旧安装的 `patchelf` 修改过的二进制文件。强制重新安装：

```bash
bash install.sh --force
```

</details>

---

<a id="uninstall"></a>
## 🧹 卸载

**一条命令：**

```bash
claude-uninstall
```

或者，如果您本地还有 `install.sh`：

```bash
bash install.sh --uninstall
```

---

<a id="faq"></a>
## ❓ 常见问题

<details>
<summary><b>支持 x86_64 或 armv7 吗？</b></summary>

不支持。仅限 `aarch64` (ARM64)。

</details>

<details>
<summary><b>会修改我的 shell 配置吗？</b></summary>

**不会。** 所有命令都是 `$PREFIX/bin` 中的真实可执行文件，而非 shell 函数。

</details>

<details>
<summary><b>需要 root 吗？</b></summary>

**不需要。**

</details>

<details>
<summary><b>能在 Play Store 版本的 Termux 上运行吗？</b></summary>

不能。请使用 [F-Droid](https://f-droid.org/en/packages/com.termux/) 或 [GitHub Releases](https://github.com/termux/termux-app/releases)。

</details>

<details>
<summary><b>如何更新 Claude Code？</b></summary>

```bash
claude-update
```

</details>

<details>
<summary><b>为什么用 musl 而非 glibc？</b></summary>

Anthropic 发布的 `linux-arm64-musl` 版本在提供正确加载器时可以在 Android 上运行。glibc 版本在 Android 上完全无法运行。

</details>

<details>
<summary><b>为什么不直接使用 `proot-distro`？</b></summary>

它很慢，会破坏 `claude` 的 bash 工具，并且需要维护一个完整的根文件系统。本安装器避免了所有这些。

</details>

---

<a id="contributing"></a>
## 🤝 贡献

完整指南请参阅 [CONTRIBUTING.zh.md](CONTRIBUTING.zh.md)。

- 🐛 **报告错误** — [提交 issue](https://github.com/Ryovx/Termux-Claude-Code/issues/new)
- 💡 **建议功能** — [发起讨论](https://github.com/Ryovx/Termux-Claude-Code/discussions)
- 🔧 **提交 pull request** — Fork、branch、commit、PR
- 🌐 **添加翻译** — 创建 `README.<lang>.md` 并在顶部链接

---

<a id="license"></a>
## 📜 许可证

本项目采用 **GNU General Public License v3.0 或更高版本**（SPDX: `GPL-3.0-or-later`）许可。完整文本请参阅 [LICENSE](LICENSE)。

### 🤝 开放创新网络 (OIN)

**Ryovx 是 [Open Innovation Network (OIN)](https://openinventionnetwork.com/) 的自豪成员** — 一个保护开源软件免受专利攻击的全球联盟。

根据 OIN 的使命以及我们对 Termux 社区的承诺，**Ryovx 的大多数服务产品均以 GNU GPLv3 发布**。

### 💚 道德请求 — 非法律限制

正如我们**完全免费**提供此工具一样，我们恳请您也这样做：**请保持免费**。

> **这是一个友好的请求，而非法律禁令。**
>
> 根据 GNU GPLv3，您**完全有权**使用、研究、修改、再分发甚至**销售**此软件 — 只要您遵守许可证条款。
>
> 您可以**做许可证允许的任何事情**。我们只是希望您选择尊重分享时的初衷。

### 🙏 如何支持本项目

- ⭐ **加星** 仓库
- 🐛 **报告** 错误和问题
- 💡 **建议** 新功能
- 🔧 **提交** pull request
- 📣 **分享** 给 Termux 社区
- 💬 **帮助** 讨论中的其他人

**如果您看到此软件违背此请求而被销售，请[提交 issue](https://github.com/Ryovx/Termux-Claude-Code/issues)** — 不是因为它违反了许可证，而是因为它违背了项目的精神。

---

<a id="author"></a>
## 👤 作者

<div align="center">

**Ryovx**

[![GitHub](https://img.shields.io/badge/GitHub-@Ryovx-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Ryovx)

*为 Termux 社区构建免费的原生工具。*

</div>

---

<div align="center">

**用 ❤️ 为 Termux 社区打造**

⭐ **如果这个项目为您节省了数小时的摸索时间，请考虑给仓库加星** ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=Ryovx/Termux-Claude-Code&type=Date)](https://star-history.com/#Ryovx/Termux-Claude-Code&Date)

<br/>

*不隶属于 Anthropic。Claude Code 是 Anthropic, PBC 的商标。*

</div>
