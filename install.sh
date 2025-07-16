SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

# TouchEnhancer Magisk Module Installer
# Author: @RAAJK20Pro

print_modname() {
  ui_print "    ●=================● ●=================●"
  sleep 2
  ui_print "[~] Checking Your Device"
  ui_print " Device -> $(getprop ro.product.system.device)"
  sleep 1
  ui_print " Kernel -> $(uname -r)"
  sleep 1
  ui_print " Brand -> $(getprop ro.product.system.brand)"
  sleep 1
  ui_print " SELinux Status : $(getenforce)"
  ui_print "    ●=================● ●=================●"
  sleep 1
  ui_print "    ●==● 𝐓𝐡𝐞 𝐡𝐚𝐩𝐩𝐢𝐞𝐬𝐭 𝐩𝐞𝐨𝐩𝐥𝐞 𝐝𝐨𝐧’𝐭 𝐡𝐚𝐯𝐞 𝐭𝐡𝐞 𝐛𝐞𝐬𝐭 𝐨𝐟"
  ui_print "                    𝐞𝐯𝐞𝐫𝐲𝐭𝐡𝐢𝐧𝐠 "
  ui_print "        𝐭𝐡𝐞𝐲 𝐣𝐮𝐬𝐭 𝐦𝐚𝐤𝐞 𝐭𝐡𝐞 𝐛𝐞𝐬𝐭 𝐨𝐟 𝐞𝐯𝐞𝐫𝐲𝐭𝐡𝐢𝐧𝐠. ●==●"
  sleep 3
  ui_print "______________________________________________"
  ui_print ""
  busybox sleep 1
  ui_print " The Author:- 🚩RAAJK20Pro 🇮🇳"
  ui_print "______________________________________________"
  sleep 1
  ui_print "  [𝐒𝐜𝐫𝐢𝐩𝐭] >> 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐢𝐧𝐠....𝐍𝐞𝐭𝐰𝐨𝐫𝐤𝐄𝐧𝐡𝐚𝐧𝐜𝐞𝐫.... "
  sleep 3
  ui_print "  [𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐞𝐝 ] >> ✅ "
  sleep 2
  ui_print ""
  ui_print "    ●=================● ●=================●"
  ui_print ""
  ui_print "    ✴️Kernel-Level Network Optimization for Android ✴️"
}

on_install() {
  unzip -o "$ZIPFILE" 'post-fs-data.sh' -d $MODPATH >&2
  unzip -o "$ZIPFILE" 'service.sh' -d $MODPATH >&2
  unzip -o "$ZIPFILE" 'data/*' -d $MODPATH >&2
  unzip -o "$ZIPFILE" 'system.prop' -d $MODPATH >&2
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  unzip -o "$ZIPFILE" 'common/*' -d $MODPATH/common >&2
}

set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  [ -f "$MODPATH/service.sh" ] && set_perm "$MODPATH/service.sh" 0 0 0755
}

# Main Execution
on_install
set_permissions