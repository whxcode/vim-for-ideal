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

; ===== CapsLock + 数字/符号 映射为 F1~F12 =====
CapsLock & 1::Send {F1}
CapsLock & 2::Send {F2}
CapsLock & 3::Send {F3}
CapsLock & 4::Send {F4}
CapsLock & 5::Send {F5}
CapsLock & 6::Send {F6}
CapsLock & 7::Send {F7}
CapsLock & 8::Send {F8}
CapsLock & 9::Send {F9}
CapsLock & 0::Send {F10}
CapsLock & -::Send {F11}   ; CapsLock + - = F11
CapsLock & =::Send {F12}   ; CapsLock + = = F12

; 按下 CapsLock + Esc 输入反引号 `
CapsLock & Esc::Send ``  ; 注意：这里用两个 ` 转义，实际发送一个 `
