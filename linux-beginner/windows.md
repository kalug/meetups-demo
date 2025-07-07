對於Linux初學者, 目前 windows 有不少有用的工具

# Windows terminal

https://github.com/microsoft/terminal

Windows Terminal 是一個現代化、功能豐富的終端應用程式，適用於 Windows 10 及更高版本。它可作為傳統 Windows 控制台的替代品，並為各種命令列工具提供統一的介面。

### 主要功能：

*   **多個索引標籤和窗格：** Windows Terminal 可讓您使用索引標籤在單一視窗中使用多個命令列應用程式。您也可以將視窗分割成多個窗格，以並排檢視和管理多個工作階段。

![Windows Terminal with multiple panes](https://learn.microsoft.com/en-us/windows/terminal/images/tear-tab.gif)

*   **多個設定檔：** 您可以為各種 shell（例如命令提示字元、PowerShell 和 Windows 子系統 Linux 版 (WSL) 的發行版）建立和設定不同的設定檔。它也支援與 Azure Cloud Shell 和 SSH 的原生連線。
*   **自訂與主題：** 該應用程式提供廣泛的自訂選項。您可以使用主題、背景圖片和索引標籤顏色設定來個人化外觀。它還可讓您選擇偏好的字型，預設字型為 Cascadia Code，旨在增強終端機的外觀與風格。


*   **GPU 加速文字轉譯：** Windows Terminal 利用 GPU 進行文字轉譯，與舊版主控台相比，可提供更流暢、更快速的效能。
*   **Unicode 與 UTF-8 支援：** 它對 Unicode 和 UTF-8 字元有強大的支援，可正確顯示表情符號、特殊符號和各種語言。
*   **命令選擇區(Command Palette)：** 命令選擇區提供一種快速存取 Windows Terminal 中所有可用命令的方法。

![Windows Terminal Command Palette](https://learn.microsoft.com/en-us/windows/terminal/images/command-palette-command-line-mode.gif)

*   **設定 UI：** 許多設定可以透過圖形使用者介面進行設定，讓您更容易自訂終端機，而無需直接編輯 JSON 設定檔。
*   **Sixel 支援：** 此功能允許直接在終端機中顯示點陣圖圖形。
*   **開放原始碼：** Windows Terminal 是一個開放原始碼專案，允許社群為其開發做出貢獻。

## Windows Terminal 與 PuTTY 的比較

PuTTY 是一款老牌且廣泛使用的免費開源SSH 客戶端工具 (1999 年開始開發).

| 功能 | Windows Terminal | PuTTY |
|---|---|---|
| **主要使用案例** | 本機命令列工作和管理多個 shell 環境 | 透過 SSH 和 Telnet 進行遠端伺服器存取 |
| **介面** | 現代化、多索引標籤、高度可自訂 | 極簡、單一視窗 |
| **Shell 整合** | 與命令提示字元、PowerShell、WSL 和其他 shell 整合 | 獨立應用程式 |
| **檔案傳輸** | 無內建檔案傳輸功能 | 包含用於安全檔案傳輸的 PSCP 和 PSFTP |
| **工作階段管理** | 管理不同 shell 的設定檔 | 管理遠端連線的已儲存工作階段 |
| **可擴充性** | 開放原始碼，具有不斷發展的擴充功能和外掛程式生態系統 | 有限的可擴充性選項 |

總而言之，Windows Terminal 是一款功能強大且現代化的終端應用程式，非常適合在本機上使用多個命令列工具的使用者。另一方面，PuTTY 是一款輕量級且可靠的 SSH 用戶端，擅長連線和管理遠端伺服器。

# WSL

https://github.com/microsoft/WSL
