# Levitate CLI AI Installer

Levitate is a lightweight (under 4 KB), zero-dependency, and keyless coding AI that runs directly in your command line.

This folder contains installer files tailored for Windows, macOS, and Linux.

---

## 💻 Installation Instructions

### 1. Windows
1. Double-click the **`install_windows.bat`** file.
2. The installer will copy `lev` to your system and automatically configure your User `PATH` environment variable.
3. Open a **new terminal** and run:
   ```cmd
   lev write a python quicksort
   ```

### 2. macOS
1. Double-click the **`install_macos.command`** file.
2. If macOS warns you about running an unsigned script, right-click (or Control-click) the file, select **Open**, and click **Open** again to confirm.
3. The installer will copy the execution files to `~/.local/bin/`.
4. If `~/.local/bin/` is not already in your system PATH, Zsh path instructions will be printed in the installer terminal.

### 3. Linux
1. Open your terminal in this directory.
2. Run the installer script:
   ```bash
   bash install_linux.sh
   ```
3. Follow the onscreen instructions to add `~/.local/bin/` to your shell PATH if needed.

---

## 🛠 Prerequisites
* **Python 3.x** must be installed on your machine.
