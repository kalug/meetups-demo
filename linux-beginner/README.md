---
title: "2025 Linux 推坑手冊"
pubDatetime: 2025-04-30T15:00:00
tags:
  - linux
  - beginner
description: 2025 Linux 推坑手冊
featured: true
---

### 06/21 Google Meet 位置：### 06/21 Google Meet 位置：

![SCR-20250621-nnmu](https://hackmd.io/_uploads/Bk9hhA7Nxe.png)
https://meet.google.com/dwi-yjcx-mwx?pli=1


# 前言

很多朋友就算是開發者，認為自己離 Linux 很遠，
然而在 2025 的今天，不需要像以前一樣上來就先把環境轉換成 Linux，
才有機會接觸到 Linux。
包括虛擬機，container，WSL 等技術都可能早以融入大家開發日常。

然而多數opensource原生就是基於Linux開發，轉用Linux作為主要開發環境具有不少優勢，
建議對 Linux 環境有基本認識後，尤其是文字界面(console / terminal)，
再換整個作業系統挫折感才不會那麼重，也才能體會 Linux 帶來的優點。

開始前先問問自己為什麼要學 Linux, 想要解決怎樣的問題, 在從需求點下手, 
學起來比較快也有方向性。

本日目標
1. 以 google cloud shell /gemini-cli 做操作說明
2. 對Linux 文字界面瞭解 - ssh / tmux / shell / editor
3. Linux 基本架構 檔案/權限 - fs / LHS / account
4. distro 選擇 & package 基本操作
5. install demo


## Linux and opensource

### linux kernel

[Linux](https://kernel.org) 是一種自由、開源的作業系統核心（Kernel），最早由芬蘭程式設計師 [Linus Torvalds](https://en.m.wikipedia.org/wiki/Linus_Torvalds) 於1991 年開發。

* kernel實際運行是獨佔的程序，crach 系統就會 
* 日常作業還需要搭配user space 運行

```
+-------------------+
|     User Space    | <-- Applications (bash, vim, etc.)
+-------------------+
        |
        | System Calls
        v
+-------------------+
|    Kernel Space   | <-- Kernel, device drivers, memory mgr
+-------------------+
        |
        | Hardware Drivers
        v
+-------------------+
|     Hardware      | <-- CPU, RAM, Disk, etc.
+-------------------+
```

{%preview https://asciinema.org/a/388073 %}

### linux distros

在Linux 世界或說opensource，單純只有kernel是不夠，還需要預備user space層面的相關工具，這時候就需要distros。
而這些 opensource 套件可能多達上萬個，靠這些distros 社群/廠商來維護。

因此你的 Linux 跟我的 可能會完全不一樣, 
從低端的記憶體4M到伺服器等級到底幾G幾T memory, 不同的 distros, 不同 GUI 環境, 不同編譯器, 太多的不同, 
我們需要有 User Group 來分享與討論這些Linux 世界的新玩具。

https://www.reddit.com/r/linux/comments/1czajn0/linux_distro_family_chart_with_distros_based/
![linux distros](https://i.redd.it/0h0jbzn8ca2d1.png)




## Linux 適合可以做什麼

- 要用 cuda
- 跑 local ai
- 要跑 container

對於 OpenSource 版本與原始碼重要性不可忽視, 就算不直接介入開發, 忽略版本有時連問題都沒法處理, 因為不同版本設定方式可能不同等。

### desktop

雖然 desktop 不算傳統Linux強項，目前市佔率約 4% (不含 android)
但相較 cloud 環境， desktop 環境100%由使用者控制，h
對於瞭解 Linux 系統運作很有幫助， 在熟悉 console / terminal 環境後，
加上瀏覽器可能80%的工作不直接強依賴本機環境。
Linux desktop 在運用上，具備多元選擇的優勢，可以配置高度客制化。

### cloud / container

cloud 原本就是Linux 90%市佔率 （已經幾十年）
目前幾乎獨佔 container 市場，事實上 container（docker/podman/kubernetes）就是 linux用image運行isolated的 process。

- ci/cd
  - 如 github action

### embedded

多樣的硬體架構支援，x86_64 / arm64 / RISC-v


### local ai

nvidia cuda

## 如何學
* https://linuxjourney.com
* https://killercoda.com/pawelpiwosz/course/linuxFundamentals


# 環境準備

安裝Linux 難度不高，但由於中文需求，需要輸入法導致選擇又再複雜一些

## Pure Linux

市面上有一些選擇有提供預設安裝如
- framework (臺灣生產仁寶代工， 沒直接出linux預設安裝，社群資源豐富)，可以模組化換元件。
- system76 (system76 popOS linux預設安裝)
- dell (與canonical 合作多年 ubuntu 預設安裝)
- lenovo thinkpad (可選linux預設安裝，臺灣沒有)

## Windows

- Linux環境- WSL2
- 套件 winget
- windows terminal / putty / ...


## MacOS

- Docker
- 套件 brew / nixpkg

## Android

- Linux Terminal on Android (vm)
- termux

## ChromeOS

- Linux on ChromeOS

## Cloud

- killercoda
- google cloud, shell https://console.cloud.google.com
    - https://gist.github.com/kcubeterm/7e2792366bd6e8c14064f7e2ac109cc7
- vps

### google cloud shell

host 必要的套件 openssh/which/curl/wget

```
curl sdk.cloud.google.com | tee gcloud.sh | sh -s -- --install-dir=$PWD/.gcloud
gcloud auth login
gcloud cloud-shell ssh
```
#### windows
1.  **下載 Google Cloud CLI 安裝程式：**
    前往 [Google Cloud SDK 下載頁面](https://cloud.google.com/sdk/docs/install#windows) 下載最新版本的 Google Cloud CLI 安裝程式。

2.  **執行安裝程式：**
    執行下載的 `.exe` 安裝程式。安裝程式會引導您完成設定過程，包括處理 Python 依賴項。

3.  **完成設定：**
    安裝完成後，安裝程式會提供選項來啟動 gcloud CLI shell 並配置您的設定。建議您完成這些配置步驟，以便開始使用 gcloud CLI。


#### novnc show

```
# $WEB_HOST:$PORT
docker run -p 8080:80 -e RESOLUTION=1920x1080 -v /dev/shm:/dev/shm dorowu/ubuntu-desktop-lxde-vnc
```

https://8080-cs-837155526422-default.cs-asia-east1-vger.cloudshell.dev

---

# 必學項目

## terminal / console env

2025 的 terminal / shell 環境, 多了不少使用者友善特點
各語言都有在這些特性都有很好的library 支援

gemini-cli
Rust cli: https://www.rust-lang.org/what/cli

- 顏色支援
- 參數,  autocomplete - 各語言都有
    - python - argparse
    - golang - cobra
    - rust - clap
- prompt
- pipe - 傳接不同指令
- config file
- env var
- log
- session
- 容易跨平臺 - 相較GUI 需要綁定的太多
- web / cloud config

除了 Cli 界面還有
* tui - 文字型選單界面没，支援滑鼠等
* REPL
* web support *

## 套件 & container

如何選擇 distros
- 用途- 個人或商用 (版權/維護週期等)
- 套件管理不同
- 是否 使用systemd
    - 是否支援 wayland
- 延伸的 linux ecosystem - container

* 編譯 (打包較為複雜，先知道可以這樣處理)
* 安裝/移除 依賴



```
ldd /usr/bin/ls
        linux-vdso.so.1 (0x00007ff477c3d000)
        libselinux.so.1 => /lib64/libselinux.so.1 (0x00007ff477bc7000)
        libcap.so.2 => /lib64/libcap.so.2 (0x00007ff477bbb000)
        libc.so.6 => /lib64/libc.so.6 (0x00007ff4779ca000)
        libpcre2-8.so.0 => /lib64/libpcre2-8.so.0 (0x00007ff47791f000)
        /lib64/ld-linux-x86-64.so.2 (0x00007ff477c3f000)
```



|               | deb        | rpm             |
| --------      | --------   | --------        |
| **distros**   | debian     | redhat          |
|               | ubuntu     | centos stream   |
|               | linux mint | fedora          |
| **低階工具**   | dpkg       | rpm             |
| **高階工具**   | apt       |dnf             |
| **開發者庫**   | [ppa](https://launchpad.net/ubuntu/+ppas)    |     [copr](https://copr.fedorainfracloud.org)        |



### deb

- dpkg
  - dpkg -L apt
  - dpkg -l 
- apt update / install / remove

```
```

https://wiki.debian.org/SimplePackagingTutorial

.dsc

#### ppa

https://launchpad.net/ubuntu/+ppas?name_filter=zip

範例 helix-editor ppa
https://github.com/maveonair/helix-ppa
 
#### termux
不相容於 debian/ubuntu 環境
提供 pkg 工具

### rpm
Redhat / Centos Stream / Fedora
Suse


### 其他套件

* arch
* nix

### 重要的點
- version / release cycle
- upstream & downstream

---

## ssh

* network - tcp/ip , client server
* file system
* auth / account

```
ssh account@host
```

#### ssh remote command

#### ssh key

#### scp

#### ssh jump / proxy
#### ssh tunnel
#### sshuttle

#### sshfs

----

## shell
- fish
- bash
- zsh

### auto-complete
### pipe

* | 導向
* > output
* >>
* < input 
* 2>&1, stdout/stderr 同時輸出

| Feature | | (Pipe) | > (Redirect) |
|---------------------|-----------------------------------------|---------------------------------------|
| Sends output to | Another command | A file |
| Usage | Command chaining / filtering | Output logging / saving to file |
| Overwrites files? | No | Yes (unless >> is used to append) |
| Example | ps aux \| grep python | ps aux > processes.txt |

### shell scripts
cat setup-fish.sh
```
#!/bin/sh
#
USER=$(whoami)

sudo apt-add-repository -y ppa:fish-shell/release-4
sudo apt update
sudo apt -y install fish

sudo chsh $USER -s /usr/bin/fish
```

## 常用 commands

### 檔案相關

#### ls

```
shawn111@cloudshell:~/k8s-demo/gcloud$ ls -l
total 4
-rwxrwxr-x 1 shawn111 shawn111 155 Jun 21 06:20 setup-fish.sh
```

#### cd - 切換目錄

```
cd abc
cd ~
cd $HOME
cd
```

#### tee / cat / tail / grep / sed

sed (置換)


----

## terminal Multiplexers / emulator

### terminal Multiplexers

tmux / screen / zellij

{%preview https://zellij.dev/screencasts/ %}

![zeelij](https://raw.githubusercontent.com/zellij-org/zellij/main/assets/demo.gif)


### legacy terminal emulator
#### rxvt
#### gnome terminl
#### [windows] putty
#### [android] termux

### 現代 termianal 
wezterm / kitty

#### AI terminal wrap

#### Windows Terminal 

{%preview https://learn.microsoft.com/en-us/windows/terminal/ %}


![Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/images/tear-tab.gif)

{%preview https://github.com/microsoft/terminal %}

## Disk & 目錄結構
LHS
```
/
- /boot
- /usr
  - /usr/bin
  - /usr/lib
- /var
- /home
- /lib
- /bin

---
- /dev
- /proc
- /sys

```



## git & github

## 開機管理概念

### UEFI / bios

### bootloader

### uefi shim


# 裝機
現在的裝機流程的確很簡單, 但操作不當還是會把系統檔案誤刪除.
因此還是瞭解動作背後的原理再操作.

## ventoy - 安裝萬用包


---

上次 在短短的 2.5小時, 我們快速介紹安裝Linux前需要的部分
這次我們會帶入 gemini-cli, 讓小幫手AI協助我們 克服 對terminal的不熟悉
並注重補充 container 實戰 (不需要第一堂有上過, 第一堂上過也歡迎)

Console 環境介紹： Gemini-cli、Bash/fish 指令、Shell 腳本、ssh
基礎架構：kernel、systemd、檔案系統、權限模型
套件管理：apt（以 Ubuntu/Debian 示範）、dnf (fedora)
容器入門：如何執行 container, 編譯 container image
開源介紹：社群、生態系 如 github


議程
15:00 – 15:10 報到 & 開場
15:10 – 15:30 環境設定 - gemini-cli + gcloud
16:30 – 16:30 如何用 gemini-cli 學Linux
16:30 – 17:15 容器基礎概念 與 操作
17:10 – 17:30 Q&A


