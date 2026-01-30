# 🌐 NetworkEnhancer v4 — Changelog

## ✅ Added
- **Auto Queue Discipline Selection**
  - Kernel support ke according auto select:
    - `fq` → `fq_codel` → `pfifo_fast`
  - Prevents bufferbloat & network-induced input lag
- **Kernel-aware Qdisc apply**
  - Sirf active interfaces (`wlan*`, `rmnet*`) pe apply
- **Network-only build.prop support**
  - Minimal TCP behavior tuning
  - No DNS forcing, no fake buffer props
- **Improved logging system**
  - Short timestamps (`HH:MM`)
  - Clear success / warning states
- **Read-only sysfs detection**
  - Prevents silent failures on locked nodes

---

## 🔧 Changed
- **Core backlog tuning**
  - `netdev_max_backlog`: `4096 → 1000`
  - Reduces packet queue delay & CPU spikes
- **MTU optimization refined**
  - Forced `1400` ❌ → Safe conditional `1500` ✅
- **TCP retry strategy balanced**
  - Less aggressive, better long-session stability
- **Congestion control logic simplified**
  - Priority: `bbr2 → bbr → cubic`
- **TCP reuse behavior**
  - `tcp_tw_reuse` disabled to avoid random disconnects
- **Execution flow cleaned**
  - Better locking, no duplicate runs

---

## ❌ Removed
- Over-aggressive buffer inflation (V3 issue)
- Forced MTU fragmentation logic
- Route flush abuse
- Excess ARP / orphan cleanup
- Benchmark-focused tweaks causing FPS drops
- Outdated / placebo-style tuning

---

## 🐞 Fixed
- FPS drops during gameplay
- Random ping spikes & jitter
- Input lag caused by bufferbloat
- Unstable behavior on LTE / 5G networks
- Long-session instability

---

## 🎮 Gaming Impact
- ✔️ More consistent ping
- ✔️ Lower jitter
- ✔️ Better hit registration feel
- ✔️ Stable FPS
- ✔️ Suitable for PUBG / BGMI / CODM

---

## ⚠️ Note
This update prioritizes **stability & consistency**,  
not fake “magic ping” claimsfixix
