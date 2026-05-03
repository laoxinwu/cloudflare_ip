# ⚡ Cloudflare 优选 IP 自动化系统

> **本地测速，拒绝盲选。** 专门为移动端及家庭宽带打造的 Cloudflare IP 优选工具。

---

### 📊 运行状态
| 维度 | 信息 |
| :--- | :--- |
| **测试地点** | 📍 中国·陕西移动 |
| **更新频率** | 🕒 不限时自动更新 |
| **最后更新** | 📅 2026-05-03 07:28:38 |

---

### 🔗 订阅链接
您可以直接将以下链接复制到您的代理工具中：

* 🚀 **高速优选**：`https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/best_ips.txt`
* 🌐 **所有可用**：`https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/full_ips.txt`
* 🏷️ **优选域名**：`https://raw.githubusercontent.com/svip-s/cloudflare_ip/refs/heads/main/domain.txt`

---

### 📖 订阅链接使用方法 (以 EdgeTunnel 为例)
1. 复制上方 **高速优选** 链接。
2. 进入 EdgeTunnel 后台，选择 **“优选订阅模式 - 自定义”**。
3. 在 **订阅接口 / API / URL** 框内粘贴该链接。
4. 点击验证可用性，并选择 **“追加 API”**。
5. 保存并点击重新订阅即可生效。

---

### 🛠️ 脚本使用指南 (Android Termux)

#### 1️⃣ 环境初始化
> ⚠️ **运行前必读**：请关闭所有 VPN 或代理工具，确保手机处于直连状态，否则测速结果无效。

* **系统设置**：关闭电池优化，设置 Termux 省电策略为 **“无限制”**。
* **唤醒锁定**：下拉通知栏点击 `Acquire wakelock`，防止休眠导致脚本中断。

```bash
# 更新环境并安装工具
pkg update && pkg upgrade -y
pkg install python git -y
pip install tqdm

# 拉取仓库并设置权限
git clone [https://github.com/svip-s/cloudflare_ip.git](https://github.com/svip-s/cloudflare_ip.git)
cd cloudflare_ip
chmod +x *.sh *.py
termux-setup-storage
touch README.MD
