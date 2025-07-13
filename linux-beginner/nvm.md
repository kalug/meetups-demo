# NVM 指南

## 什麼是 NVM？

NVM (Node Version Manager) 是一個用於管理多個 `node` 版本的工具。它允許您在同一台機器上安裝和切換不同版本的 Node.js。

## 為什麼我們需要 NVM？

在開發過程中，不同的專案可能依賴於不同版本的 Node.js。NVM 可以幫助我們解決以下問題：

*   **版本相容性問題:** 不同的專案可能需要不同版本的 Node.js 才能正常執行。使用 NVM，您可以為每個專案輕鬆切換到所需的 Node.js 版本，避免因版本不相容而導致的各種問題。
*   **測試不同版本的相容性:** 對於需要支援多個 Node.js 版本的應用程式或函式庫的開發人員來說，NVM 可以方便地在不同版本之間切換以進行測試。
*   **方便升級和降級:** 當您需要升級或降級 Node.js 版本時，NVM 提供了簡單快捷的指令，無需手動解除安裝和重新安裝。
*   **避免污染全域環境:** NVM 將不同版本的 Node.js 安裝在獨立的目錄中，不會污染全域的安裝環境，使得版本管理更加乾淨和安全。

## Google Cloud Shell 注意事項

因為 Google Cloud Shell 的環境特性，您需要在家目錄 (`$HOME`) 的環境設定檔（例如 `.bashrc` 或 `.profile`）中進行以下設定，才能讓 NVM 的狀態被保存：

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

```bash
export NVM_DIR="$HOME/.nvm" ## nvm 預設

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

> [!NOTE]  
> Google Cloud Shell  預設 /usr/local/nvm 每次會被刷掉
