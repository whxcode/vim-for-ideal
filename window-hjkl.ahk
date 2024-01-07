LWin::LCtrl
LCtrl::LWin


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

CapsLock & p::
Send {Backspace}
return

SetStoreCapslockMode, off
Capslock::
	KeyWait, CapsLock
	If (A_TimeSinceThisHotkey > 100000000)
		SetTimer, mainp, -1
	Else
		Return
Return

mainp:
	Return
Return
