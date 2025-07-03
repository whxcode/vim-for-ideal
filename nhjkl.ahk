#InstallKeybdHook  ; 强制启用键盘钩子
SetCapsLockState, AlwaysOff  ; 强制保持 CapsLock 关闭状态
CapsLock::Return  ; 彻底屏蔽 CapsLock 的默认功能

;交换 lctrl与lalt
LAlt::LCtrl
LCtrl::LAlt

;hjkl->左下上右移动
CapsLock & h::
Send {Left}
return

CapsLock & `;::
Send {Enter}
return
 
CapsLock & j::
Send {Down}
return
 
CapsLock & k::   
Send {Up}   
return
 
CapsLock & l::
Send {Right}
return

;删除快捷键
CapsLock & p::
Send {Backspace}
return

;桌面映射快捷键
^!h::Send ^#{Left}
^!l::Send ^#{Right}
