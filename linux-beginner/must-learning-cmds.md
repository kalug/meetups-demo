# 基礎指令 (Base Commands)

## 檔案 (File Management)

- **`file`**
  - **用途:** 判斷檔案的類型。
  - **用法:** `file <檔名>`
  - **範例:** `file /etc/passwd`

- **`which`**
  - **用途:** 在使用者 PATH 環境變數中尋找指令的可執行二進位檔案。
  - **用法:** `which <指令名稱>`
  - **範例:** `which python3`

- **`whereis`**
  - **用途:** 定位指令的二進位檔案、原始碼和手冊頁檔案。
  - **用法:** `whereis <指令名稱>`
  - **範例:** `whereis ls`

- **`command`**
  - **用途:** 執行指令，繞過 shell 別名和函數。確保執行原始指令。
  - **用法:** `command <指令名稱> [參數]`
  - **範例:** `command ls -l`

## process (程序管理)

- **`ps`**
  - **用途:** 報告當前程序的快照。
  - **常用選項:**
    - `-e`: 選擇所有程序。
    - `-f`: 完整格式列表。
    - `-a`: 顯示所有使用者的程序。
    - `-u`: 顯示屬於指定使用者的程序。
    - `-x`: 顯示未連結到終端機的程序。
  - **用法:** `ps [選項]`
  - **範例:** `ps aux` (顯示所有程序，包括其他使用者的，以及完整格式)

- **`pstree`**
  - **用途:** 以樹狀圖顯示正在運行的程序。
  - **用法:** `pstree [選項] [pid]`
  - **範例:** `pstree -p` (顯示 PID)

- **`top`**
  - **用途:** 動態實時顯示正在運行的程序。
  - **用法:** `top` (按 `q` 鍵退出)

- **`kill`**
  - **用途:** 向程序發送訊號，通常是為了終止它。
  - **常用訊號:**
    - `1` (HUP): 掛斷 (重啟程序)
    - `2` (INT): 中斷 (Ctrl+C 等效)
    - `9` (KILL): 無條件終止 (無法被捕獲或忽略)
    - `15` (TERM): 終止 (預設，允許程序清理資源)
  - **用法:** `kill [-訊號] <pid>`
  - **範例:** `kill 1234` (向 PID 1234 發送 SIGTERM), `kill -9 5678` (強制終止 PID 5678)

## 權限 (Permissions)

- **`id`**
  - **用途:** 列印真實和有效的用戶和群組 ID。
  - **用法:** `id [使用者名稱]`
  - **範例:** `id` (顯示當前使用者的 ID), `id root`

- **`chmod`**
  - **用途:** 更改檔案權限。
  - **模式:**
    - **符號模式 (Symbolic):** `u` (使用者), `g` (群組), `o` (其他), `a` (所有)
    - **權限:** `r` (讀取), `w` (寫入), `x` (執行)
    - **操作符:** `+` (增加), `-` (移除), `=` (精確設定)
    - **八進位模式 (Octal):** 3 位數字，每位數字代表使用者、群組和其他 (例如，`755` = 使用者 rwx，群組和其他 rx)。
      - `r=4, w=2, x=1`
  - **用法 (符號模式):** `chmod [ugoa][+-=][rwx] <檔名>`
  - **範例 (符號模式):** `chmod u+x myscript.sh` (為使用者增加執行權限), `chmod go-w myfile.txt` (移除群組和其他的寫入權限)
  - **用法 (八進位模式):** `chmod <八進位權限> <檔名>`
  - **範例 (八進位模式):** `chmod 755 myscript.sh` (使用者 rwx，群組和其他 rx)

# pkg related (套件管理相關)

## system (系統套件管理)

- **`dpkg`** (Debian-based systems, 低階套件工具)
  - **用途:** 管理 .deb 格式的軟體包。它是一個低階工具，不處理依賴關係。
  - **常用選項:**
    - `-i`: 安裝一個 .deb 軟體包。
    - `-r`: 移除一個軟體包 (保留設定檔)。
    - `-P`: 徹底清除一個軟體包 (移除設定檔)。
    - `-L`: 列出一個軟體包安裝的所有檔案。
    - `-s`: 顯示軟體包的狀態資訊。
  - **用法:** `dpkg [選項] <套件檔案>`
  - **範例:** `dpkg -i myapp.deb`, `dpkg -r myapp`

- **`apt`** (Debian-based systems, 高階套件工具)
  - **用途:** 進階套件工具，用於管理 Debian/Ubuntu 系統上的軟體包，處理依賴關係。
  - **常用指令:**
    - `update`: 更新可用的套件列表 (但不安裝新版軟體)。
    - `upgrade`: 安裝所有可升級的軟體包。
    - `install`: 安裝新軟體包。
    - `remove`: 移除軟體包。
    - `purge`: 徹底清除軟體包及相關設定檔。
    - `search`: 搜尋軟體包。
    - `autoremove`: 移除不再需要的依賴套件。
  - **用法:** `apt [指令] [套件名稱]`
  - **範例:** `apt update`, `apt install nginx`, `apt remove apache2`

- **`rpm`** (Red Hat-based systems, 低階套件工具)
  - **用途:** 管理 .rpm 格式的軟體包。它是一個低階工具，不處理依賴關係。
  - **常用選項:**
    - `-i`: 安裝一個 .rpm 軟體包。
    - `-e`: 移除一個軟體包。
    - `-q`: 查詢軟體包。
    - `-U`: 升級一個軟體包。
    - `-l`: 列出軟體包中的檔案。
  - **用法:** `rpm [選項] <套件檔案>` 或 `rpm [選項] <套件名稱>`
  - **範例:** `rpm -i myapp.rpm`, `rpm -e myapp`, `rpm -q myapp`

- **`dnf`** (Red Hat-based systems, 高階套件工具, 現代版本中取代 `yum`)
  - **用途:** 新一代的套件管理工具，用於管理基於 Red Hat 的系統 (如 Fedora, CentOS 8+)，處理依賴關係。
  - **常用指令:**
    - `check-update`: 檢查是否有可用的更新。
    - `update`: 更新系統上所有已安裝的軟體包。
    - `install`: 安裝新軟體包。
    - `remove`: 移除軟體包。
    - `search`: 搜尋軟體包。
    - `autoremove`: 移除不再需要的依賴套件。
  - **用法:** `dnf [指令] [套件名稱]`
  - **範例:** `dnf update`, `dnf install git`, `dnf remove firefox`

## lang base (程式語言基礎工具)

- **python**
  - **`pip`**
    - **用途:** Python 的標準套件管理工具，用於安裝和管理 Python 套件。
    - **常用指令:**
      - `install`: 安裝套件。
      - `uninstall`: 卸載套件。
      - `list`: 列出已安裝的套件。
      - `freeze`: 列出已安裝的套件及其版本，格式適用於 `requirements.txt`。
    - **範例:** `pip install requests`, `pip uninstall numpy`

  - **`uv`/`uvx`** (新一代 Python 包工具，旨在取代 `pip` 和 `venv`)
    - **用途:** 一個快速的 Python 套件安裝器和解析器，旨在作為 `pip` 和 `pip-tools` 的替代品。`uvx` 用於在臨時環境中執行 Python 命令。
    - **`uv` 常用指令:**
      - `pip install`: 安裝套件 (替代 `pip install`)。
      - `venv`: 建立虛擬環境 (替代 `python -m venv`)。
      - `sync`: 同步虛擬環境與 `requirements.txt`。
    - **`uvx` 常用指令:**
      - `uvx python -c "print(\'Hello from a temporary env\')"` (在臨時環境中執行 Python 命令)
    - **範例:** `uv pip install "Django<5"`, `uv venv .venv`, `uvx black .`

  - **`python env`** (虛擬環境)
    - **用途:** 建立一個隔離的 Python 環境，使得不同專案的依賴不會互相衝突。
    - **常用工具:** `venv` (Python 內建), `conda`, `virtualenv`
    - **建立與激活 (以 `venv` 為例):**
      - **建立:** `python3 -m venv myenv`
      - **激活 (Linux/macOS):** `source myenv/bin/activate`
      - **激活 (Windows CMD):** `myenv\Scripts\activate.bat`
      - **激活 (Windows PowerShell):** `myenv\Scripts\Activate.ps1`
    - **範例:** 建立虛擬環境後，`pip install` 的套件只會安裝到該環境中。

- **javascript**
  - **`nvm`** (Node Version Manager)
    - **用途:** 用於管理和切換多個 Node.js 版本。
    - **常用指令:**
      - `install`: 安裝指定版本的 Node.js。
      - `use`: 切換到指定版本的 Node.js。
      - `ls`: 列出所有已安裝的 Node.js 版本。
      - `alias default`: 設定預設的 Node.js 版本。
    - **範例:** `nvm install 18`, `nvm use 16`, `nvm alias default 18`

  - **`npm`** (Node Package Manager)
    - **用途:** JavaScript 的套件管理器，用於安裝、管理和發布 Node.js 套件。
    - **常用指令:**
      - `install`: 安裝套件。
      - `uninstall`: 卸載套件。
      - `init`: 建立 `package.json` 檔案。
      - `run`: 執行 `package.json` 中定義的腳本。
    - **範例:** `npm install express`, `npm install -g create-react-app`, `npm run dev`

- **rust**
  - **`cargo`**
    - **用途:** Rust 的套件管理器和建構系統。用於建立、編譯、測試和發布 Rust 專案。
    - **常用指令:**
      - `new`: 建立新專案。
      - `build`: 編譯專案。
      - `run`: 編譯並執行專案。
      - `test`: 執行專案的測試。
      - `add`: 添加依賴 (需要 `cargo-edit` 擴展)。
      - `install`: 從 crates.io 安裝二進位檔案。
    - **範例:** `cargo new my_project`, `cargo build`, `cargo run`

  - **`cargo install` / `cargo binstall`**
    - **用途:** `cargo install` 從原始碼編譯並安裝 Rust crates (套件)。`cargo binstall` 是一個更快的替代方案，它會嘗試從預編譯的二進位檔案安裝。
    - **用法:** `cargo install <crate_name>`, `cargo binstall <crate_name>`
    - **範例:** `cargo install ripgrep`, `cargo binstall starship`

- **go**
  - **`go install`**
    - **用途:** 編譯並安裝 Go 模組中的可執行程式到 `$GOPATH/bin` 或 `$GOBIN`。
    - **用法:** `go install [path_to_package]`
    - **範例:** `go install example.com/hello` (如果 `hello` 是一個可執行套件)

# editor (文字編輯器)

- **`vim`** (Vi IMproved)
  - **用途:** 一個功能強大、高度可配置的文字編輯器，可在終端機中運行。它有多種模式。
  - **主要模式:**
    - **Normal Mode (普通模式):** 用於導航和執行指令 (預設模式)。
    - **Insert Mode (插入模式):** 用於輸入文字 (按 `i` 進入)。
    - **Visual Mode (視覺模式):** 用於選取文字 (按 `v` 進入)。
    - **Command-Line Mode (命令列模式):** 用於執行更複雜的指令 (按 `:` 進入)。
  - **常用指令 (Normal Mode): **
    - `i`: 進入插入模式。
    - `Esc`: 退出插入模式，回到普通模式。
    - `:w`: 儲存檔案。
    - `:q`: 退出 Vim (如果檔案未保存會警告)。
    - `:q!`: 強制退出 Vim (不保存)。
    - `:wq` 或 `ZZ`: 儲存並退出。
    - `dd`: 刪除當前行。
    - `yy`: 複製當前行。
    - `p`: 貼上。
    - `u`: 撤銷上一個操作。
  - **用法:** `vim <檔名>`
  - **範例:** `vim myfile.txt`

- **`nano`**
  - **用途:** 一個簡單易用、直觀的文字編輯器，適合初學者。
  - **常用快捷鍵:** (顯示在編輯器底部)
    - `Ctrl + G`: 獲取幫助。
    - `Ctrl + O`: 寫入檔案 (保存)。
    - `Ctrl + X`: 退出 nano。
    - `Ctrl + W`: 搜尋。
    - `Ctrl + K`: 剪下行。
    - `Ctrl + U`: 貼上。
  - **用法:** `nano <檔名>`
  - **範例:** `nano another_file.txt`

# screen / tmux / zellij (終端機多工器)

- **`screen`**
  - **用途:** 終端機多工器，允許使用者在單一終端機視窗中運行多個獨立的終端機會話。即使網路斷開，會話也能保持運行。
  - **常用指令/快捷鍵:**
    - `screen`: 啟動一個新的 screen 會話。
    - `screen -S <session_name>`: 啟動一個帶有指定名稱的 screen 會話。
    - `Ctrl + A, D`: 分離 (detach) 當前 screen 會話 (讓它在背景運行)。
    - `screen -r`: 重新連接 (re-attach) 最後一個分離的會話。
    - `screen -r <session_name>` 或 `screen -r <pid>`: 重新連接指定名稱或 PID 的會話。
    - `screen -ls`: 列出所有 screen 會話。
    - `Ctrl + A, C`: 在當前會話中創建一個新的視窗。
    - `Ctrl + A, N`: 切換到下一個視窗。
    - `Ctrl + A, P`: 切換到上一個視窗。
    - `Ctrl + A, "`: 列出所有視窗並選擇。
    - `exit`: 退出當前視窗 (如果這是最後一個視窗，則會話終止)。
  - **範例:**
    ```bash
    screen # 啟動一個新會話
    # 執行一些命令，然後按 Ctrl+A, D 分離
    screen -ls # 列出會話
    screen -r # 重新連接
    ```

- **`tmux`** (Terminal Multiplexer)
  - **用途:** 另一個強大的終端機多工器，功能類似 `screen`，但提供更現代的功能和更靈活的配置。
  - **常用指令/快捷鍵:**
    - `tmux`: 啟動一個新的 tmux 會話。
    - `tmux new -s <session_name>`: 啟動一個帶有指定名稱的 tmux 會話。
    - `Ctrl + B, D`: 分離當前 tmux 會話。
    - `tmux attach -t <session_name>`: 重新連接指定名稱的會話。
    - `tmux ls`: 列出所有 tmux 會話。`
    - `Ctrl + B, C`: 創建一個新視窗。
    - `Ctrl + B, N`: 切換到下一個視窗。
    - `Ctrl + B, P`: 切換到上一個視窗。
    - `Ctrl + B, %`: 水平分割窗格。
    - `Ctrl + B, "`: 垂直分割窗格。
    - `Ctrl + B, 方向鍵`: 在窗格之間移動。
    - `Ctrl + B, X`: 關閉當前窗格。
    - `exit`: 退出當前窗格 (如果這是最後一個窗格，則視窗終止)。
  - **範例:**
    ```bash
    tmux new -s dev_session # 啟動一個名為 dev_session 的會話
    # 在會話中工作，然後按 Ctrl+B, D 分離
    tmux ls # 列出會話
    tmux attach -t dev_session # 重新連接
    ```

- **`zellij`**
  - **用途:** 一個相對較新的終端機工作區環境，旨在提供現代化的多工功能，強調易用性和可配置性，並提供更豐富的佈局管理。
  - **常用指令/快捷鍵:**
    - `zellij`: 啟動一個新的 Zellij 會話。
    - `Ctrl + P, D`: 分離當前 Zellij 會話。
    - `zellij attach`: 重新連接最近的分離會話。
    - `zellij list-sessions`: 列出所有 Zellij 會話。
    - `Ctrl + P, N`: 新建窗格。
    - `Ctrl + P, H/J/K/L`: 在窗格間移動 (左/下/上/右)。
    - `Ctrl + P, S`: 選擇布局。
    - `Ctrl + P, F`: 搜尋選項卡或窗格。
    - `exit`: 退出當前窗格。
  - **範例:**
    ```bash
    zellij # 啟動 Zellij
    # 執行命令，然後按 Ctrl+P, D 分離
    zellij list-sessions # 列出會話
    zellij attach # 重新連接
    ```
# ssh (安全外殼協議)

- **用途:** Secure Shell (SSH) 是一種加密的網路協議，用於在不安全的網路中安全地操作網路服務。最常見的用途是遠端登入到伺服器。
- **基礎知識:**
  - `network - tcp/ip, client server`: SSH 基於 TCP/IP 協議，採用客戶端-伺服器模型。
  - `file system`: 允許透過 SCP 或 SFTP 安全地傳輸檔案。
  - `auth / account`: 使用密碼或 SSH 金鑰進行身份驗證。

- **`ssh account@host`**
  - **用途:** 遠端登入到伺服器。
  - `account`: 遠端伺服器上的使用者名稱。
  - `host`: 遠端伺服器的 IP 位址或域名。
  - **範例:** `ssh user@192.168.1.100` 或 `ssh user@myserver.com`
  - **常用選項:**
    - `-p <port>`: 指定遠端主機的端口 (預設為 22)。
    - `-i <keyfile>`: 指定身份驗證的金鑰檔案。

### ssh remote command (SSH 遠端執行命令)

- **用途:** 在不登入遠端伺服器的情況下執行單個命令。
  ```
  ssh account@host <command>
  ```
  - **範例:** `ssh user@myserver.com ls -l /var/log`

### ssh key (SSH 金鑰)

- **用途:** 提供一種更安全的身份驗證方式，避免每次輸入密碼。由公鑰和私鑰組成。
  ```
  ssh-keygen
  ```
  - **`ssh-keygen`**: 生成 SSH 金鑰對 (公鑰和私鑰)。
    - **過程:** 執行 `ssh-keygen` 後，會提示儲存金鑰的位置 (預設在 `~/.ssh/id_rsa`) 和設定密碼。
  - **部署公鑰:** 通常將生成的公鑰 (`id_rsa.pub`) 複製到遠端伺服器的 `~/.ssh/authorized_keys` 檔案中。
  - **`ssh-copy-id`**: 一個方便的工具，用於將本地公鑰複製到遠端伺服器。
    - **用法:** `ssh-copy-id account@host`

#### scp (Secure Copy)

- **用途:** 在本地和遠端主機之間安全地複製檔案和目錄。
  - **本地到遠端:**
    ```
    scp <本地檔案> account@host:<遠端路徑>
    ```
    - **範例:** `scp mylocalfile.txt user@myserver.com:/home/user/documents/`
  - **遠端到本地:**
    ```
    scp account@host:<遠端檔案> <本地路徑>
    ```
    - **範例:** `scp user@myserver.com:/var/log/syslog .` (複製到當前目錄)
  - **常用選項:**
    - `-r`: 遞迴複製目錄。
    - `-P <port>`: 指定遠端主機的端口。

#### ssh jump / proxy (SSH 跳板機/代理)

- **用途:** 透過一個中間伺服器 (跳板機) 連接到目標伺服器，當目標伺服器不直接暴露在網路中時非常有用。
  ```
  ssh -J <jump_user@jump_host> <target_user@target_host>
  ```
  - **範例:** `ssh -J jumpuser@jump.example.com targetuser@172.16.0.123` (透過 `jump.example.com` 連接到 `172.16.0.123`)

#### ssh tunnel (SSH 隧道/端口轉發)

- **用途:** 透過 SSH 連線建立一個加密的隧道，用於轉發網路流量。常用於繞過防火牆或訪問內部服務。
  - **本地端口轉發 (Local Port Forwarding):** 將本地端口的流量轉發到遠端主機的某個端口。
    ```
    ssh -L <local_port>:<remote_host>:<remote_port> <ssh_user@ssh_host>
    ```
    - **範例:** `ssh -L 8080:localhost:80 user@myserver.com` (訪問本地 8080 端口，流量將轉發到 myserver.com 的 80 端口)
  - **遠端端口轉發 (Remote Port Forwarding):** 將遠端主機端口的流量轉發到本地主機的某個端口。
    ```
    ssh -R <remote_port>:<local_host>:<local_port> <ssh_user@ssh_host>
    ```
    - **範例:** `ssh -R 8080:localhost:80 user@myserver.com` (遠端伺服器訪問其本地 8080 端口，流量將轉發到本地機器 80 端口)

#### sshuttle (via iptables)

- **用途:** 一個透明的代理工具，透過 SSH 連線將所有 (或部分) 本地網路流量重定向到遠端伺服器，就像一個簡易的 VPN，無需真正的 VPN 軟體。
  ```
  sshuttle -r <ssh_user@ssh_host> <subnet_to_route>
  ```
  - **範例:** `sshuttle -r jumpuser@jump.example.com 172.16.0.0/24` (將所有到 172.16.0.0/24 子網的流量透過 jump.example.com 路由)

#### sshfs (SSH Filesystem)

- **用途:** 允許你透過 SSH 連線將遠端檔案系統掛載到本地機器上，使其行為像本地檔案系統一樣。
  ```
  sshfs <user@host:remote-path> <local-path>
  ```
  - **範例:** `sshfs user@myserver.com:/var/www /mnt/myserver_web` (將遠端 `/var/www` 掛載到本地 `/mnt/myserver_web`)
  - **卸載:** `fusermount -u <local-path>`
# curl

- **用途:** `curl` 是一個強大的命令行工具，用於透過各種協定 (如 HTTP, HTTPS, FTP, FTPS 等) 傳輸資料。它常用於測試 API、下載檔案、上傳資料等。

- **常用選項:**
  - `-X <METHOD>`: 指定 HTTP 請求方法 (如 `GET`, `POST`, `PUT`, `DELETE`)。
  - `-H <HEADER>`: 添加自定義請求頭。
  - `-d <DATA>`: 指定 POST 請求的資料 (會自動設定 `Content-Type` 為 `application/x-www-form-urlencoded`)。
  - `-F <NAME=VALUE>`: 用於 multipart/form-data 的 POST 請求 (檔案上傳)。
  - `-G`: 將 `-d` 參數轉換為 GET 請求的 URL 查詢字串。
  - `-o <FILE>`: 將輸出保存到指定檔案。
  - `-O`: 將輸出保存到一個以遠端檔案名命名的檔案。
  - `-s`: 安靜模式 (silent mode)，不顯示進度或錯誤訊息。
  - `-v`: 顯示詳細的通訊過程 (verbose)。
  - `-k` 或 `--insecure`: 允許不安全的 SSL 連線。
  - `-u <user:password>`: 指定使用者名稱和密碼進行基本 HTTP 認證。
  - `--basic`: 使用基本 HTTP 認證 (預設)。
  - `--digest`: 使用摘要 HTTP 認證。
  - `--cookie <name=value>`: 發送 Cookie。
  - `--cookie-jar <file>`: 將接收到的 Cookie 寫入檔案。
  - `--data-urlencode <DATA>`: 對資料進行 URL 編碼後發送。
  - `--json <DATA>`: 發送 JSON 資料 (會自動設定 `Content-Type: application/json`)。

- **範例:**

  - **基本 GET 請求:**
    ```bash
    curl https://api.example.com/data
    ```

  - **保存輸出到檔案:**
    ```bash
    curl -o output.json https://api.example.com/data
    ```

  - **POST 請求 (表單資料):**
    ```bash
    curl -X POST -d "name=John Doe&age=30" https://api.example.com/users
    ```

  - **POST 請求 (JSON 資料):**
    ```bash
    curl -X POST -H "Content-Type: application/json" -d '{"name":"Jane Doe","email":"jane@example.com"}' https://api.example.com/users
    # 或者使用更簡潔的 --json 選項 (如果 curl 版本支持)
    # curl --json '{"name":"Jane Doe","email":"jane@example.com"}' https://api.example.com/users
    ```

  - **帶有 HTTP 基本認證的請求:**
    ```bash
    curl -u "username:password" https://api.example.com/secure_data
    ```

  - **帶有 Bearer Token 的 API 請求:**
    ```bash
    curl -H "Authorization: Bearer YOUR_ACCESS_TOKEN" https://api.example.com/protected_resource
    ```

  - **檔案上傳 (multipart/form-data):**
    ```bash
    curl -X POST -F "file=@/path/to/your/image.jpg" -F "description=A test image" https://api.example.com/upload
    ```

  - **跟隨重定向並顯示詳細資訊:**
    ```bash
    curl -L -v https://example.com
    ```

  - **Pipe 到 Shell (用於執行遠端腳本，請謹慎使用):**
    ```bash
    curl -sL https://install.example.com/script.sh | sh
    # -s: 安靜模式，不顯示進度。
    # -L: 跟隨重定向。
    # | sh: 將下載的腳本內容傳送給 sh 命令執行。
    ```
    - **範例說明:** 這個命令會從 `https://install.example.com/script.sh` 下載一個腳本，並直接將其內容傳遞給 `sh` (或 `bash`) 命令執行。**此操作具有安全風險，請確保您完全信任腳本來源。**
# git

- **用途:** Git 是一個分散式版本控制系統，用於追蹤程式碼變更、協同開發和管理專案歷史。

- **基礎操作流程:**
  1.  **初始化倉庫:** `git init` (在當前目錄建立新的 Git 倉庫)
  2.  **添加檔案:** `git add <file>` (將檔案加入暫存區)
  3.  **提交變更:** `git commit -m "commit message"` (將暫存區的變更提交到本地倉庫)
  4.  **連結遠端倉庫:** `git remote add origin <URL>` (將本地倉庫連結到遠端倉庫)
  5.  **推送到遠端:** `git push` (將本地變更推送到遠端倉庫)
  6.  **拉取遠端變更:** `git pull` (從遠端倉庫拉取最新變更並合併)

## git add

- **用途:** 將工作目錄中的變更添加到暫存區 (staging area)，準備提交。
- **用法:**
  - `git add <檔案路徑>`: 添加指定檔案的變更。
  - `git add .`: 添加當前目錄所有新檔案和修改過的檔案。
  - `git add -u`: 添加所有已追蹤檔案的修改和刪除，但不包括新檔案。
  - `git add -A`: 添加所有變更 (包括新檔案、修改和刪除)。
- **範例:**
  ```bash
  git add index.html          # 添加單一檔案
  git add .
  git add src/
  ```

## git commit

- **用途:** 將暫存區中的變更永久保存到本地倉庫的歷史記錄中。
- **用法:**
  - `git commit -m "提交訊息"`: 提交變更並附上簡短的提交訊息。
  - `git commit -am "提交訊息"`: 跳過 `git add` 步驟，直接提交所有已追蹤檔案的修改和刪除。
  - `git commit --amend`: 修改上一次提交的內容或訊息 (謹慎使用，尤其在已推送的提交上)。
- **範例:**
  ```bash
  git commit -m "feat: add user authentication"
  git commit -am "fix: resolve login bug"
  ```

## git push

- **用途:** 將本地倉庫的提交推送到遠端倉庫。
- **用法:**
  - `git push <遠端倉庫名稱> <本地分支名稱>`: 推送指定分支到遠端。
  - `git push -u <遠端倉庫名稱> <本地分支名稱>`: 第一次推送時，設定上游分支，之後只需 `git push`。
- **範例:**
  ```bash
  git push origin main
  git push -u origin feature/new-feature
  ```

## git pull

- **用途:** 從遠端倉庫獲取最新變更，並自動合併到當前本地分支。
- **用法:**
  - `git pull <遠端倉庫名稱> <遠端分支名稱>`: 從遠端拉取並合併。
  - `git pull`: 如果已設定上游分支，則直接拉取。
- **範例:**
  ```bash
  git pull origin main
  git pull
  ```

## git remote

- **用途:** 管理遠端倉庫的連接。
- **用法:**
  - `git remote add <名稱> <URL>`: 添加一個新的遠端倉庫。
  - `git remote -v`: 顯示所有遠端倉庫的名稱和 URL。
  - `git remote remove <名稱>`: 移除一個遠端倉庫。
  - `git remote rename <舊名稱> <新名稱>`: 重命名一個遠端倉庫。
- **範例:**
  ```bash
  git remote add origin https://github.com/your-username/your-repo.git
  git remote -v
  ```

## github

- **用途:** GitHub 是一個基於 Git 的網路託管服務，提供軟體開發的版本控制和協作功能。它廣泛用於開源專案和企業內部專案託管，並提供 issue tracking, pull requests (PRs), code review 等功能。
- **主要功能:**
  - **專案託管:** 儲存 Git 倉庫。
  - **協同開發:** 透過 Pull Requests 進行程式碼審查和合併。
  - **Issue Tracking:** 管理任務、錯誤和功能請求。
  - **Actions:** 持續整合/持續部署 (CI/CD) 自動化。
  - **Pages:** 託管靜態網站。
- **相關概念:**
  - **Repository (倉庫):** 專案的儲存單元，包含所有檔案、歷史記錄和相關資訊。
  - **Fork:** 複製一份其他使用者的倉庫到自己的帳戶下，可以自由修改。
  - **Pull Request (PR):** 提案將自己的修改合併到原始倉庫中。
  - **Branch (分支):** 獨立的開發線，允許在不影響主線的情況下進行新功能開發或錯誤修復。

