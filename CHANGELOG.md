### NetworkEnhancer V4.1 Changelog

📅 Release Date: 2026-05-18

---

## DNS & WebUI Improvements

### 🌐 Custom DNS
- Added Custom DNS option in Private DNS section
- Added floating modal with smooth background blur
- Added hostname validation (blocks IPs & https:// links)
- DNS state now restores correctly after reopening WebUI

### 🔒 DNS Persistence Fix
- Fixed Private DNS showing "Off" after reopening WebUI
- WebUI now reads actual Android `private_dns_mode`
- Improved DNS state synchronization on boot

### ⚙️ uninstall.sh Cleanup
- Added automatic Private DNS reset after module uninstall
