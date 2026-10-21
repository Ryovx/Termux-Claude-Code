# المساهمة في مثبّت Claude Code لـ Termux

شكرًا لاهتمامك بالمساهمة! 🎉

## كيفية المساهمة

### 🐛 الإبلاغ عن الأخطاء

قبل فتح issue، يرجى:

1. **البحث في issues الموجودة** لتجنب التكرار.
2. **تشغيل `claude doctor`** وتضمين الناتج.
3. **تضمين إصدار Termux** وإصدار Android وطراز الجهاز.
4. **إذا كان DNS معنيًا**، ضمّن `$PREFIX/etc/resolv.conf`.

افتح issue على: [https://github.com/Ryovx/Termux-Claude-Code/issues/new](https://github.com/Ryovx/Termux-Claude-Code/issues/new)

### 💡 اقتراح ميزات

ابدأ نقاشًا على: [https://github.com/Ryovx/Termux-Claude-Code/discussions](https://github.com/Ryovx/Termux-Claude-Code/discussions)

### 🔧 إرسال Pull Requests

1. **اعمل Fork** للمستودع.
2. **أنشئ فرعًا** من `main`:

````bash
git checkout -b feature/your-feature-name
````

3. **قم بإجراء تغييراتك.**
4. **اختبر على تثبيت Termux نظيف** — بما في ذلك حل DNS:

````bash
claude -p "say hello"
````

5. **شغّل فحص الصيغة:**

````bash
bash -n install.sh
````

6. **قم بعمل commit** برسالة واضحة:

````bash
git commit -m "feat: add support for X"
````

7. **ادفع** وافتح **Pull Request**.

## إرشادات التطوير

- اجعل المثبّت **idempotent** — تشغيله مرتين يجب أن ينتج نفس النتيجة.
- اجعله **آمنًا** — لا تعدّل ملفات خارج `$PREFIX` أبدًا.
- لا تعدّل `~/.bashrc` أو `~/.zshrc` أبدًا.
- لا تتجاوز **التحقق بـ SHA256** لبيئة musl أبدًا.
- لا تثبّت محمّل musl ليس من `Ryovx/Musl-on-Termux` أبدًا.
- احتفظ دائمًا بـ `$PREFIX/etc/resolv.conf` الموجود.
- اختبر حل DNS بعد التثبيت — وليس فقط `claude --version`.
- اختبر على تثبيت Termux نظيف قبل الإرسال.
- تحقق بـ `bash -n install.sh` قبل كل commit.
- اتبع نمط الكود الحالي (مسافة بادئة 2، بدون tabs).

## اتفاقية رسائل Commit

نتبع [Conventional Commits](https://www.conventionalcommits.org/):

| النوع | الوصف |
|---|---|
| `feat` | ميزة جديدة |
| `fix` | إصلاح خطأ |
| `docs` | توثيق فقط |
| `style` | تنسيق، بدون تغيير كود |
| `refactor` | تغيير كود لا يصلح خطأ ولا يضيف ميزة |
| `test` | إضافة أو تحديث اختبارات |
| `chore` | مهام صيانة |

## الترجمات

تريد إضافة ترجمة؟ أنشئ ملفًا باسم `README.<lang>.md` واربطه في أعلى ملفات README الموجودة. افعل الشيء نفسه لـ `CONTRIBUTING.<lang>.md` و `SECURITY.<lang>.md` و `SUPPORT.<lang>.md` و `CODE_OF_CONDUCT.<lang>.md`.

المدعومة حاليًا:

- 🇬🇧 الإنجليزية (`README.md`، `CONTRIBUTING.md`، `SECURITY.md`، `SUPPORT.md`، `CODE_OF_CONDUCT.md`)
- 🇸🇦 العربية (`README.ar.md`، `CONTRIBUTING.ar.md`، `SECURITY.ar.md`، `SUPPORT.ar.md`، `CODE_OF_CONDUCT.ar.md`)
- 🇨🇳 الصينية (`README.zh.md`، `CONTRIBUTING.zh.md`، `SECURITY.zh.md`، `SUPPORT.zh.md`، `CODE_OF_CONDUCT.zh.md`)

## مدونة قواعد السلوك

بالمشاركة، فإنك توافق على الالتزام بـ [مدونة قواعد السلوك](CODE_OF_CONDUCT.ar.md).

## أسئلة؟

افتح نقاشًا أو تواصل مع [@Ryovx](https://github.com/Ryovx).

---

شكرًا لمساعدتك في جعل Termux مكانًا أفضل لـ Claude Code! 🚀
