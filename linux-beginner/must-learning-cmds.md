# base commands
## 檔案
- file
- command / whereis / which
## process
- ps / pstree / top
- kill
## 權限
- id
- chmod

# pkg related
## system
- dpkg / apt
- rpm / dnf

## lang base
- python
  - pip
  - uv/uvx
  - python env
- javascript
  - nvm / npm
- rust
  - cargo
  - cargo install / cargo binstall
- go
  - go install
  
# editor
- vim
- nano

# screen / tmux / zellij
# ssh
* network - tcp/ip , client server
* file system
* auth / account

```
ssh account@host
```
### ssh remote command
```
ssh account@host ls
```

### ssh key
```
ssh-genkey
```

#### scp

local to remote
```
scp xxx account@host:~
```
remote to local
```
scp account@host:~/abc xxx
```

#### ssh jump / proxy
```
ssh -J jump 172.16.0.123
```

#### ssh tunnel

https://iximiuz.com/en/posts/ssh-tunnels/

#### sshuttle (via iptables)
```
sshuttle -r jump 172.16.0.0/24
```
#### sshfs
```
sshfs mount user@host:remote-path local-path
```
# curl
# git
- git add
- git commit
- git push
- git pull
- git remote
## github
