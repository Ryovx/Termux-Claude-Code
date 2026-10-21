# 为 Termux Claude Code 安装器做贡献

感谢您有兴趣做出贡献！🎉

## 如何贡献

### 🐛 报告错误

在打开 issue 之前，请：

1. **搜索现有 issues** 以避免重复。
2. **运行 `claude doctor`** 并包含输出。
3. **包含您的 Termux 版本**、Android 版本和设备型号。
4. **如果涉及 DNS**，请包含 `$PREFIX/etc/resolv.conf`。

在以下地址打开 issue：[https://github.com/Ryovx/Termux-Claude-Code/issues/new](https://github.com/Ryovx/Termux-Claude-Code/issues/new)

### 💡 建议功能

在以下地址发起讨论：[https://github.com/Ryovx/Termux-Claude-Code/discussions](https://github.com/Ryovx/Termux-Claude-Code/discussions)

### 🔧 提交 Pull Request

1. **Fork** 仓库。
2. 从 `main` **创建分支**：

````bash
git checkout -b feature/your-feature-name
````

3. **进行更改。**
4. **在干净的 Termux 安装上测试** — 包括 DNS 解析：

````bash
claude -p "say hello"
````

5. **运行语法检查：**

````bash
bash -n install.sh
````

6. **提交**并附上清晰的提交信息：

````bash
git commit -m "feat: add support for X"
````

7. **推送**并打开 **Pull Request**。

## 开发指南

- 保持安装器 **幂等** — 运行两次必须产生相同的结果。
- 保持 **安全** — 绝不要修改 `$PREFIX` 之外的文件。
- 绝不要修改 `~/.bashrc` 或 `~/.zshrc`。
- 绝不绕过 musl 运行时的 **SHA256 校验**。
- 绝不安装不是来自 `Ryovx/Musl-on-Termux` 的 musl 加载器。
- 始终保留现有的 `$PREFIX/etc/resolv.conf`。
- 安装后测试 DNS 解析 — 不只是 `claude --version`。
- 在提交前在干净的 Termux 安装上测试。
- 每次提交前用 `bash -n install.sh` 验证。
- 遵循现有代码风格（2 空格缩进，不使用制表符）。

## 提交信息约定

我们遵循 [Conventional Commits](https://www.conventionalcommits.org/)：

| 类型 | 描述 |
|---|---|
| `feat` | 新功能 |
| `fix` | 错误修复 |
| `docs` | 仅文档 |
| `style` | 格式，无代码更改 |
| `refactor` | 既不修复错误也不添加功能的代码更改 |
| `test` | 添加或更新测试 |
| `chore` | 维护任务 |

## 翻译

想添加翻译？创建一个名为 `README.<lang>.md` 的文件，并在现有 README 的顶部链接它。为 `CONTRIBUTING.<lang>.md`、`SECURITY.<lang>.md`、`SUPPORT.<lang>.md` 和 `CODE_OF_CONDUCT.<lang>.md` 做同样的处理。

目前支持：

- 🇬🇧 英语 (`README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `SUPPORT.md`, `CODE_OF_CONDUCT.md`)
- 🇸🇦 阿拉伯语 (`README.ar.md`, `CONTRIBUTING.ar.md`, `SECURITY.ar.md`, `SUPPORT.ar.md`, `CODE_OF_CONDUCT.ar.md`)
- 🇨🇳 中文 (`README.zh.md`, `CONTRIBUTING.zh.md`, `SECURITY.zh.md`, `SUPPORT.zh.md`, `CODE_OF_CONDUCT.zh.md`)

## 行为准则

参与即表示您同意遵守我们的[行为准则](CODE_OF_CONDUCT.zh.md)。

## 有问题？

打开讨论或联系 [@Ryovx](https://github.com/Ryovx)。

---

感谢您帮助让 Termux 成为 Claude Code 更好的地方！🚀
