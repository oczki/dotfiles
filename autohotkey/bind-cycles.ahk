; Bind Cycles - meant to enhance Steam Controller functionality.
; Pressing the same button multiple times will send a different key in a cycle,
; e.g. making D-Pad Down button cycle between weapons in slots 1, 2, 3.

#persistent
#singleinstance force
settitlematchmode regex

select(key, counter)
{
  if (islabel(key counter))
    return % key counter
}

count(key, byref counter)
{
  counter++
  if (!islabel(key counter))
    counter := 1
  return
}


; Ctrl + Alt + Shift + Q
; [1, 2, 3]

q1:
  send 1
  return
q2:
  send 2
  return
q3:
  send 3
  return


; Ctrl + Alt + Shift + W
; [ctrl+n, hello world enter, scroll down, message box]

w1:
  send ^n
  return
w2:
  send Hello World{Enter}
  return
w3:
  send {WheelDown 3}
  return
w4:
  msgbox That's all, folks!
  return


; Counters

global qCounter := 0
global wCounter := 0


; Hotkeys (! Alt, ^ Ctrl, + Shift, # Win)

!^+q::
  count("q", qCounter)
  goto % select("q", qCounter)
return

#ifwinactive My Awesome Game Window Name
!^+w::
  count("w", wCounter)
  goto % select("w", wCounter)
return
#ifwinactive
