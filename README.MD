# Cloudflare 优选 IP

**测试地**: 中国陕西移动  
**更新频率**: 不限时更新  
**本次更新**: 2026-05-03 07:28:38

## 订阅链接

- 高速优选：`https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/best_ips.txt`
- 所有可用：`https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/full_ips.txt`
- 优选域名：`https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/domain.txt`

## 订阅链接使用方法

1. 复制订阅链接。
2. 打开 EdgeTunnel 后台。
3. 创建优选订阅，选择“优选订阅模式 - 自定义”。
4. 在订阅接口 / API / URL 中粘贴订阅链接。
5. 验证可用性，选择“追加 API”。
6. 保存并重新订阅。



## 脚本使用方法
### 安卓端 Termux
1. 安装 Termux，关闭电池优化或设置省电策略为无限制，确保应用可以保持后台运行而不中断。
2. 开启唤醒锁： 在 Termux 下拉通知栏点击 Acquire wakelock，防止休眠测速中断。
3. 更新软件包列表： pkg update && pkg upgrade
4. 安装 Python, Git 和基础工具： pkg install python git -y
5. 安装脚本依赖库： pip install tqdm
6. 克隆仓库： git clone https://github.com/svip-s/cloudflare_ip.git
7. 进入目录： cd cloudflare_ip
8. 赋予脚本执行权限： chmod +x *.sh *.py
9. 获取存储权限： termux-setup-storage

• 只测速不上传 GitHub： python update.py --no-github-sync
• 查看高速优选： cat best_ips.txt
• 查看所有可用： cat full_ips.txt

• 测速并上传 GitHub：
• 获取 GitHub Token：在 GitHub 设置中生成一个 Personal Access Token (classic)，确保勾选了 repo 权限。
• 编辑配置文件： nano linux_start.sh
    export GITHUB_TOKEN="你的_ghp_开头的Token"
    export GITHUB_REPO="你的仓库HTTPS链接"
保存： Ctrl + O  退出： Ctrl + X
• 脚本启动： bash linux_start.sh 或 ./linux_start.sh

脚本运行过程中如果想退出： Ctrl + C

⚠️ 注意： 运行脚本进行测速时，请务必关闭手机上的 VPN 或代理工具，否则测出的是代理服务器的速度，而非你本地直连 Cloudflare 的真实速度。
