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
- 🌐 **DNS 开箱即用** — 附带修补过的 musl 加载器，读取 `$PREFIX/etc/resolv.conf`，必要时回退到公共 DNS。
- 🔐 **供应链验证** — musl 运行时从已签名的 GitHub 发布下载，并在安装前根据固定的 SHA256 进行验证。
- ⚡ **一条命令安装** — 复制、粘贴、完成。
- 🔄 **智能更新** — 如果已是最新版本，`claude-update` 会跳过 280 MB 的下载。
- 💚 **自我修复** — 手动 `npm update` 后，`claude-fix` 会恢复启动器。
- 🧹 **干净卸载** — `claude-uninstall` 会删除所有内容。
- 🚫 **零 rc 文件修改** — 从不触碰 `~/.bashrc` 或 `~/.zshrc`。

---

<a id="quick-install"></a>
## 🚀 快速安装

打开 Termux 并粘贴**一行**：

````bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh | bash
````

就这样。完成后，运行：

````bash
claude
````

> 💡 **想先审查脚本？** 下载、阅读，然后运行：
>
> ````bash
> curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh -o install.sh
> less install.sh
> bash install.sh
> ````

---

<a id="requirements"></a>
## 📋 系统要求

| 要求 | 详情 |
|---|---|
| **Termux** | 来自 [F-Droid](https://f-droid.org/en/packages/com.termux/) 或 [GitHub Releases](https://github.com/termux/termux-app/releases) — **不是** Play Store 版本 |
| **架构** | 仅限 `aarch64` (ARM64) |
| **可用空间** | 安装时峰值约 800 MB（稳态约 700 MB） |
| **网络** | 安装和更新时需要 |
| **软件包** | `curl`、`tar`、`unzip`、`node`、`npm`、`file` — 缺失时自动安装 |
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

````bash
export ANTHROPIC_API_KEY=sk-ant-...
claude
````

**方式 B — OAuth：**

````bash
claude /login
````

---

<a id="what-gets-installed"></a>
## 📦 安装内容

| 路径 | 用途 |
|---|---|
| `$PREFIX/bin/claude` | 启动器（6 行 bash） |
| `$PREFIX/bin/claude-fix` | 从模板恢复启动器 |
| `$PREFIX/bin/claude-update` | 更新到最新的 npm 版本 |
| `$PREFIX/bin/claude-uninstall` | 删除所有内容 |
| `$PREFIX/lib/claude-musl/` | 修补过的 musl 加载器 + 库 |
| `$PREFIX/lib/claude-musl/launcher.template` | `claude-fix` 的真相之源 |
| `$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude` | 官方 280 MB 二进制文件 |
| `$PREFIX/etc/resolv.conf` | musl 的 DNS 配置（缺失时创建） |

**不会在 `$PREFIX` 之外写入任何内容。**

---

<a id="how-it-works"></a>
## 🔧 工作原理

Claude Code 附带 `linux-arm64-musl` ELF 二进制文件。Termux 运行在 **Android 的 Bionic libc** 上，而非 musl。直接执行会失败：

````text
cannot execute: required file not found
````

### 为什么不用上游 musl？

上游 musl 读取 `/etc/resolv.conf` 进行 DNS。在 Termux 中，该文件既不可读也不可写，而 Android 通过 `netd` 系统服务路由 DNS。结果：基于 musl 的程序**无法解析任何内容**，并出现 `EAI_AGAIN` 或 `getaddrinfo ENOTFOUND`。

### 不可行的方法

- ❌ **`patchelf`** — 更改 ELF 解释器，但 musl 加载器在 Android 内核上仍会 SIGSEGV。
- ❌ **`proot` / `chroot`** — 笨重、缓慢，且会破坏 `claude` 的 bash 工具。
- ❌ **npm 包装器 `claude-code-termux`** — 在 Claude Code ≥ 2.1.x 中已失效。
- ❌ **上游 musl** — 安装正常，但每次 DNS 查找都失败。

### 可行的方法（本项目）

本安装器附带来自 [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux)（MIT 许可）的**修补过的 musl 运行时**。修补添加了两个改进：

1. **`MUSL_ON_TERMUX=1`** — 使加载器首先读取 `$PREFIX/etc/resolv.conf`。
2. **确定性回退** — 如果未找到名称服务器，则使用 `1.1.1.1`，然后 `8.8.8.8`，然后 `127.0.0.1`。

然后安装器：

1. 从 GitHub 发布下载**修补过的 musl 运行时**。
2. 根据固定的 SHA256 进行**验证**。任何不匹配都会中止安装。
3. 从 npm 下载**官方 `linux-arm64-musl` 二进制文件**。
4. 创建一个 **6 行启动器**，它会：
   - 取消设置 `LD_PRELOAD`。
   - 设置 `MUSL_ON_TERMUX=1` 使 DNS 工作。
   - 使用 `--library-path` 调用 musl 加载器。
   - 执行真正的二进制文件。

**无需 patchelf、无需 proot、无需 chroot、无魔法。**

---

<a id="troubleshooting"></a>
## 🐛 故障排除

<details>
<summary><b>安装后出现 `claude: command not found`</b></summary>

````bash
hash -r
which claude
````

如果仍然缺失，运行 `claude-fix`。

</details>

<details>
<summary><b>`npm update -g` 后 `claude` 损坏</b></summary>

````bash
claude-fix
````

或使用内置更新器：

````bash
claude-update
````

</details>

<details>
<summary><b>DNS 错误：`EAI_AGAIN`、`getaddrinfo`、`ENOTFOUND`</b></summary>

如果您从 v1.x 升级，您使用的是没有 DNS 修补的上游 musl。强制重新安装以获取修补过的加载器：

````bash
bash install.sh --force
````

验证 `$PREFIX/etc/resolv.conf` 存在：

````bash
cat "$PREFIX/etc/resolv.conf"
````

如果为空，重新创建它：

````bash
printf 'nameserver 1.1.1.1\nnameserver 8.8.8.8\n' > "$PREFIX/etc/resolv.conf"
````

</details>

<details>
<summary><b>`Error relocating ... libtermux-exec-ld-preload.so`</b></summary>

启动器通过 `env -u LD_PRELOAD` 处理此问题。请使用 `claude`，而非原始二进制路径。

</details>

<details>
<summary><b>段错误 (SIGSEGV)</b></summary>

您可能正在运行来自旧安装的 `patchelf` 修改过的二进制文件。强制重新安装：

````bash
bash install.sh --force
````

</details>

<details>
<summary><b>安装时 SHA256 不匹配</b></summary>

下载的 musl 运行时与固定的 SHA256 不匹配。**不要绕过此检查**。重新运行安装器；如果问题持续，请提交包含完整错误的 issue。

</details>

---

<a id="uninstall"></a>
## 🧹 卸载

**一条命令：**

````bash
claude-uninstall
````

或者，如果您本地还有 `install.sh`：

````bash
bash install.sh --uninstall
````

---

<a id="faq"></a>
## ❓ 常见问题

<details>
<summary><b>支持 x86_64 或 armv7 吗？</b></summary>

不支持。仅限 `aarch64` (ARM64)。

</details>

<details>
<summary><b>会修改我的 shell 配置吗？</b></summary>

**不会。** 所有命令都是 `$PREFIX/bin` 中的真实可执行文件。

</details>

<details>
<summary><b>需要 root 吗？</b></summary>

**不需要。**

</details>

<details>
<summary><b>为什么用 musl 而非 glibc？</b></summary>

Anthropic 发布的 `linux-arm64-musl` 版本在提供正确加载器时可以在 Android 上运行。glibc 版本在 Android 上完全无法运行。

</details>

<details>
<summary><b>为什么用修补过的 musl 而非上游 musl？</b></summary>

上游 musl 读取 `/etc/resolv.conf`，而 Termux 不提供该文件。没有修补，每次 DNS 查找都失败（`EAI_AGAIN`）。来自 [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux) 的修补加载器添加了两个改进：

1. 当设置 `MUSL_ON_TERMUX=1` 时，它读取 `$PREFIX/etc/resolv.conf`。
2. 如果未找到名称服务器，则使用 `1.1.1.1 → 8.8.8.8 → 127.0.0.1` 作为回退。

启动器自动设置 `MUSL_ON_TERMUX=1`。

</details>

<details>
<summary><b>修补过的 musl 运行时安全吗？</b></summary>

安装器在使用前会根据**固定的 SHA256** 进行验证。任何不匹配都会中止安装。源代码可在 [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux) 以 MIT 许可证获取。

</details>

<details>
<summary><b>为什么不直接使用 `proot-distro`？</b></summary>

它很慢，会破坏 `claude` 的 bash 工具，并且需要维护一个完整的根文件系统。

</details>

---

<a id="contributing"></a>
## 🤝 贡献

完整指南请参阅 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

<a id="license"></a>
## 📜 许可证

本项目采用 **GNU General Public License v3.0 或更高版本**（SPDX: `GPL-3.0-or-later`）许可。完整文本请参阅 [LICENSE](LICENSE)。

本安装器附带的修补过的 musl 运行时是独立作品，在 **MIT 许可证**下发布。详情请参阅 [Ryovx/Musl-on-Termux](https://github.com/Ryovx/Musl-on-Termux)。

### 🤝 开放发明网络 (OIN)

**Ryovx 是 [Open Invention Network (OIN)](https://openinventionnetwork.com/) 的自豪成员** — 一个保护开源软件免受专利攻击的全球联盟。

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
