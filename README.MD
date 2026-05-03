# Cloudflare 优选 IP

**测试地**: 中国陕西移动  
**更新频率**: 不限时更新  
**本次更新**: 2026-05-03 07:28:38

## 订阅链接

- 高速优选：
```bash
https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/best_ips.txt
```
- 所有可用：
```bash
https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/full_ips.txt
```
- 优选域名：
```bash
https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/domain.txt
```

## 订阅链接使用方法

1. 复制订阅链接。
2. 打开 EdgeTunnel 后台。
3. 创建优选订阅，选择“优选订阅模式 - 自定义”。
4. 在订阅接口 / API / URL 中粘贴订阅链接。
5. 验证可用性，选择“追加 API”。
6. 保存并重新订阅。



## 脚本使用方法
### 安卓端 Termux

> ⚠️ 注意： 运行脚本进行测速时，请务必关闭手机上的 VPN 或代理工具，否则测出的是代理服务器的速度，而非你本地直连 Cloudflare 的真实速度。

* **系统设置**：安装 Termux，关闭电池优化或设置省电策略为无限制，确保应用可以保持后台运行而不中断。
* **唤醒锁定**： 在 Termux 下拉通知栏点击 Acquire wakelock，防止休眠测速中断。

1. 更新软件包列表：
```bash
pkg update && pkg upgrade
```
2. 安装 Python, Git 和基础工具：
```bash
pkg install python git -y
```
3. 安装脚本依赖库：
```bash
pip install tqdm
```
4. 克隆仓库：
```bash
git clone https://github.com/svip-s/cloudflare_ip.git
```
5. 进入目录：
```bash
cd cloudflare_ip
```
6. 赋予脚本执行权限：
```bash
chmod +x *.sh *.py
```
7. 获取存储权限：
```bash
termux-setup-storage
```
#
- **只测速不上传 GitHub：**
```bash
python update.py --no-github-sync
```
  - 查看高速优选：
```bash
cat best_ips.txt
```
  - 查看所有可用：
```bash
cat full_ips.txt
```
#
- **测速并上传 GitHub：**

  - 获取 GitHub Token：在 GitHub 设置中生成一个 Personal Access Token (classic)，确保勾选了 repo 权限。

- 编辑配置文件：
```bash
nano linux_start.sh
```
```bash
# 需要修改的内容
export GITHUB_TOKEN="你的_ghp_开头的Token"
export GITHUB_REPO="你的仓库HTTPS链接"
```
- 脚本启动：
```bash
bash linux_start.sh
```
    ---或---
```bash
./linux_start.sh
```
#
#### 常用快捷键与命令
| 动作 | 命令/按键 |
| :--- | :--- |
| **Nano 保存编辑** | Ctrl + O |
| **Nano 退出编辑** | Ctrl + X |
| **强行停止脚本运行** | Ctrl + C |
| **查看目录和文件名** | ls |
| **进入目录** | cd <目录名> |
| **查看文件内容** | cat <文件名> |

#### 优选IP文件
| 文件名 | 文件内容 |
| :--- | :--- |
| **best_ips.txt** | 高速优选 |
| **full_ips.txt** | 所有可用 |
| **domain.txt** | 优选域名 |
