# aishort — Cursor skill: short-term quant + AI (research only)

Educational Cursor Agent Skill for **short-horizon** equity discussion using common **technical / quant-style** indicators plus **AI synthesis** of conflicting signals. **Not** investment advice; **no** trade execution.

**Default GitHub repo:** [https://github.com/kfqylf/aishort](https://github.com/kfqylf/aishort)

---

## 中文：别人只有链接怎么用（Windows）

**说明：** 点链接打开的是网页，**不会**自动装进 Cursor。对方任选一种方式即可。

### 方式 A：一条命令（推荐，已装 Git 可忽略）

1. 安装 Git：[https://git-scm.com/download/win](https://git-scm.com/download/win)  
2. 在 **PowerShell** 里执行（会把仓库克隆到桌面 `aishort` 并安装 skill）：

```powershell
cd $env:USERPROFILE\Desktop
git clone https://github.com/kfqylf/aishort.git aishort
cd aishort
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

### 方式 B：不装 Git，只给链接

1. 浏览器打开 ZIP：  
   [https://github.com/kfqylf/aishort/archive/refs/heads/main.zip](https://github.com/kfqylf/aishort/archive/refs/heads/main.zip)  
2. 解压到例如：`C:\Users\你的用户名\Desktop\aishort`  
3. 进入该文件夹，**空白处 Shift+右键** →「在此处打开 PowerShell 窗口」，执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

### 方式 C：一行下载安装脚本再执行（需已 push 到 GitHub）

把脚本下载到临时目录再运行（比直接 `Invoke-Expression` 网上脚本更可控）：

```powershell
$f = Join-Path $env:TEMP "aishort-install-from-github.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kfqylf/aishort/main/install-from-github.ps1" -OutFile $f -UseBasicParsing
powershell -ExecutionPolicy Bypass -File $f
```

若 `raw.githubusercontent.com` 404，说明仓库还没包含该文件，请先用方式 A 或 B，或在解压后的文件夹里运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\install-from-github.ps1
```

装好后：**完全退出 Cursor 再打开**，或命令面板执行 **Reload Window**。

---

## English: Install (Cursor)

**Personal (all projects):** run `install.ps1` from this repo root, or copy `stock-short-term-quant/SKILL.md` into:

- Windows: `%USERPROFILE%\.cursor\skills\stock-short-term-quant\SKILL.md`
- macOS / Linux: `~/.cursor/skills/stock-short-term-quant/SKILL.md`

**Single project only:** copy the folder `stock-short-term-quant` into:

`<your-repo>/.cursor/skills/stock-short-term-quant/`

Restart Cursor or reload the window.

---

## Repo layout

- `stock-short-term-quant/SKILL.md` — skill source (canonical)
- `install.ps1` — copy skill into Cursor user skills folder (local folder)
- `install-from-github.ps1` — download default repo ZIP and install (optional `-ZipUrl`)

If your GitHub root still has a flat `SKILL.md` from an older push, `install.ps1` will still find it.

---

## Publish / update GitHub

```powershell
cd $env:USERPROFILE\Desktop\aishort
git add .
git commit -m "Update skill package"
git push
```

---

## License

See `LICENSE` (MIT).
