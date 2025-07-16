#!/system/bin/sh
# "Do more of what makes you happy."
# =============================================
# Author: (@RAAJK20Pro) Telegram :- https://t.me/Raphaelgamers
# ==============================================
# (https://github.com/RAAJK20Pro/NetworkEnhancer)
# ==============================================
# Wait until boot completes
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

sleep 5

# Standard Write Function
write() {
    if [ $# -ne 2 ]; then
        echo "Usage: write <file_path> <value>"
        return 1
    fi

    file="$1"
    value="$2"
    retries=3
    delay=1

    if [ ! -f "$file" ]; then
        echo "Error: '$file' does not exist or is not a regular file."
        return 1
    fi

    chmod +w "$file" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Error: Failed to add write permissions to '$file'."
        return 1
    fi

    i=1
    while [ "$i" -le "$retries" ]; do
        if echo "$value" > "$file" 2>/dev/null; then
            echo "Successfully wrote '$value' to '$file'."
            return 0
        fi
        echo "Attempt $i of $retries failed. Retrying in $delay seconds..."
        sleep $delay
        i=$((i + 1))
    done

    echo "Error: Failed to write '$value' to '$file' after $retries attempts."
    return 1
}

# =============================================
# LOGGING CONFIGURATION
# =============================================
LOG_FILE="/data/local/tmp/NetworkEnhancer.log"
SDCARD_LOG="/sdcard/NetworkEnhancer.log"

# Clear previous logs
: > "$LOG_FILE"
: > "$SDCARD_LOG"

exec 2>>"$LOG_FILE"

# Emoji Constants
SUCCESS="✅"
FAILED="❌"
UNSUPPORTED="🚫"
WARNING="⚠️"
NETWORK="🌐"
TCP="📡"
UDP="📶"
SECURITY="🔒"
MEMORY="🧠"

# Enhanced Logging
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE" >> "$SDCARD_LOG"
}

RAAJK20Pro() {
  local path="$1"
  local value="$2"
  local description="$3"
  local emoji="$4"
  
  if [ ! -f "$path" ]; then
    log "$UNSUPPORTED $description (KERNEL NOT SUPPORTED)"
    return 2
  fi
  
  if ! echo "$value" > "$path" 2>>"$LOG_FILE"; then
    log "$FAILED $description (FAILED)"
    return 1
  fi
  
  log "$emoji $SUCCESS $description"
  return 0
}

# =============================================
# INITIALIZATION
# =============================================

log "=== 𝗡𝗲𝘁𝘄𝗼𝗿𝗸𝗘𝗻𝗵𝗮𝗻𝗰𝗲𝗿 ==="
log "Device: $(getprop ro.product.model)"
log "Android: $(getprop ro.build.version.release)"
log "Kernel: $(uname -a)"
log "Started at $(date)"
log ""

# =============================================
log "==== 𝗖𝗢𝗥𝗘 𝗡𝗘𝗧𝗪𝗢𝗥𝗞 𝗕𝗨𝗙𝗙𝗘𝗥𝗦 (𝗙𝗔𝗦𝗧𝗘𝗥 𝗣𝗔𝗖𝗞𝗘𝗧 𝗣𝗥𝗢𝗖𝗘𝗦𝗦𝗜𝗡𝗚) ===="
# **1. CORE NETWORK BUFFERS (FASTER PACKET PROCESSING - OPTIMIZED VERSION)**
RAAJK20Pro "/proc/sys/net/core/netdev_max_backlog" "4096" "𝗻𝗲𝘁𝗱𝗲𝘃_𝗺𝗮𝘅_𝗯𝗮𝗰𝗸𝗹𝗼𝗴" "$NETWORK"
RAAJK20Pro "/proc/sys/net/core/rmem_default" "262144" "𝗿𝗺𝗲𝗺_𝗱𝗲𝗳𝗮𝘂𝗹𝘁" "$NETWORK"
RAAJK20Pro "/proc/sys/net/core/rmem_max" "524288" "𝗿𝗺𝗲𝗺_𝗺𝗮𝘅" "$NETWORK"
RAAJK20Pro "/proc/sys/net/core/wmem_default" "262144" "𝘄𝗺𝗲𝗺_𝗱𝗲𝗳𝗮𝘂𝗹𝘁" "$NETWORK"
RAAJK20Pro "/proc/sys/net/core/wmem_max" "524288" "𝘄𝗺𝗲𝗺_𝗺𝗮𝘅" "$NETWORK"
RAAJK20Pro "/proc/sys/net/core/somaxconn" "4096" "𝘀𝗼𝗺𝗮𝘅𝗰𝗼𝗻𝗻" "$NETWORK"
RAAJK20Pro "/proc/sys/net/core/optmem_max" "204800" "𝗼𝗽𝘁𝗺𝗲𝗺_𝗺𝗮𝘅" "$NETWORK"

log "====𝗧𝗖𝗣 𝗨𝗟𝗧𝗥𝗔-𝗥𝗘𝗦𝗣𝗢𝗡𝗦𝗜𝗩𝗘 𝗠𝗢𝗗𝗘===="
# **2. TCP ULTRA-RESPONSIVE MODE (OPTIMIZED)**
RAAJK20Pro "/proc/sys/net/ipv4/tcp_slow_start_after_idle" "0" "𝘁𝗰𝗽_𝘀𝗹𝗼𝘄_𝘀𝘁𝗮𝗿𝘁_𝗮𝗳𝘁𝗲𝗿_𝗶𝗱𝗹𝗲" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_low_latency" "1" "𝘁𝗰𝗽_𝗹𝗼𝘄_𝗹𝗮𝘁𝗲𝗻𝗰𝘆" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_timestamps" "0" "𝘁𝗰𝗽_𝘁𝗶𝗺𝗲𝘀𝘁𝗮𝗺𝗽𝘀" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_sack" "1" "𝘁𝗰𝗽_𝘀𝗮𝗰𝗸" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_fack" "1" "𝘁𝗰𝗽_𝗳𝗮𝗰𝗸" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_window_scaling" "1" "𝘁𝗰𝗽_𝘄𝗶𝗻𝗱𝗼𝘄_𝘀𝗰𝗮𝗹𝗶𝗻𝗴" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_moderate_rcvbuf" "1" "𝘁𝗰𝗽_𝗺𝗼𝗱𝗲𝗿𝗮𝘁𝗲_𝗿𝗰𝘃𝗯𝘂𝗳" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_no_metrics_save" "1" "𝘁𝗰𝗽_𝗻𝗼_𝗺𝗲𝘁𝗿𝗶𝗰𝘀_𝘀𝗮𝘃𝗲" "$TCP"

# **3. TCP ALGORITHM **
TCP_CC_FILE="/proc/sys/net/ipv4/tcp_congestion_control"
AVAILABLE_CC=$(cat /proc/sys/net/ipv4/tcp_available_congestion_control 2>/dev/null)
PREFERRED_TCP_ALGOS="bbr2 bbr westwood cubic reno"

for algo in $PREFERRED_TCP_ALGOS; do
    if echo "$AVAILABLE_CC" | grep -qw "$algo"; then
        RAAJK20Pro "$TCP_CC_FILE" "$algo" "𝗧𝗖𝗣_𝗔𝗟𝗚𝗢𝗥𝗜𝗧𝗛𝗠 ➜ $algo" "$TCP"
        break
    fi
done

log "====𝗖𝗢𝗡𝗡𝗘𝗖𝗧𝗜𝗢𝗡 𝗧𝗜𝗠𝗘𝗢𝗨𝗧 𝗢𝗣𝗧𝗜𝗠𝗜𝗭𝗔𝗧𝗜𝗢𝗡𝗦===="
# **4. CONNECTION TIMEOUT OPTIMIZATIONS**
RAAJK20Pro "/proc/sys/net/ipv4/tcp_syn_retries" "2" "𝘁𝗰𝗽_𝘀𝘆𝗻_𝗿𝗲𝘁𝗿𝗶𝗲𝘀" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_synack_retries" "2" "𝘁𝗰𝗽_𝘀𝘆𝗻𝗮𝗰𝗸_𝗿𝗲𝘁𝗿𝗶𝗲𝘀" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_retries2" "3" "𝘁𝗰𝗽_𝗿𝗲𝘁𝗿𝗶𝗲𝘀𝟮" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_fin_timeout" "15" "𝘁𝗰𝗽_𝗳𝗶𝗻_𝘁𝗶𝗺𝗲𝗼𝘂𝘁" "$TCP"

log "====𝗦𝗢𝗖𝗞𝗘𝗧 𝗕𝗨𝗙𝗙𝗘𝗥𝗦 (𝗙𝗔𝗦𝗧𝗘𝗥 𝗣𝗔𝗖𝗞𝗘𝗧 𝗧𝗥𝗔𝗡𝗦𝗙𝗘𝗥)===="
# **5. SOCKET BUFFERS (FASTER PACKET TRANSFER - OPTIMIZED)**
RAAJK20Pro "/proc/sys/net/ipv4/tcp_rmem" "4096 87380 524288" "𝘁𝗰𝗽_𝗿𝗺𝗲𝗺" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_wmem" "4096 65536 524288" "𝘁𝗰𝗽_𝘄𝗺𝗲𝗺" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/udp_rmem_min" "8192" "𝘂𝗱𝗽_𝗿𝗺𝗲𝗺_𝗺𝗶𝗻" "$UDP"
RAAJK20Pro "/proc/sys/net/ipv4/udp_wmem_min" "8192" "𝘂𝗱𝗽_𝘄𝗺𝗲𝗺_𝗺𝗶𝗻" "$UDP"

log "====𝗙𝗔𝗦𝗧 𝗖𝗢𝗡𝗡𝗘𝗖𝗧𝗜𝗢𝗡 𝗥𝗘𝗨𝗦𝗘 (𝗟𝗘𝗦𝗦 𝗗𝗘𝗟𝗔𝗬)===="
# **6. FAST CONNECTION REUSE (LESS DELAY)**
RAAJK20Pro "/proc/sys/net/ipv4/tcp_tw_reuse" "1" "𝘁𝗰𝗽_𝘁𝘄_𝗿𝗲𝘂𝘀𝗲" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_max_tw_buckets" "262144" "𝘁𝗰𝗽_𝗺𝗮𝘅_𝘁𝘄_𝗯𝘂𝗰𝗸𝗲𝘁𝘀" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_max_syn_backlog" "8192" "𝘁𝗰𝗽_𝗺𝗮𝘅_𝘀𝘆𝗻_𝗯𝗮𝗰𝗸𝗹𝗼𝗴" "$TCP"
RAAJK20Pro "/proc/sys/net/ipv4/tcp_fastopen" "3" "𝘁𝗰𝗽_𝗳𝗮𝘀𝘁𝗼𝗽𝗲𝗻" "$TCP"

log "====𝗔𝗥𝗣 𝗖𝗔𝗖𝗛𝗘 𝗢𝗣𝗧𝗜𝗠𝗜𝗭𝗔𝗧𝗜𝗢𝗡 (𝗙𝗔𝗦𝗧𝗘𝗥 𝗟𝗢𝗖𝗔𝗟 𝗡𝗘𝗧𝗪𝗢𝗥𝗞)===="
# **7. ARP CACHE OPTIMIZATION (FASTER LOCAL NETWORK)**
RAAJK20Pro "/proc/sys/net/ipv4/neigh/default/gc_thresh1" "1024" "𝗴𝗰_𝘁𝗵𝗿𝗲𝘀𝗵𝟭" "$NETWORK"
RAAJK20Pro "/proc/sys/net/ipv4/neigh/default/gc_thresh2" "2048" "𝗴𝗰_𝘁𝗵𝗿𝗲𝘀𝗵𝟮" "$NETWORK"
RAAJK20Pro "/proc/sys/net/ipv4/neigh/default/gc_thresh3" "4096" "𝗴𝗰_𝘁𝗵𝗿𝗲𝘀𝗵𝟯" "$NETWORK"

log "====𝗦𝗘𝗖𝗨𝗥𝗜𝗧𝗬 𝗧𝗪𝗘𝗔𝗞𝗦 (𝗡𝗢 𝗣𝗘𝗥𝗙𝗢𝗥𝗠𝗔𝗡𝗖𝗘 𝗟𝗢𝗦𝗦)===="
# **8. SECURITY TWEAKS (NO PERFORMANCE LOSS)**
RAAJK20Pro "/proc/sys/net/ipv4/tcp_syncookies" "1" "𝘁𝗰𝗽_𝘀𝘆𝗻𝗰𝗼𝗼𝗸𝗶𝗲𝘀" "$SECURITY"
RAAJK20Pro "/proc/sys/net/ipv4/conf/all/rp_filter" "1" "𝗿𝗽_𝗳𝗶𝗹𝘁𝗲𝗿" "$SECURITY"
RAAJK20Pro "/proc/sys/net/ipv4/icmp_echo_ignore_all" "0" "𝗶𝗰𝗺𝗽_𝗲𝗰𝗵𝗼_𝗶𝗴𝗻𝗼𝗿𝗲_𝗮𝗹𝗹" "$SECURITY"

log "====𝗙𝗟𝗨𝗦𝗛 𝗥𝗢𝗨𝗧𝗘𝗦 & 𝗖𝗟𝗘𝗔𝗥 𝗖𝗔𝗖𝗛𝗘===="
# **9. FLUSH ROUTES & CLEAR CACHE**
RAAJK20Pro "/proc/sys/net/ipv4/route/flush" "1" "𝗳𝗹𝘂𝘀𝗵" "$NETWORK"

# =============================================
# FINALIZATION
# =============================================

log "=== 𝗢𝗣𝗧𝗜𝗠𝗜𝗭𝗔𝗧𝗜𝗢𝗡 𝗦𝗨𝗠𝗠𝗔𝗥𝗬 ==="
log "Successful tweaks: $(grep -c "$SUCCESS" "$LOG_FILE")"
log "Unsupported features: $(grep -c "$UNSUPPORTED" "$LOG_FILE")"
log "Failed attempts: $(grep -c "$FAILED" "$LOG_FILE")"
log ""
log "=== 𝗧𝗖𝗣 𝗧𝗪𝗘𝗔𝗞𝗦 𝗖𝗢𝗠𝗣𝗟𝗘𝗧𝗘𝗗 ✔️ ==="
log "== 𝗔𝘂𝘁𝗵𝗼𝗿: (@RAAJK20Pro) =="
log "== 𝗧𝗲𝗹𝗲𝗴𝗿𝗮𝗺:- https://t.me/KernelEnhancer =="
log "Finished at $(date)"

exit 0