# Levitate Coder CLI

A lightweight, zero-dependency, keyless command-line AI coding assistant.

```
 _      _____     _  _____ _____  ___ _____ _____ 
| |    |  ___|   | ||_   _|_   _|/ _ \_   _|  ___|
| |    | |__ \ \ / /  | |   | | / /_\ \| | | |__  
| |    |  __| \ V /   | |   | | |  _  || | |  __| 
| |____| |___  \ _/  _| |_  | | | | | || | | |___ 
\_____/\____/   \_/  \___/  \_/ \_| |_/\_/ \____/ 
```

## Features
- **Keyless Operations**: No API keys, tokens, or registration needed.
- **Ultra-lightweight**: Under 4 KB file size.
- **Zero Dependencies**: Uses Python's standard library (`urllib` and `json`).
- **Free and Uncapped**: Queries open-source inference runners hosting Qwen-2.5 coding models.

---

## 💻 Installation

### Windows
1. Download `installers/install_windows.bat`.
2. Double-click to run it.
3. Open a new terminal and type `lev`.

### macOS
1. Download `installers/install_macos.command`.
2. Double-click the file to run it. (Right-click and select "Open" if macOS flags it as unsigned).
3. If prompt asks, add `~/.local/bin` to your shell PATH.

### Linux
1. Download `installers/install_linux.sh`.
2. Run it in terminal:
   ```bash
   bash install_linux.sh
   ```

---

## 🛠 Usage
Run the assistant by calling `lev` followed by your coding request:
```bash
lev write a python quicksort function
```
```bash
lev make a fetch request function in javascript
```
