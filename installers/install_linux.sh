#!/usr/bin/env bash

clear
echo "===================================================="
echo "         Levitate Coding AI Installer (Linux)"
echo "===================================================="
echo

# 1. Verify Python 3
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 is required but was not found."
    echo "Please install python3 using your package manager (apt, pacman, dnf, etc.)"
    exit 1
fi

# 2. Define install folder
INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"

# 3. Create lev.py
echo "Writing lev.py..."
cat << 'EOF' > "$INSTALL_DIR/lev.py"
import os
import sys
import json
import pathlib
import urllib.request
import urllib.error

SYSTEM_INSTRUCTION = """
You are Levitate, an elite, high-performance programming assistant. 
Your goal is to provide exceptionally clean, efficient, and production-ready code.
- Focus strictly on the code, architecture, and technical implementation.
- Avoid unnecessary conversational filler, warnings, or basic explanations unless explicitly asked.
- Provide code blocks with correct syntax highlighting.
- Prioritize modern best practices, optimal time/space complexity, and robust error handling.
"""

def main():
    args = sys.argv[1:]
    if not args:
        print("\033[1;35m" + r"""
 _      _____     _  _____ _____  ___ _____ _____ 
| |    |  ___|   | ||_   _|_   _|/ _ \_   _|  ___|
| |    | |__ \ \ / /  | |   | | / /_\ \| | | |__  
| |    |  __| \ V /   | |   | | |  _  || | |  __| 
| |____| |___  \ _/  _| |_  | | | | | || | | |___ 
\_____/\____/   \_/  \___/  \_/ \_| |_/\_/ \____/ 
""" + "\033[0m")
        print("\033[1;36m=== Levitate Coding AI ===\033[0m")
        print("Usage: lev <your coding prompt>")
        print("Example: lev write a python script to parse logs\n")
        sys.exit(0)
        
    prompt = " ".join(args)
    print("\nThinking...", end="", flush=True)

    # Keyless free endpoint using Pollinations.ai (hosting Qwen-2.5 coding models)
    url = "https://text.pollinations.ai/"
    
    payload = {
        "messages": [
            {"role": "system", "content": SYSTEM_INSTRUCTION},
            {"role": "user", "content": prompt}
        ],
        "model": "qwen"
    }
    
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=data,
        headers={"Content-Type": "application/json"}
    )
    
    try:
        with urllib.request.urlopen(req) as response:
            res_text = response.read().decode("utf-8")
            print("\r           \r") # Clear thinking line
            print(res_text)
    except urllib.error.HTTPError as e:
        print(f"\nHTTP Error {e.code}: {e.reason}")
        try:
            error_details = e.read().decode("utf-8")
            print("Details:", error_details)
        except:
            pass
    except Exception as e:
        print(f"\nError connecting to API: {e}")

if __name__ == "__main__":
    main()
EOF

# 4. Create launcher shell script
echo "Writing launcher..."
cat << 'EOF' > "$INSTALL_DIR/lev"
#!/usr/bin/env bash
python3 "$HOME/.local/bin/lev.py" "$@"
EOF

# 5. Make files executable
chmod +x "$INSTALL_DIR/lev"
chmod +x "$INSTALL_DIR/lev.py"

echo
echo "[SUCCESS] Levitate has been installed to $INSTALL_DIR"
echo

# 6. Check PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "===================================================="
    echo "          [ACTION REQUIRED] Update your PATH"
    echo "===================================================="
    echo "To run the 'lev' command, add '$INSTALL_DIR' to your PATH."
    echo
    echo "For Zsh/Bash (Linux):"
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc && source ~/.bashrc"
    echo "===================================================="
else
    echo "===================================================="
    echo "  Levitate is ready! Open a new terminal and run:"
    echo "  lev"
    echo "===================================================="
fi
echo
