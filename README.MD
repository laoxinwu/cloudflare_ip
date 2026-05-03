# Cloudflare 优选 IP

**测试地**: 中国陕西移动  
**更新频率**: 不限时更新  
**本次更新**: 2026-05-04 01:03:17

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
pkg update && pkg upgrade -y
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
- **只测速不上传 GitHub**：
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
- **测速并上传 GitHub**：

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
#### 定时任务：

1. 安装 cron 服务和后台服务管理工具
```bash
pkg install cronie termux-services -y
```

2. 重启 Termux 软件（彻底关闭并重新打开）

  - 启动 cron 服务并设置开机自启

启动并设置自启：
```bash
sv-enable crond
```
停止运行：
```bash
sv-down crond
```
彻底禁用自启：
```bash
sv-disable crond
```
手动开启：
```bash
sv up crond
```
手动关闭：
```bash
sv down crond
```

3. 编写一个简单的启动脚本 (auto.sh)：

因为脚本运行需要模拟输入，在 cloudflare_ip 目录下建个 auto.sh：
```bash
nano auto.sh
```
粘贴以下代码保存，代码设置了循环，如果上传失败说明可能网络波动，会重新尝试运行，默认3次：

```bash
#!/bin/bash

# 1. 进入项目目录
cd /data/data/com.termux/files/home/cloudflare_ip

# 2. 设置上传失败后最大尝试次数
MAX_RETRIES=3
RETRY_COUNT=0

# 3. 开始循环尝试
while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    RETRY_COUNT=$((RETRY_COUNT + 1))
    
    echo "正在进行第 $RETRY_COUNT 次运行尝试..."

    # 运行主脚本模式2（1表示：本地测速不上传，2表示：测速并上传），并捕获它的退出状态
    bash linux_start.sh <<EOF
2
EOF

    # $? 是上一条命令的退出状态码，0 代表成功
    if [ $? -eq 0 ]; then
        echo "恭喜！脚本运行并上传成功。"
        exit 0
    else
        echo "哎呀，第 $RETRY_COUNT 次尝试失败（可能是网络波动）。"
        
        if [ $RETRY_COUNT -lt $MAX_RETRIES ]; then
            echo "等待 60 秒后进行下一次重试..."
            sleep 60
        else
            echo "已经连续尝试 $MAX_RETRIES 次均失败，任务终止。请检查网络或 GitHub Token。"
            exit 1
        fi
    fi
done
```

4. 赋予脚本执行权限：
```bash
chmod +x auto.sh
```

5. 设置定时任务：
```bash
crontab -e
```

添加一行：
```bash
30 4 * * * /data/data/com.termux/files/home/cloudflare_ip/auto.sh >> /data/data/com.termux/files/home/cloudflare_ip/cron_log.log 2>&1
```
表示每天凌晨 4：30 自动跑测速并上传，cron_log.log 为日志文件，万一哪天没成功，可以进行查看原因。

调整运行频率可以修改比如：

0 * * * * ： 表示每小时整点更新一次

*/30 * * * * ： 表示半小时更新一次

0 */6 * * * ： 表示6小时更新一次

> GitHub 限制：如果你过于频繁地推送（Push）到 GitHub（比如每几分钟一次），可能会触发 GitHub 的滥用检测，或者让你的 Commit 历史变得异常臃肿（全是测速日志）。

> IP 更新频率：Cloudflare 的边缘 IP 变动其实没那么快。一天一次固定时间也行，通常 4 小时或 6 小时跑一次也可以，如果你怕运营商发力，可以适当把频率调快一些，但是最好不要太快，设备耗电和 GitHub 的滥用检测也是问题。

查看日志
```bash
cat ~/cloudflare_ip/cron_log.log
```
查看当前生效的任务
```bash
crontab -l
```

查看开机自启服务：
```bash
ls $PREFIX/var/service
```
查看 cron 状态：
```bash
sv status crond
```

确保显示下面内容才算成功，如果显示不是该内容，在应用管理强制关闭 Termux 应用（结束运行），重新打开，然后返回二步重新输入命令，先输入设置自启命令，再输入手动开启命令，最后强制关闭 Termux，再次重新打开软件，查看状态：

run: crond: (pid XXX) Xs; run: log: (pid XXX) Xs

6. 验证是否配置成功？
```bash
bash ~/cloudflare_ip/auto.sh
```
如果成功上传到 GitHub 则表示配置成功。

> ⚠️ 注意： 由于安卓系统会杀后台，你需要确保 Termux 开启了 Acquire wakelock（下拉通知栏那个），并且在系统设置里把 Termux 设为电池优化“无限制”。

> 建议可以使用家里的旧手机进行部署，由于 CPU 进行大规模测速（测速是非常耗电的，因为涉及高频的网络吞吐和 CPU 计算），手机电量掉得会比较快。如果你不介意耗电也可以在你常用的安卓设备或手机部署安装。

#
#### 常用快捷键与命令
| 动作 | 命令/按键 |
| :--- | :--- |
| **Nano 保存编辑** | Ctrl + O, Enter|
| **Nano 退出编辑** | Ctrl + X |
| **强行停止脚本运行** | Ctrl + C |
| **查看目录和文件名** | ls |
| **查看当前路径** | pwd |
| **进入目录** | cd <目录名> |
| **查看文件内容** | cat <文件名> |
| **新建/编辑文件内容** | nano <文件名> |
| **删除文件** | rm <文件名> |
| **重命名/移动文件** | mv <旧文件名> <新文件名> |
| **复制文件** | cp <源文件> <目标文件> |

#### 优选IP文件
| 文件名 | 文件内容 |
| :--- | :--- |
| **best_ips.txt** | 高速优选 |
| **full_ips.txt** | 所有可用 |
| **domain.txt** | 优选域名 |

#
### 电脑端 (Windows)
> 适合在本地电脑快速测速，或利用电脑闲置带宽更新仓库。

1. **环境准备**：

   - 安装 [Python 3.x](https://www.python.org/)（安装时务必勾选 **Add Python to PATH**）。

   - 安装 [Git for Windows](https://git-scm.com/)。

2. **下载项目**：

   - 在文件夹空白处右键选择 `Git Bash Here`，输入：
```bash
git clone [https://github.com/svip-s/cloudflare_ip.git](https://github.com/svip-s/cloudflare_ip.git)
cd cloudflare_ip
```

3. **运行脚本**：

   - 只测速不上传：
```bash
python update.py --no-github-sync
```
   - 自动化同步：

     - 编辑 win_start.ps1，填入你的 GITHUB_TOKEN 和 GITHUB_REPO。

     - 右键点击 win_start.ps1，选择 “使用 PowerShell 运行”。

#
### Linux 服务端 (Ubuntu/Debian/CentOS)
> 适合部署在 VPS 服务器上，实现 24h 无人值守自动更新。

1. **安装依赖** (以 Ubuntu 为例)：
```bash
sudo apt update && sudo apt install python3 python3-pip git -y
pip3 install tqdm
```

2. **部署脚本**：
```bash
git clone [https://github.com/svip-s/cloudflare_ip.git](https://github.com/svip-s/cloudflare_ip.git)
cd cloudflare_ip
chmod +x *.sh *.py
```

3. **执行与自动化**：

   - 手动运行：
```bash
bash linux_start.sh
```
   - 定时任务 (Crontab)：

     - 输入 crontab -e，添加以下内容（每天凌晨 4 点自动跑）：
```bash
0 4 * * * cd /你的目录路径/cloudflare_ip && bash linux_start.sh <<EOF
2
EOF
```

## 代码来源

仓库：[cfip](https://github.com/HandsomeMJZ/cfip)

作者：[俊臻是真俊](https://github.com/HandsomeMJZ)
