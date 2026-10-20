<div align="center">

# 🚀 مثبّت Claude Code لـ Termux

**🌐 اللغات:** [🇬🇧 English](README.md) · [🇸🇦 العربية](README.ar.md) · [🇨🇳 中文](README.zh.md)

> 🔥 **شغّل Claude Code أصليًا على Termux — يعمل 100%، بدون proot 0%، أمر واحد وتكون جاهز!** 🚀

<br/>

[![الترخيص: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0)
[![المنصة: Termux](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android&logoColor=white)](#requirements)
[![المعمارية: aarch64](https://img.shields.io/badge/Architecture-aarch64-orange?style=for-the-badge&logo=arm&logoColor=white)](#requirements)

[![الإصدار](https://img.shields.io/github/v/release/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&label=Version&color=brightgreen)](https://github.com/Ryovx/Termux-Claude-Code/releases)
[![النجوم](https://img.shields.io/github/stars/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=yellow)](https://github.com/Ryovx/Termux-Claude-Code/stargazers)
[![التفرعات](https://img.shields.io/github/forks/Ryovx/Termux-Claude-Code?style=for-the-badge&logo=github&color=blue)](https://github.com/Ryovx/Termux-Claude-Code/network/members)

<br/>

**المثبّت الأصلي المفقود الذي يتيح تشغيل [Claude Code](https://claude.com/claude-code) على [Termux](https://termux.dev) — بدون `proot`، بدون `chroot`، بدون `patchelf`، بدون حاويات.**

[⚡ ثبّت في 10 ثوانٍ ↓](#quick-install)

</div>

---

<a id="toc"></a>
## 📖 جدول المحتويات

- [المميزات](#features)
- [التثبيت السريع](#quick-install)
- [المتطلبات](#requirements)
- [الاستخدام](#usage)
- [ما الذي يتم تثبيته](#what-gets-installed)
- [كيف يعمل](#how-it-works)
- [استكشاف الأخطاء](#troubleshooting)
- [إلغاء التثبيت](#uninstall)
- [الأسئلة الشائعة](#faq)
- [المساهمة](#contributing)
- [الترخيص](#license)
- [المؤلف](#author)

---

<a id="features"></a>
## ✨ المميزات

- 🚀 **تشغيل أصلي** — يشغّل الملف الثنائي `linux-arm64-musl` *الرسمي* المنشور من Anthropic.
- 🛡️ **بدون proot، بدون chroot** — لا حاويات، لا أجهزة افتراضية، لا محاكاة.
- 🔧 **بدون patchelf** — يتجنب عمدًا خطأ SIGSEGV الذي يحدث عند تعديل ملفات musl الثنائية على نواة Android.
- ⚡ **تثبيت بأمر واحد** — انسخ، الصق، انتهى.
- 🔄 **تحديثات ذكية** — `claude-update` يتخطى تنزيل 280 ميجابايت إذا كنت على أحدث إصدار.
- 💚 **إصلاح ذاتي** — `claude-fix` يستعيد المشغّل بعد `npm update` يدوي.
- 🧹 **إلغاء تثبيت نظيف** — `claude-uninstall` يزيل كل شيء.
- 🚫 **صفر تعديل على ملفات rc** — لا يلمس `~/.bashrc` أو `~/.zshrc`.

---

<a id="quick-install"></a>
## 🚀 التثبيت السريع

افتح Termux والصق **سطرًا واحدًا**:

```bash
curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh | bash
```

هذا كل شيء. عندما ينتهي، شغّل:

```bash
claude
```

> 💡 **تفضل مراجعة السكريبت أولاً؟** نزّله، اقرأه، ثم شغّله:
>
> ```bash
> curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh -o install.sh
> less install.sh
> bash install.sh
> ```

---

<a id="requirements"></a>
## 📋 المتطلبات

| المتطلب | التفاصيل |
|---|---|
| **Termux** | من [F-Droid](https://f-droid.org/en/packages/com.termux/) أو [GitHub Releases](https://github.com/termux/termux-app/releases) — **ليس** نسخة Play Store |
| **المعمارية** | `aarch64` (ARM64) فقط |
| **مساحة فارغة** | ~700 ميجابايت |
| **الإنترنت** | مطلوب أثناء التثبيت والتحديث |
| **Node.js** | يُثبّت تلقائيًا إذا كان مفقودًا |
| **Root** | ❌ **غير مطلوب** |

---

<a id="usage"></a>
## 💻 الاستخدام

بعد التثبيت، الأوامر التالية متاحة فورًا:

| الأمر | الوصف |
|---|---|
| `claude` | تشغيل Claude Code (جلسة تفاعلية) |
| `claude-update` | التحديث إلى أحدث إصدار من npm |
| `claude-fix` | استعادة المشغّل إذا تعطل |
| `claude-uninstall` | إزالة كل شيء |

### المصادقة عند أول تشغيل

**الخيار أ — مفتاح API (موصى به):**

```bash
export ANTHROPIC_API_KEY=sk-ant-...
claude
```

**الخيار ب — OAuth:**

```bash
claude /login
```

---

<a id="what-gets-installed"></a>
## 📦 ما الذي يتم تثبيته

| المسار | الغرض |
|---|---|
| `$PREFIX/bin/claude` | المشغّل (6 أسطر bash) |
| `$PREFIX/bin/claude-fix` | يستعيد المشغّل من القالب |
| `$PREFIX/bin/claude-update` | يحدّث إلى أحدث إصدار npm |
| `$PREFIX/bin/claude-uninstall` | يزيل كل شيء |
| `$PREFIX/lib/claude-musl/` | محمّل musl من Alpine + المكتبات |
| `$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude` | الملف الثنائي الرسمي 280 ميجابايت |

**لا شيء يُكتب خارج `$PREFIX`.**

---

<a id="how-it-works"></a>
## 🔧 كيف يعمل

Claude Code يشحن ملفًا ثنائيًا `linux-arm64-musl`. Termux يعمل على **Bionic libc** الخاص بـ Android، وليس musl. التنفيذ المباشر يفشل بـ:

```text
cannot execute: required file not found
```

**ما لا يعمل:**

- ❌ **`patchelf`** — يغيّر مفسّر ELF، لكن محمّل musl لا يزال يسبب SIGSEGV على نواة Android.
- ❌ **`proot` / `chroot`** — ثقيل، بطيء، ويكسر أداة bash في `claude`.
- ❌ **غلاف npm `claude-code-termux`** — معطوب مع Claude Code ≥ 2.1.x.

**ما يعمل (هذا المشروع):**

1. تنزيل **محمّل musl من Alpine** وملفات `.so` المرافقة إلى `$PREFIX/lib/claude-musl/`.
2. تنزيل **الملف الثنائي `linux-arm64-musl` الرسمي** من npm.
3. إنشاء **مشغّل من 6 أسطر** يزيل `LD_PRELOAD`، ويستدعي محمّل musl مع `--library-path`، وينفّذ الملف الثنائي الحقيقي.

هذا كل شيء. **بدون patchelf، بدون proot، بدون chroot، بدون سحر.**

---

<a id="troubleshooting"></a>
## 🐛 استكشاف الأخطاء

<details>
<summary><b>`claude: command not found` بعد التثبيت</b></summary>

```bash
hash -r
which claude
```

إذا كان لا يزال مفقودًا، شغّل `claude-fix`.

</details>

<details>
<summary><b>`claude` تعطل بعد `npm update -g`</b></summary>

```bash
claude-fix
```

أو استخدم المحدّث المدمج:

```bash
claude-update
```

</details>

<details>
<summary><b>`Error relocating ... libtermux-exec-ld-preload.so`</b></summary>

المشغّل يتعامل مع هذا عبر `env -u LD_PRELOAD`. إذا رأيت هذا، فهذا يعني أن أحدًا تجاوز المشغّل وشغّل الملف الثنائي مباشرة. استخدم `claude` وليس المسار المباشر.

</details>

<details>
<summary><b>Segmentation fault (SIGSEGV)</b></summary>

من المحتمل أنك تشغّل ملفًا ثنائيًا معدّلًا بـ `patchelf` من تثبيت قديم. أعد التثبيت النظيف:

```bash
bash install.sh --force
```

</details>

---

<a id="uninstall"></a>
## 🧹 إلغاء التثبيت

**أمر واحد:**

```bash
claude-uninstall
```

أو، إذا كان لديك `install.sh` محليًا:

```bash
bash install.sh --uninstall
```

---

<a id="faq"></a>
## ❓ الأسئلة الشائعة

<details>
<summary><b>هل يعمل على x86_64 أو armv7؟</b></summary>

لا. فقط `aarch64` (ARM64).

</details>

<details>
<summary><b>هل يعدّل إعدادات shell الخاصة بي؟</b></summary>

**لا.** جميع الأوامر ملفات تنفيذية حقيقية في `$PREFIX/bin`، وليست دوال shell.

</details>

<details>
<summary><b>هل يتطلب root؟</b></summary>

**لا.**

</details>

<details>
<summary><b>هل يعمل مع نسخة Play Store من Termux؟</b></summary>

لا. استخدم [F-Droid](https://f-droid.org/en/packages/com.termux/) أو [GitHub Releases](https://github.com/termux/termux-app/releases).

</details>

<details>
<summary><b>كيف أحدّث Claude Code؟</b></summary>

```bash
claude-update
```

</details>

<details>
<summary><b>لماذا musl وليس glibc؟</b></summary>

Anthropic تنشر بناء `linux-arm64-musl` يعمل على Android عند توفير المحمّل الصحيح. بناء glibc لا يعمل على Android إطلاقًا.

</details>

<details>
<summary><b>لماذا لا أستخدم `proot-distro` فقط؟</b></summary>

إنه بطيء، ويكسر أداة bash في `claude`، ويتطلب الاحتفاظ بنظام ملفات جذري كامل. هذا المثبّت يتجنب كل ذلك.

</details>

---

<a id="contributing"></a>
## 🤝 المساهمة

راجع [CONTRIBUTING.ar.md](CONTRIBUTING.ar.md) للحصول على الإرشادات الكاملة.

- 🐛 **الإبلاغ عن الأخطاء** — [افتح issue](https://github.com/Ryovx/Termux-Claude-Code/issues/new)
- 💡 **اقتراح ميزات** — [ابدأ نقاشًا](https://github.com/Ryovx/Termux-Claude-Code/discussions)
- 🔧 **إرسال pull requests** — Fork, branch, commit, PR
- 🌐 **إضافة ترجمات** — أنشئ `README.<lang>.md` واربطه في الأعلى

---

<a id="license"></a>
## 📜 الترخيص

هذا المشروع مرخّص تحت **GNU General Public License v3.0 أو أحدث** (SPDX: `GPL-3.0-or-later`). راجع [LICENSE](LICENSE) للنص الكامل.

### 🤝 Open Innovation Network (OIN)

**Ryovx عضو فخور في [Open Innovation Network (OIN)](https://openinventionnetwork.com/)** — تحالف عالمي يحمي البرمجيات مفتوحة المصدر من الاعتداءات على براءات الاختراع.

تماشيًا مع مهمة OIN والتزامنا بمجتمع Termux، **تُصدر معظم منتجات Ryovx الخدمية تحت GNU GPLv3**.

### 💚 طلب أخلاقي — ليس قيدًا قانونيًا

تمامًا كما نقدم هذه الأداة **مجانًا تمامًا**، نرجو منك أن تفعل الشيء نفسه: **يرجى إبقاءها مجانية**.

> **هذا طلب ودي، وليس حظرًا قانونيًا.**
>
> بموجب GNU GPLv3، لديك **الحق الكامل** في استخدام ودراسة وتعديل وإعادة توزيع وحتى **بيع** هذا البرنامج — بشرط الامتثال لشروط الترخيص.
>
> يمكنك فعل **كل ما يسمح به الترخيص**. نحن نأمل فقط أن تختار احترام الروح التي شاركنا بها.

### 🙏 كيف يمكنك دعم هذا المشروع

- ⭐ **أضف نجمة** للمستودع
- 🐛 **أبلغ** عن الأخطاء والمشكلات
- 💡 **اقترح** ميزات جديدة
- 🔧 **أرسل** pull requests
- 📣 **شارك** مع مجتمع Termux
- 💬 **ساعد** الآخرين في المناقشات

**إذا رأيت هذا البرنامج يُباع ضد هذا الطلب، يرجى [فتح issue](https://github.com/Ryovx/Termux-Claude-Code/issues)** — ليس لأنه ينتهك الترخيص، بل لأنه ينتهك روح المشروع.

---

<a id="author"></a>
## 👤 المؤلف

<div align="center">

**Ryovx**

[![GitHub](https://img.shields.io/badge/GitHub-@Ryovx-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Ryovx)

*نبني أدوات أصلية مجانية لمجتمع Termux.*

</div>

---

<div align="center">

**صُنع بـ ❤️ لمجتمع Termux**

⭐ **إذا وفّر عليك هذا المشروع ساعات من التجربة والخطأ، فكّر في إضافة نجمة للمستودع** ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=Ryovx/Termux-Claude-Code&type=Date)](https://star-history.com/#Ryovx/Termux-Claude-Code&Date)

<br/>

*غير تابع لـ Anthropic. Claude Code علامة تجارية لـ Anthropic, PBC.*

</div>
